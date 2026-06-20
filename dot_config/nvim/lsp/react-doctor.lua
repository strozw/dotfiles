return {
  -- cmd = { "npx", "react-doctor@latest", "experimental-lsp", "--stdio" },
  cmd = function(dispatchers, config)
    local cmd = 'react-doctor'

    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end

    if vim.fn.executable(cmd) == 1 then
      cmd = "npx react-doctor@latest"
    end

    -- return { cmd, "experimental-lsp", "--stdio" }
    return vim.lsp.rpc.start({ cmd, 'experimental-lsp' }, dispatchers)
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "doctor.config.ts", "doctor.config.js" },
}
