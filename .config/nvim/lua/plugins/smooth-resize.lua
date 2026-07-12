---@type LazySpec
return {
  "aronjohanns/smooth-resize.nvim",
  config = function()
    require("smooth-resize").setup({
      disabled_fts = {}
    })
  end
}
