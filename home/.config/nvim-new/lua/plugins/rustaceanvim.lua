---@module "lazy"
---@module "rustaceanvim"

---@type LazySpec[]
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function() end,
  },
}
