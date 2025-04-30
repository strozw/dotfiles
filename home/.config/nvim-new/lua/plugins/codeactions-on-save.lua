return {
  "fnune/codeactions-on-save.nvim",
  dependencies = { "neovim/nvim-lspconfig", },
  config = function()
    local cos = require("codeactions-on-save")

    -- cos.register({ "*.py" }, { "source.organizeImports" })
    -- cos.register({ "*.ts", "*.tsx" }, { "source.organizeImports.biome", "source.fixAll" })
  end
}
