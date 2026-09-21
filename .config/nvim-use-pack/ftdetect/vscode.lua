vim.filetype.add({
  pattern = {
    -- .vscode/*.json files allow comments
    ['.*/%.vscode/.*%.json'] = 'jsonc',
  },
})
