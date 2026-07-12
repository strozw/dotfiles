---@type LazySpec
return {
  'blazejkustra/react-compiler-marker',
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  build = './scripts/build-nvim.sh',
  config = function()
    require('react-compiler-marker').setup({})
  end
}
