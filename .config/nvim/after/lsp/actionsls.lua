local function run(cmd)
  local result = vim.system(cmd, { text = true }):wait()
  if result.code ~= 0 then return nil end
  local out = (result.stdout or ""):gsub("%s+$", "")
  return out ~= "" and out or nil
end

local function get_github_token()
  return run({ "gh", "auth", "token" })
end

-- Only accept GitHub-safe owner/repo characters (alphanumerics, '-', '_', '.').
-- Prevents shell metacharacters from a hostile remote URL flowing into commands.
local SAFE = "^[%w%-_%.]+$"

local function parse_github_remote(url)
  if not url or url == "" then return nil end

  -- SSH format: git@github.com:owner/repo.git
  local owner, repo = url:match("git@github%.com:([^/]+)/([^/%.]+)")
  if not (owner and repo) then
    -- HTTPS format: https://github.com/owner/repo.git
    owner, repo = url:match("github%.com/([^/]+)/([^/%.]+)")
  end
  if not (owner and repo) then return nil end

  repo = repo:gsub("%.git$", "")
  if not owner:match(SAFE) or not repo:match(SAFE) then return nil end
  return owner, repo
end

local function get_repo_info(owner, repo)
  local result = run({
    "gh", "repo", "view", owner .. "/" .. repo,
    "--json", "id,owner",
    "--template", "{{.id}}\t{{.owner.type}}",
  })
  if not result then return nil end

  local id, owner_type = result:match("^(%d+)\t(.+)$")
  if id then
    return {
      id = tonumber(id),
      organizationOwned = owner_type == "Organization",
    }
  end
  return nil
end

local function get_repos_config()
  local git_root = run({ "git", "rev-parse", "--show-toplevel" })
  if not git_root then return nil end

  local remote_url = run({ "git", "remote", "get-url", "origin" })
  if not remote_url then return nil end

  local owner, name = parse_github_remote(remote_url)
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
  filetypes = { "yaml.ghactions" },
  root_markers = { ".git" },
  init_options = {
    -- Optional: provide a GitHub token and repo context for added functionality
    -- (e.g., repository-specific completions)
    sessionToken = get_github_token(),
    repos = get_repos_config(),
  },
}
