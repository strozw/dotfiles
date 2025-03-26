---@module "lazy"
---@module "rustaceanvim"

---@type rustaceanvim.Opts
vim.g.rustaceanvim = function()
  return {
    server = {
      cmd = function()
        local mason_registry = require("mason-registry")
        if mason_registry.is_installed("rust-analyzer") then
          -- This may need to be tweaked depending on the operating system.
          local ra = mason_registry.get_package("rust-analyzer")
          local ra_filename = ra:get_receipt():get().links.bin["rust-analyzer"]
          return { ("%s/%s"):format(ra:get_install_path(), ra_filename or "rust-analyzer") }
        else
          -- global installation
          return { "rust-analyzer" }
        end
      end,
    },
  }
end

---@type LazySpec[]
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function() end,
  },
}
