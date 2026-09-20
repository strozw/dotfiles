---@see https://github.com/actions/languageservices/tree/main/languageserver

--- Run a command and return its trimmed stdout, or "" on failure.
---@param cmd string[]
---@param cwd string?
---@return string
local function sh(cmd, cwd)
  local out = vim.system(cmd, { cwd = cwd, text = true }):wait()
  return out.code == 0 and vim.trim(out.stdout or "") or ""
end

local function get_github_token()
  local token = sh({ "gh", "auth", "token" })
  return token ~= "" and token or nil
end

local function parse_github_remote(url)
  if not url or url == "" then return nil end

  -- SSH format: git@github.com:owner/repo.git
  local owner, repo = url:match("git@github%.com:([^/]+)/([^/%.]+)")
  if owner and repo then
    return owner, repo:gsub("%.git$", "")
  end

  -- HTTPS format: https://github.com/owner/repo.git
  owner, repo = url:match("github%.com/([^/]+)/([^/%.]+)")
  if owner and repo then
    return owner, repo:gsub("%.git$", "")
  end

  return nil
end

-- `gh repo view` is a network round-trip (~1.3s), so remember the answer for
-- the lifetime of the session. `false` records a lookup that already failed.
local repo_info_cache = {}

local function get_repo_info(owner, repo)
  local key = owner .. "/" .. repo

  if repo_info_cache[key] == nil then
    -- `gh repo view --json id` returns the GraphQL node ID ("R_kgDO...") and
    -- exposes no `owner.type`; the language server wants the numeric REST ID,
    -- so query the REST endpoint directly.
    local result = sh({
      "gh", "api", "repos/" .. key,
      "--jq", "[(.id|tostring), .owner.type] | @tsv",
    })

    local id, owner_type = result:match("^(%d+)\t(.+)$")
    repo_info_cache[key] = id and {
      id = tonumber(id),
      organizationOwned = owner_type == "Organization",
    } or false
  end

  return repo_info_cache[key] or nil
end

---@param root_dir string?
local function get_repos_config(root_dir)
  local git_root = sh({ "git", "rev-parse", "--show-toplevel" }, root_dir)
  if git_root == "" then return nil end

  local owner, name = parse_github_remote(sh({ "git", "remote", "get-url", "origin" }, root_dir))
  if not owner or not name then return nil end

  local info = get_repo_info(owner, name)

  return {
    {
      id = info and info.id or 0,
      owner = owner,
      name = name,
      organizationOwned = info and info.organizationOwned or false,
      workspaceUri = "file://" .. git_root,
    },
  }
end

return {
  cmd = { "actions-languageserver", "--stdio" },
  filetypes = { "yaml.github-actions" },

  -- `root_dir` ensures that the LSP does not attach to all yaml files
  root_dir = function(bufnr, on_dir)
    local parent = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if
        vim.endswith(parent, '/.github/workflows')
        or vim.endswith(parent, '/.forgejo/workflows')
        or vim.endswith(parent, '/.gitea/workflows')
    then
      on_dir(parent)
    end
  end,

  -- Resolved here rather than in `init_options`: `vim.lsp.enable()` eagerly
  -- loads this file at startup, so shelling out to `gh`/`git` at the top level
  -- would cost ~950ms on every launch. `before_init` runs only once the server
  -- actually starts, and gets the resolved `root_dir` instead of nvim's cwd.
  before_init = function(params, config)
    params.initializationOptions = vim.tbl_extend("force", params.initializationOptions or {}, {
      -- Optional: provide a GitHub token and repo context for added functionality
      -- (e.g., repository-specific completions)
      sessionToken = get_github_token(),
      repos = get_repos_config(config.root_dir),
    })
  end,

  -- allow the lsp to register capabilities on demand
  capabilities = {
    workspace = {
      didChangeWorkspaceFolders = {
        dynamicRegistration = true,
      },
    },
  },

  -- given a file:// protocol path as built using the workspaceUri above,
  -- resolve path to disk path and provide filecontents when lsp requests this
  -- action https://github.com/actions/languageservices/blob/main/languageserver/src/request.ts#L2
  -- taken from https://github.com/neovim/nvim-lspconfig/blob/75e49cfa588a89ca667d767c0afef3ceac205faa/lsp/gh_actions_ls.lua#L33-L48
  handlers = {
    ["actions/readFile"] = function(_, result)
      if type(result.path) ~= "string" then
        return nil, nil
      end
      local file_path = vim.uri_to_fname(result.path)
      if vim.fn.filereadable(file_path) == 1 then
        local f = assert(io.open(file_path, "r"))
        local text = f:read("*a")
        f:close()

        return text, nil
      end
      return nil, nil
    end,
  },
}
