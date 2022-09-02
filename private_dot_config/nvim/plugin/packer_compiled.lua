-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/satoru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/satoru/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/satoru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/satoru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/satoru/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\n\0'\2\v\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\n\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2\t\t\t\t\tlet g:fern#default_hidden=1\n\t\t\t\t\tlet g:fern#width=50\n\t\t\t\t\tlet g:fern#renderer='nerdfont'\n\n\t\t\t\t\tfunction! FernInit() abort\n\t\t\t\t\t\tnmap <buffer> <C-L> :TmuxNavigateRight<CR>\n\t\t\t\t\tendfunction\n\n\t\t\t\t\taugroup FernEvents\n\t\t\t\t\t\tautocmd!\n\t\t\t\t\t\tautocmd FileType fern call FernInit()\n\t\t\t\t\taugroup END\n\t\t\t\t2 nnoremap <silent> <space>x :BufferClose<CR> \14nvim_exec\1\0\2\vsilent\2\fnoremap\2\20:BufferPrev<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\2\20:BufferNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-mocword"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-mocword",
    url = "https://github.com/yutkat/cmp-mocword"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copypath.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/copypath.vim",
    url = "https://github.com/vim-scripts/copypath.vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\b\0006\4\0\0'\6\3\0B\4\2\0029\4\4\0045\6\6\0005\a\5\0=\a\a\6B\4\2\2=\4\t\3=\3\v\2B\0\2\1K\0\1\0\vselect\1\0\0\14telescope\1\0\0\18layout_config\1\0\0\1\0\2\vheight\3\20\nwidth\3d\15get_cursor\21telescope.themes\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["fern-git-status.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fern-git-status.vim",
    url = "https://github.com/lambdalisue/fern-git-status.vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fern-hijack.vim",
    url = "https://github.com/lambdalisue/fern-hijack.vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim",
    url = "https://github.com/lambdalisue/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\f\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\n\0)\1\1\0=\1\v\0K\0\1\0\"fern_disable_startup_warnings\6g\1\0\2\vsilent\2\fnoremap\0020:Fern . -drawer -width=50 -reveal=%<CR><CR>\ass\1\0\2\vsilent\2\fnoremap\2*:Fern . -drawer -width=50 -toggle<CR>\t<F2>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\b\0\0\5\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0\rrelative\vcursor&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\18virt_text_pos\beol\14virt_text\2\ndelay\3�\a\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\fkeymaps\tn [c\1\2\1\0001&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\texpr\2\tn ]c\1\2\1\0001&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\texpr\2\1\0\1\fnoremap\2\nsigns\1\0\t\20max_file_length\3��\2\14word_diff\1\nnumhl\1\vlinehl\1\23current_line_blame\1\24attach_to_untracked\2\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/glyph-palette.vim",
    url = "https://github.com/lambdalisue/glyph-palette.vim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\18virtual_lines\1\0\1\22only_current_line\2\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\b\0\"\00036\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1-�9\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0005\a\15\0=\a\16\6>\6\3\5=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0004\5\0\0=\5\f\0044\5\0\0=\5\17\0045\5\28\0=\5\19\0045\5\29\0=\5\21\0044\5\0\0=\5\23\0044\5\0\0=\5\25\4=\4\30\0034\4\0\0=\4\31\0035\4 \0=\4!\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\tfern\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\4\0\0\17g:coc_status!require'lsp-status'.status()\rfilename\14lualine_b\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\15tokyonight\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\0\vformat\bbuf\blsp\bvim�\14\1\2\t\0040\0�\1-\2\0\0009\2\0\2\18\4\0\0B\2\2\1-\2\1\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\0016\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0005\b\t\0B\2\6\0016\2\1\0009\2\2\0029\2\n\2\18\4\1\0'\5\v\0'\6\f\0B\2\4\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\25\0'\a\26\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\27\0'\a\28\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\29\0'\a\30\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\31\0'\a \0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6!\0'\a\"\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5#\0'\6!\0'\a$\0-\b\2\0B\2\6\0019\2%\0'\4&\0B\2\2\2\15\0\2\0X\3\19�6\2\1\0009\2\2\0029\2'\0025\4(\0-\5\3\0=\5)\4=\1*\4B\2\2\0016\2\1\0009\2\2\0029\2+\2'\4,\0005\5-\0-\6\3\0=\6)\5=\1*\0053\6.\0=\6/\5B\2\3\0012\0\0�K\0\1\0\3�\6�\b�\a�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\28textDocument/formatting\20supports_method1<cmd>lua vim.lsp.buf.range_code_action()<CR>\6v+<cmd>lua vim.lsp.buf.code_action()<CR>\aca�\1<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({ show_line = false, fname_width = 100 }))<CR>\agre<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<CR>\agdj<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<CR>\agDi<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\acrJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\6H%<cmd>lua vim.lsp.buf.hover()<CR>\6K\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\1\0\1\vsilent\2(<Cmd>lua vim.lsp.codelens.run()<CR>\14<leader>l\6n\24nvim_buf_set_keymapWautocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()\17nvim_command\bapi\bvim\14on_attachU\0\1\5\3\4\0\n-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3-\4\2\0=\4\3\3B\1\2\1K\0\1\0\2�\t�\n�\17capabilities\14on_attach\1\0\0\nsetup�\3\0\0\b\4\26\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0-\4\0\0=\4\t\3-\4\1\0=\4\n\0035\4\21\0005\5\r\0005\6\v\0-\a\2\0=\a\f\6=\6\14\0055\6\16\0005\a\15\0=\a\17\6=\6\18\0055\6\19\0=\6\20\5=\5\22\4=\4\23\3=\3\24\2B\0\2\2-\1\3\0009\1\25\0019\1\2\1\18\3\0\0B\1\2\1K\0\1\0\t�\n�\0\0\2�\16sumneko_lua\14lspconfig\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\tpath\1\0\1\fversion\vLuaJIT\17capabilities\14on_attach\1\0\0\flibrary\1\0\1\17runtime_path\1\fplugins\1\4\0\0\20nvim-treesitter\17plenary.nvim\fneotest\1\0\2\ntypes\2\15vimruntime\2\nsetup\flua-dev\frequire\29\0\2\6\1\0\0\5-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0�\1\1\0\6\3\n\0\16-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\2-\3\2\0=\3\5\2-\3\0\0009\3\6\0039\3\a\3'\5\b\0B\3\2\2=\3\t\2B\0\2\1K\0\1\0\2�\t�\n�\rroot_dir\14deno.json\17root_pattern\tutil\17capabilities\14on_attach\1\0\2\14autostart\1\24single_file_support\1\0\nsetup\vdenols\29\0\2\6\1\0\0\5-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0�\2\1\0\6\3\v\0\16-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\2-\3\2\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\0\3=\3\n\2B\0\2\1K\0\1\0\2�\t�\n�\rsettings\1\0\0\nhints\1\0\0\1\0\a\27compositeLiteralFields\2\24assignVariableTypes\2\23rangeVariableTypes\2\19parameterNames\2\27functionTypeParameters\2\19constantValues\2\26compositeLiteralTypes\2\17capabilities\14on_attach\1\0\0\0\nsetup\ngopls�\3\0\2\v\1\18\0--\2\0\0\18\4\0\0\18\5\1\0B\2\3\0019\2\0\0+\3\1\0=\3\1\0026\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\5\0B\3\2\0019\3\6\2\18\5\0\0B\3\2\0015\3\a\0006\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\f\0'\t\r\0\18\n\3\0B\4\6\0016\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\14\0'\t\15\0\18\n\3\0B\4\6\0016\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\16\0'\t\17\0\18\n\3\0B\4\6\1K\0\1\0\1\0\24:TSLspImportAll<CR>\14<space>ia\25:TSLspRenameFile<CR>\arf\23:TSLspOrganize<CR>\14<space>io\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\1\vsilent\2\17setup_client\1\0\3\27update_imports_on_move\2\21auto_inlay_hints\1!require_confirmation_on_move\2\nsetup\22nvim-lsp-ts-utils\frequire\24document_formatting\24server_capabilities�\6\1\0\6\3\19\0\26-\0\0\0009\0\0\0009\0\1\0005\2\5\0-\3\0\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2=\3\6\0023\3\a\0=\3\b\2-\3\2\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\f\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\2�\t�\n�\rsettings\15javascript\1\0\0\1\0\a+includeInlayFunctionParameterTypeHints\2:includeInlayParameterNameHintsWhenArgumentMatchesName\1#includeInlayParameterNameHints\ball%includeInlayEnumMemberValueHints\2,includeInlayFunctionLikeReturnTypeHints\2-includeInlayPropertyDeclarationTypeHints\2\"includeInlayVariableTypeHints\2\15typescript\1\0\0\15inlayHints\1\0\0\1\0\a+includeInlayFunctionParameterTypeHints\2:includeInlayParameterNameHintsWhenArgumentMatchesName\1#includeInlayParameterNameHints\ball%includeInlayEnumMemberValueHints\2,includeInlayFunctionLikeReturnTypeHints\2-includeInlayPropertyDeclarationTypeHints\2\"includeInlayVariableTypeHints\2\17capabilities\14on_attach\0\rroot_dir\1\0\0\17package.json\17root_pattern\tutil\nsetup\rtsserver�\2\0\2\a\2\v\0\0219\2\0\0+\3\2\0=\3\1\0029\2\0\0+\3\2\0=\3\2\2-\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0005\5\a\0-\6\1\0=\6\b\0055\6\t\0=\6\n\5B\2\3\1K\0\1\0\1\0\2\0\fpattern\1\5\0\0\n*.tsx\t*.ts\n*.jsx\t*.js\ngroup\1\0\1\fcommand\25silent! EslintFixAll\16BufWritePre\24nvim_create_autocmd\bapi\bvim\30document_range_formatting\24document_formatting\24server_capabilities�\1\1\0\5\3\v\0\14-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\1K\0\1\0\2�\t�\a�\rsettings\vformat\1\0\1\venable\2\21codeActionOnSave\1\0\0\1\0\2\tmode\ball\venable\2\14on_attach\1\0\0\0\nsetup\veslintI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\0\vformat\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0�K\0\1\0\a�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\f\1\0\16\1K\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0029\a\b\0065\t\n\0005\n\t\0=\n\v\tB\a\2\0019\a\f\3B\a\1\0016\a\0\0'\t\r\0B\a\2\0029\a\b\a4\t\0\0B\a\2\0019\a\b\0045\t\19\0006\n\14\0009\n\15\n9\n\16\n'\f\17\0B\n\2\2'\v\18\0&\n\v\n=\n\20\t5\n\21\0=\n\22\tB\a\2\0016\a\14\0009\a\23\a9\a\24\a'\t\25\0004\n\0\0B\a\3\0026\b\14\0009\b\26\b9\b\27\b6\t\14\0009\t\26\t9\t\29\t6\v\14\0009\v\26\v9\v\30\v9\v\31\v5\f \0B\t\3\2=\t\28\b5\b!\0006\t\14\0009\t\23\t9\t\"\t'\v#\0'\f$\0'\r%\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f&\0'\r'\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f(\0'\r)\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f*\0'\r+\0\18\14\b\0B\t\5\0013\t,\0006\n\0\0'\f-\0B\n\2\0029\n.\n6\f\14\0009\f\26\f9\f/\f9\f0\fB\f\1\0A\n\0\0026\v\14\0009\v1\v'\r2\0\18\14\n\0009\0153\3B\v\4\2\18\n\v\0009\v\b\0004\r\0\0B\v\2\0019\v\b\0014\r\0\0B\v\2\0019\v4\0015\r7\0003\0145\0>\14\1\r3\0146\0=\0148\r3\0149\0=\14:\r3\14;\0=\14<\r3\14=\0=\14>\r3\14?\0=\14@\rB\v\2\0019\v\b\0055\rG\0004\14\4\0009\15A\0059\15B\0159\15C\15>\15\1\0149\15A\0059\15D\0159\15E\15>\15\2\0149\15A\0059\15B\0159\15F\15>\15\3\14=\14H\r3\14I\0=\14J\rB\v\2\0012\0\0�K\0\1\0\0\0\14on_attach\0\fsources\1\0\0\vstylua\rgitsigns\17code_actions\rprettier\15formatting\rbuiltins\veslint\0\rtsserver\0\ngopls\0\vdenols\0\16sumneko_lua\1\0\0\0\0\19setup_handlers\17capabilities\tkeep\15tbl_extend\29make_client_capabilities\rprotocol\24update_capabilities\17cmp_nvim_lsp\0-<cmd>lua vim.diagnostic.setloclist()<CR>\r<space>q,<cmd>lua vim.diagnostic.goto_next()<CR>\a]d,<cmd>lua vim.diagnostic.goto_prev()<CR>\a[d-<cmd>lua vim.diagnostic.open_float()<CR>\r<space>e\6n\20nvim_set_keymap\1\0\2\vsilent\2\fnoremap\2\1\0\3\nsigns\2\14underline\2\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\18LspFormatting\24nvim_create_augroup\bapi local_settings_root_markers\1\2\0\0\t.git\16config_home\1\0\3\vloader\tjson\27append_default_schemas\2\23local_settings_dir\19.nlsp-settings\19/nlsp-settings\vconfig\fstdpath\afn\bvim\vfidget\22register_progress\16inlay_hints\1\0\0\1\0\1\22only_current_line\2\nsetup\19lsp-inlayhints\fnull-ls\17nlspsettings\15lsp-status\14lspconfig\20mason-lspconfig\nmason\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15deep ocean\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vcolors\1\0\4\15set_cursor\2\17line_opacity\4��̙\3����\3\19set_cursorline\2\15set_number\2\1\0\4\vdelete\f#c75c6a\vinsert\f#78ccc5\vvisual\f#9745be\tcopy\f#f5c359\nsetup\nmodes\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neotest = {
    config = { "\27LJ\2\n�\6\0\0\a\0\26\1N6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0024\6\0\0B\4\2\2>\4\1\0036\4\0\0'\6\4\0B\4\2\0024\6\0\0B\4\2\0?\4\0\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\18\0'\5\19\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\20\0'\5\21\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\22\0'\5\23\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\1K\0\1\0005<cmd>lua require(\"neotest\").summary.toggle()<CR>\attB<cmd>lua require(\"neotest\").output.open({ enter = true })<CR>\ato1<cmd>lua require(\"neotest\").run.attach()<CR>\ata/<cmd>lua require(\"neotest\").run.stop()<CR>\atsB<cmd>lua require(\"neotest\").run.run({ strategy = \"dap\" })<CR>\atd@<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<CR>\atc.<cmd>lua require(\"neotest\").run.run()<CR>\atn\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\radapters\1\0\0\21neotest-vim-test\17neotest-jest\nsetup\fneotest\frequire\5����\4\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-vim-test"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/neotest-vim-test",
    url = "https://github.com/nvim-neotest/neotest-vim-test"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nerdfont.vim",
    url = "https://github.com/lambdalisue/nerdfont.vim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\2\4\0\a\0\0189\2\0\0009\2\1\2\n\2\0\0X\2\b�9\2\0\0009\2\1\2\6\2\2\0X\2\4�9\2\0\0009\2\1\2=\2\3\1X\2\5�5\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\tname\vsource\1\0\4\vbuffer\r[Buffer]\fluasnip\14[Snippet]\tpath\v[Path]\rnvim_lsp\n[LSP]\tmenu\5\vdetail\20completion_item;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\n\1\0\v\0B\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\n\0005\5\b\0009\6\4\0015\b\5\0003\t\6\0=\t\a\bB\6\2\2=\6\t\5=\5\v\0045\5\r\0003\6\f\0=\6\14\5=\5\15\0044\5\0\0=\5\16\0049\5\17\0009\5\18\0059\5\19\0055\a\21\0009\b\17\0009\b\20\b)\n��B\b\2\2=\b\22\a9\b\17\0009\b\20\b)\n\4\0B\b\2\2=\b\23\a9\b\17\0009\b\24\bB\b\1\2=\b\25\a9\b\17\0009\b\26\bB\b\1\2=\b\27\a9\b\17\0009\b\28\b5\n\29\0B\b\2\2=\b\30\aB\5\2\2=\5\17\0049\5\31\0009\5 \0054\a\4\0005\b!\0>\b\1\a5\b\"\0>\b\2\a5\b#\0>\b\3\a4\b\5\0005\t$\0>\t\1\b5\t%\0>\t\2\b5\t&\0>\t\3\b5\t'\0>\t\4\bB\5\3\2=\5 \4B\2\2\0019\2\3\0009\2(\2'\4)\0005\5/\0009\6\31\0009\6 \0064\b\3\0005\t*\0>\t\1\b4\t\5\0005\n+\0>\n\1\t5\n,\0>\n\2\t5\n-\0>\n\3\t5\n.\0>\n\4\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\2(\2'\0040\0005\0056\0009\6\31\0009\6 \0064\b\3\0005\t1\0>\t\1\b4\t\5\0005\n2\0>\n\1\t5\n3\0>\n\2\t5\n4\0>\n\3\t5\n5\0>\n\4\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\0027\2'\0048\0005\0059\0009\6\17\0009\6\18\0069\0067\6B\6\1\2=\6\17\0059\6\31\0009\6 \0064\b\3\0005\t:\0>\t\1\b4\t\4\0005\n;\0>\n\1\t5\n<\0>\n\2\t5\n=\0>\n\3\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\0027\2'\4>\0005\5?\0009\6\17\0009\6\18\0069\0067\6B\6\1\2=\6\17\0059\6\31\0009\6 \0064\b\3\0005\t@\0>\t\1\b4\t\3\0005\nA\0>\n\1\tB\6\3\2=\6 \5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\blua\1\0\0\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\vbefore\0\1\0\2\rmaxwidth\0032\tmode\16symbol_text\15cmp_format\nsetup\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose�\1\0\4\v\0\6\0\0195\4\0\0\15\0\3\0X\5\a�6\5\1\0009\5\2\5'\a\3\0\18\b\4\0\18\t\3\0B\5\4\2\18\4\5\0006\5\1\0009\5\4\0059\5\5\5\18\a\0\0\18\b\1\0\18\t\2\0\18\n\4\0B\5\5\1K\0\1\0\20nvim_set_keymap\bapi\nforce\15tbl_extend\bvim\1\0\1\fnoremap\2�\20\1\0\t\0\\\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0005\5\a\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\b\0005\5\t\0B\2\3\0019\2\n\0015\4\19\0004\5\3\0005\6\15\0004\a\5\0005\b\v\0>\b\1\a5\b\f\0>\b\2\a5\b\r\0>\b\3\a5\b\14\0>\b\4\a=\a\16\6>\6\1\0055\6\18\0005\a\17\0=\a\16\6>\6\2\5=\5\20\4B\2\2\0016\2\0\0'\4\21\0B\2\2\0029\2\n\2B\2\1\0016\2\0\0'\4\22\0B\2\2\0029\2\n\0025\4\26\0006\5\3\0009\5\4\0059\5\23\5'\a\24\0B\5\2\2'\6\25\0&\5\6\5=\5\27\0045\5\28\0=\5\29\4B\2\2\0019\2\29\0005\3\31\0004\4\3\0006\5 \0009\5!\5'\a\"\0B\5\2\2'\6#\0&\5\6\5>\5\1\4=\4$\3=\3\30\0029\2\29\0005\3&\0004\4\3\0006\5 \0009\5!\5'\a\"\0B\5\2\2'\6'\0&\5\6\5>\5\1\4=\4$\3=\3%\0029\2(\0004\3\4\0005\4*\0>\4\1\0035\4+\0006\5\0\0'\a,\0B\5\2\0029\5-\5=\5.\4>\4\2\0035\4/\0005\0050\0=\0051\4>\4\3\3=\3)\0029\2(\0009\3(\0009\3)\3=\0032\0029\2(\0009\3(\0009\3)\3=\0033\0029\2(\0009\3(\0009\3)\3=\0034\0029\0025\0009\0026\0029\0027\0023\0039\0=\0038\0029\0025\0009\2:\0029\2;\0023\3<\0=\0038\0029\0025\0009\2:\0029\2=\0023\3>\0=\0038\0023\2?\0\18\3\2\0'\5@\0'\6A\0'\aB\0005\bC\0B\3\5\1\18\3\2\0'\5@\0'\6D\0'\aE\0005\bF\0B\3\5\1\18\3\2\0'\5@\0'\6G\0'\aH\0005\bI\0B\3\5\1\18\3\2\0'\5@\0'\6J\0'\aK\0005\bL\0B\3\5\1\18\3\2\0'\5@\0'\6M\0'\aN\0005\bO\0B\3\5\1\18\3\2\0'\5@\0'\6P\0'\aQ\0005\bR\0B\3\5\1\18\3\2\0'\5@\0'\6S\0'\aT\0005\bU\0B\3\5\1\18\3\2\0'\5@\0'\6V\0'\aW\0005\bX\0B\3\5\1\18\3\2\0'\5@\0'\6Y\0'\aZ\0005\b[\0B\3\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2X:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\14<leader>l\1\0\1\vsilent\2Q:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>\15<leader>bc\1\0\1\vsilent\2.:lua require'dap'.toggle_breakpoint()<CR>\14<leader>b\1\0\1\vsilent\2%:lua require'dap'.step_out()<CR>\n<F12>\1\0\1\vsilent\2&:lua require'dap'.step_into()<CR>\n<F11>\1\0\1\vsilent\2&:lua require'dap'.step_over()<CR>\n<F10>\1\0\1\vsilent\2%:lua require'dap'.continue()<CR>\t<F5>\1\0\1\vsilent\2#:lua require'dapui'.eval()<CR>\23<leader><leader>df\1\0\1\vsilent\2%:lua require'dapui'.toggle()<CR>\14<leader>d\6n\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\20typescriptreact\15typescript\20javascriptreact\16runtimeArgs\1\3\0\0$./node_modules/jest/bin/jest.js\16--runInBand\1\0\t\fconsole\23integratedTerminal\27internalConsoleOptions\14neverOpen\rrootPath\23${workspaceFolder}\bcwd\23${workspaceFolder}\ttype\rpwa-node\22runtimeExecutable\tnode\ntrace\2\frequest\vlaunch\tname\21Debug Jest Tests\14processId\17pick_process\14dap.utils\1\0\4\ttype\rpwa-node\bcwd\23${workspaceFolder}\frequest\vattach\tname\vAttach\1\0\5\fprogram\f${file}\ttype\rpwa-node\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\16Launch file\15javascript\19configurationsI/ghq/github.com/microsoft/vscode-chrome-debug/out/src/chromeDebug.js\1\0\2\ttype\15executable\fcommand\tnode\vchrome\targsF/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js\tHOME\vgetenv\aos\1\0\2\ttype\15executable\fcommand\tnode\nnode2\radapters\1\6\0\0\rpwa-node\15pwa-chrome\15pwa-msedge\18node-terminal\22pwa-extensionHost\18debugger_path\1\0\0*/site/pack/packer/opt/vscode-js-debug\tdata\fstdpath\18dap-vscode-js\vdap-go\flayouts\1\0\0\1\0\2\tsize\4����\t����\3\rposition\vbottom\1\3\0\0\trepl\fconsole\relements\1\0\2\tsize\3@\rposition\nright\1\0\2\tsize\4����\t����\3\aid\vscopes\1\0\2\tsize\4����\t����\3\aid\16breakpoints\1\0\2\tsize\4����\t����\3\aid\vstacks\1\0\2\tsize\4����\t����\3\aid\fwatches\nsetup\1\0\4\vlinehl\5\ttext\t👉\vtexthl\5\nnumhl\5\15DapStopped\1\0\4\vlinehl\5\ttext\b⛔\vtexthl\5\nnumhl\5\18DapBreakpoint\16sign_define\afn\bvim\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-vscode-js"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-dap-vscode-js",
    url = "https://github.com/mxsdev/nvim-dap-vscode-js"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0035\4\n\0=\4\v\3=\3\f\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\vupdate\6R\21unfocus_language\6F\19focus_language\6f\fdisable\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\n\0 \0/6\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1#�9\1\2\0005\3\15\0005\4\3\0005\5\4\0=\5\5\0045\5\n\0005\6\b\0006\a\0\0'\t\6\0B\a\2\0029\a\a\a=\a\t\6=\6\v\5=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\4=\4\24\3B\1\2\0019\1\25\0'\3\23\0B\1\2\0019\1\25\0'\3\26\0B\1\2\0019\1\25\0'\3\27\0B\1\2\0016\1\28\0009\1\29\0019\1\30\1'\3\31\0+\4\1\0B\1\3\1K\0\1\0�\4        nmap <Space>o :Telescope find_files<CR>\n        nmap <Space>f :Telescope find_files<CR>\n        nmap <Space>b :Telescope buffers<CR>\n        nmap <Space>s :Telescope live_grep<CR>\n        nmap <Space>ll :Telescope loclist<CR>\n        nmap <Space>ln :Telescope jumplist<CR>\n        nmap <Space>gf :Telescope git_files<CR>\n        nmap <Space>gs :Telescope git_status<CR>\n        nmap <Space>gb :Telescope git_bcommits<CR>\n        nmap <Space>gla :Telescope git_commits<CR>\n        nmap <C-G> :Telescope live_grep<CR>\n      \14nvim_exec\bapi\bvim\agh\bdap\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\15find_files\1\0\0\1\0\3\14no_ignore\1\vhidden\2\16find_comand\arg\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\rmappings\6i\1\0\0\t<F2>\1\0\0\19toggle_preview\29telescope.actions.layout\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\ntheme\vcursor\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tig-explorer.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/tig-explorer.vim",
    url = "https://github.com/iberianpig/tig-explorer.vim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\nnight\21tokyonight_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\23:TroubleToggle<CR>\t<F4>\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-lua-format"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-lua-format",
    url = "https://github.com/andrejlevkovitch/vim-lua-format"
  },
  ["vim-mergetool"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0j          let g:mergetool_layout = 'lmr'\n          let g:mergetool_prefer_revision = 'local'\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-mergetool",
    url = "https://github.com/samoshkin/vim-mergetool"
  },
  ["vim-qfreplace"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-qfreplace",
    url = "https://github.com/thinca/vim-qfreplace"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-terraform"] = {
    config = { "\27LJ\2\n_\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0.\t\t\t\t\tlet g:terraform_fmt_on_save = 1\n\t\t\t\t\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\1\t\t\t\t\tlet test#strategy= \"neovim\"\n\t\t\t\t\tlet test#neovim#term_position = \"vert\"\n\t\t\t\t\tlet test#neovim#start_normal = 1 \" if using neovim strategy\n\t\t\t\t\tlet test#basic#start_normal = 1 \" if using basic strategy\n\t\t\t\t\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n�\n\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\n\t\t\t\t\" Expand\n\t\t\t\timap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'\n\t\t\t\tsmap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'\n\n\t\t\t\t\" Expand or jump\n\t\t\t\timap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n\t\t\t\tsmap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n\n\t\t\t\t\" Jump forward or backward\n\t\t\t\timap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'\n\t\t\t\tsmap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'\n\t\t\t\timap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'\n\t\t\t\tsmap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'\n\n\t\t\t\t\" Select or cut text to use as $TM_SEECTED_TEXT in the next snippet.\n\t\t\t\t\" See https://github.com/hrsh7th/vim-vsnip/pull/50\n\t\t\t\tnmap        s   <Plug>(vsnip-select-text)\n\t\t\t\txmap        s   <Plug>(vsnip-select-text)\n\t\t\t\tnmap        S   <Plug>(vsnip-cut-text)\n\t\t\t\txmap        S   <Plug>(vsnip-cut-text)\n\n\t\t\t\t\" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.\n\t\t\t\tlet g:vsnip_filetypes = {}\n\t\t\t\tlet g:vsnip_filetypes.javascriptreact = ['javascript']\n\t\t\t\tlet g:vsnip_filetypes.typescriptreact = ['typescript']\n\t\t\t\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["vscode-js-debug"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/opt/vscode-js-debug",
    url = "https://github.com/microsoft/vscode-js-debug"
  },
  winresizer = {
    config = { "\27LJ\2\nm\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0<          let g:winresizer_start_key = '<C-E>'\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\b\0006\4\0\0'\6\3\0B\4\2\0029\4\4\0045\6\6\0005\a\5\0=\a\a\6B\4\2\2=\4\t\3=\3\v\2B\0\2\1K\0\1\0\vselect\1\0\0\14telescope\1\0\0\18layout_config\1\0\0\1\0\2\vheight\3\20\nwidth\3d\15get_cursor\21telescope.themes\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: winresizer
time([[Config for winresizer]], true)
try_loadstring("\27LJ\2\nm\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0<          let g:winresizer_start_key = '<C-E>'\n        \14nvim_exec\bapi\bvim\0", "config", "winresizer")
time([[Config for winresizer]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\n\0'\2\v\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\n\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2\t\t\t\t\tlet g:fern#default_hidden=1\n\t\t\t\t\tlet g:fern#width=50\n\t\t\t\t\tlet g:fern#renderer='nerdfont'\n\n\t\t\t\t\tfunction! FernInit() abort\n\t\t\t\t\t\tnmap <buffer> <C-L> :TmuxNavigateRight<CR>\n\t\t\t\t\tendfunction\n\n\t\t\t\t\taugroup FernEvents\n\t\t\t\t\t\tautocmd!\n\t\t\t\t\t\tautocmd FileType fern call FernInit()\n\t\t\t\t\taugroup END\n\t\t\t\t2 nnoremap <silent> <space>x :BufferClose<CR> \14nvim_exec\1\0\2\vsilent\2\fnoremap\2\20:BufferPrev<CR>\n<C-p>\1\0\2\vsilent\2\fnoremap\2\20:BufferNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\n\0 \0/6\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1#�9\1\2\0005\3\15\0005\4\3\0005\5\4\0=\5\5\0045\5\n\0005\6\b\0006\a\0\0'\t\6\0B\a\2\0029\a\a\a=\a\t\6=\6\v\5=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\4=\4\20\0035\4\22\0005\5\21\0=\5\23\4=\4\24\3B\1\2\0019\1\25\0'\3\23\0B\1\2\0019\1\25\0'\3\26\0B\1\2\0019\1\25\0'\3\27\0B\1\2\0016\1\28\0009\1\29\0019\1\30\1'\3\31\0+\4\1\0B\1\3\1K\0\1\0�\4        nmap <Space>o :Telescope find_files<CR>\n        nmap <Space>f :Telescope find_files<CR>\n        nmap <Space>b :Telescope buffers<CR>\n        nmap <Space>s :Telescope live_grep<CR>\n        nmap <Space>ll :Telescope loclist<CR>\n        nmap <Space>ln :Telescope jumplist<CR>\n        nmap <Space>gf :Telescope git_files<CR>\n        nmap <Space>gs :Telescope git_status<CR>\n        nmap <Space>gb :Telescope git_bcommits<CR>\n        nmap <Space>gla :Telescope git_commits<CR>\n        nmap <C-G> :Telescope live_grep<CR>\n      \14nvim_exec\bapi\bvim\agh\bdap\19load_extension\15extensions\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\fpickers\15find_files\1\0\0\1\0\3\14no_ignore\1\vhidden\2\16find_comand\arg\rdefaults\1\0\0\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\rmappings\6i\1\0\0\t<F2>\1\0\0\19toggle_preview\29telescope.actions.layout\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\ntheme\vcursor\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\nnight\21tokyonight_style\6g\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\b\0\"\00036\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1-�9\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0005\a\15\0=\a\16\6>\6\3\5=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0004\5\0\0=\5\f\0044\5\0\0=\5\17\0045\5\28\0=\5\19\0045\5\29\0=\5\21\0044\5\0\0=\5\23\0044\5\0\0=\5\25\4=\4\30\0034\4\0\0=\4\31\0035\4 \0=\4!\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\tfern\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\4\0\0\17g:coc_status!require'lsp-status'.status()\rfilename\14lualine_b\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\15tokyonight\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\1\t\t\t\t\tlet test#strategy= \"neovim\"\n\t\t\t\t\tlet test#neovim#term_position = \"vert\"\n\t\t\t\t\tlet test#neovim#start_normal = 1 \" if using neovim strategy\n\t\t\t\t\tlet test#basic#start_normal = 1 \" if using basic strategy\n\t\t\t\t\14nvim_exec\bapi\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\b\0\0\5\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0\rrelative\vcursor&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\18virt_text_pos\beol\14virt_text\2\ndelay\3�\a\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\fkeymaps\tn [c\1\2\1\0001&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\texpr\2\tn ]c\1\2\1\0001&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\texpr\2\1\0\1\fnoremap\2\nsigns\1\0\t\20max_file_length\3��\2\14word_diff\1\nnumhl\1\vlinehl\1\23current_line_blame\1\24attach_to_untracked\2\15signcolumn\2\20update_debounce\3d\18sign_priority\3\6\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0035\4\n\0=\4\v\3=\3\f\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\vupdate\6R\21unfocus_language\6F\19focus_language\6f\fdisable\1\0\3\20persist_queries\1\15updatetime\3\25\venable\2\26context_commentstring\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\18virtual_lines\1\0\1\22only_current_line\2\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15deep ocean\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\23:TroubleToggle<CR>\t<F4>\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: modes.nvim
time([[Config for modes.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vcolors\1\0\4\15set_cursor\2\17line_opacity\4��̙\3����\3\19set_cursorline\2\15set_number\2\1\0\4\vdelete\f#c75c6a\vinsert\f#78ccc5\vvisual\f#9745be\tcopy\f#f5c359\nsetup\nmodes\frequire\0", "config", "modes.nvim")
time([[Config for modes.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1�\nclose�\1\0\4\v\0\6\0\0195\4\0\0\15\0\3\0X\5\a�6\5\1\0009\5\2\5'\a\3\0\18\b\4\0\18\t\3\0B\5\4\2\18\4\5\0006\5\1\0009\5\4\0059\5\5\5\18\a\0\0\18\b\1\0\18\t\2\0\18\n\4\0B\5\5\1K\0\1\0\20nvim_set_keymap\bapi\nforce\15tbl_extend\bvim\1\0\1\fnoremap\2�\20\1\0\t\0\\\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\2'\4\6\0005\5\a\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\b\0005\5\t\0B\2\3\0019\2\n\0015\4\19\0004\5\3\0005\6\15\0004\a\5\0005\b\v\0>\b\1\a5\b\f\0>\b\2\a5\b\r\0>\b\3\a5\b\14\0>\b\4\a=\a\16\6>\6\1\0055\6\18\0005\a\17\0=\a\16\6>\6\2\5=\5\20\4B\2\2\0016\2\0\0'\4\21\0B\2\2\0029\2\n\2B\2\1\0016\2\0\0'\4\22\0B\2\2\0029\2\n\0025\4\26\0006\5\3\0009\5\4\0059\5\23\5'\a\24\0B\5\2\2'\6\25\0&\5\6\5=\5\27\0045\5\28\0=\5\29\4B\2\2\0019\2\29\0005\3\31\0004\4\3\0006\5 \0009\5!\5'\a\"\0B\5\2\2'\6#\0&\5\6\5>\5\1\4=\4$\3=\3\30\0029\2\29\0005\3&\0004\4\3\0006\5 \0009\5!\5'\a\"\0B\5\2\2'\6'\0&\5\6\5>\5\1\4=\4$\3=\3%\0029\2(\0004\3\4\0005\4*\0>\4\1\0035\4+\0006\5\0\0'\a,\0B\5\2\0029\5-\5=\5.\4>\4\2\0035\4/\0005\0050\0=\0051\4>\4\3\3=\3)\0029\2(\0009\3(\0009\3)\3=\0032\0029\2(\0009\3(\0009\3)\3=\0033\0029\2(\0009\3(\0009\3)\3=\0034\0029\0025\0009\0026\0029\0027\0023\0039\0=\0038\0029\0025\0009\2:\0029\2;\0023\3<\0=\0038\0029\0025\0009\2:\0029\2=\0023\3>\0=\0038\0023\2?\0\18\3\2\0'\5@\0'\6A\0'\aB\0005\bC\0B\3\5\1\18\3\2\0'\5@\0'\6D\0'\aE\0005\bF\0B\3\5\1\18\3\2\0'\5@\0'\6G\0'\aH\0005\bI\0B\3\5\1\18\3\2\0'\5@\0'\6J\0'\aK\0005\bL\0B\3\5\1\18\3\2\0'\5@\0'\6M\0'\aN\0005\bO\0B\3\5\1\18\3\2\0'\5@\0'\6P\0'\aQ\0005\bR\0B\3\5\1\18\3\2\0'\5@\0'\6S\0'\aT\0005\bU\0B\3\5\1\18\3\2\0'\5@\0'\6V\0'\aW\0005\bX\0B\3\5\1\18\3\2\0'\5@\0'\6Y\0'\aZ\0005\b[\0B\3\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2X:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>\14<leader>l\1\0\1\vsilent\2Q:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>\15<leader>bc\1\0\1\vsilent\2.:lua require'dap'.toggle_breakpoint()<CR>\14<leader>b\1\0\1\vsilent\2%:lua require'dap'.step_out()<CR>\n<F12>\1\0\1\vsilent\2&:lua require'dap'.step_into()<CR>\n<F11>\1\0\1\vsilent\2&:lua require'dap'.step_over()<CR>\n<F10>\1\0\1\vsilent\2%:lua require'dap'.continue()<CR>\t<F5>\1\0\1\vsilent\2#:lua require'dapui'.eval()<CR>\23<leader><leader>df\1\0\1\vsilent\2%:lua require'dapui'.toggle()<CR>\14<leader>d\6n\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\20typescriptreact\15typescript\20javascriptreact\16runtimeArgs\1\3\0\0$./node_modules/jest/bin/jest.js\16--runInBand\1\0\t\fconsole\23integratedTerminal\27internalConsoleOptions\14neverOpen\rrootPath\23${workspaceFolder}\bcwd\23${workspaceFolder}\ttype\rpwa-node\22runtimeExecutable\tnode\ntrace\2\frequest\vlaunch\tname\21Debug Jest Tests\14processId\17pick_process\14dap.utils\1\0\4\ttype\rpwa-node\bcwd\23${workspaceFolder}\frequest\vattach\tname\vAttach\1\0\5\fprogram\f${file}\ttype\rpwa-node\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\16Launch file\15javascript\19configurationsI/ghq/github.com/microsoft/vscode-chrome-debug/out/src/chromeDebug.js\1\0\2\ttype\15executable\fcommand\tnode\vchrome\targsF/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js\tHOME\vgetenv\aos\1\0\2\ttype\15executable\fcommand\tnode\nnode2\radapters\1\6\0\0\rpwa-node\15pwa-chrome\15pwa-msedge\18node-terminal\22pwa-extensionHost\18debugger_path\1\0\0*/site/pack/packer/opt/vscode-js-debug\tdata\fstdpath\18dap-vscode-js\vdap-go\flayouts\1\0\0\1\0\2\tsize\4����\t����\3\rposition\vbottom\1\3\0\0\trepl\fconsole\relements\1\0\2\tsize\3@\rposition\nright\1\0\2\tsize\4����\t����\3\aid\vscopes\1\0\2\tsize\4����\t����\3\aid\16breakpoints\1\0\2\tsize\4����\t����\3\aid\vstacks\1\0\2\tsize\4����\t����\3\aid\fwatches\nsetup\1\0\4\vlinehl\5\ttext\t👉\vtexthl\5\nnumhl\5\15DapStopped\1\0\4\vlinehl\5\ttext\b⛔\vtexthl\5\nnumhl\5\18DapBreakpoint\16sign_define\afn\bvim\ndapui\bdap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\n�\n\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\n\t\t\t\t\" Expand\n\t\t\t\timap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'\n\t\t\t\tsmap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'\n\n\t\t\t\t\" Expand or jump\n\t\t\t\timap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n\t\t\t\tsmap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n\n\t\t\t\t\" Jump forward or backward\n\t\t\t\timap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'\n\t\t\t\tsmap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'\n\t\t\t\timap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'\n\t\t\t\tsmap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'\n\n\t\t\t\t\" Select or cut text to use as $TM_SEECTED_TEXT in the next snippet.\n\t\t\t\t\" See https://github.com/hrsh7th/vim-vsnip/pull/50\n\t\t\t\tnmap        s   <Plug>(vsnip-select-text)\n\t\t\t\txmap        s   <Plug>(vsnip-select-text)\n\t\t\t\tnmap        S   <Plug>(vsnip-cut-text)\n\t\t\t\txmap        S   <Plug>(vsnip-cut-text)\n\n\t\t\t\t\" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.\n\t\t\t\tlet g:vsnip_filetypes = {}\n\t\t\t\tlet g:vsnip_filetypes.javascriptreact = ['javascript']\n\t\t\t\tlet g:vsnip_filetypes.typescriptreact = ['typescript']\n\t\t\t\14nvim_exec\bapi\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: vim-mergetool
time([[Config for vim-mergetool]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0j          let g:mergetool_layout = 'lmr'\n          let g:mergetool_prefer_revision = 'local'\n        \14nvim_exec\bapi\bvim\0", "config", "vim-mergetool")
time([[Config for vim-mergetool]], false)
-- Config for: vim-terraform
time([[Config for vim-terraform]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0.\t\t\t\t\tlet g:terraform_fmt_on_save = 1\n\t\t\t\t\14nvim_exec\bapi\bvim\0", "config", "vim-terraform")
time([[Config for vim-terraform]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n�\6\0\0\a\0\26\1N6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0024\6\0\0B\4\2\2>\4\1\0036\4\0\0'\6\4\0B\4\2\0024\6\0\0B\4\2\0?\4\0\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\18\0'\5\19\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\20\0'\5\21\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\22\0'\5\23\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\1K\0\1\0005<cmd>lua require(\"neotest\").summary.toggle()<CR>\attB<cmd>lua require(\"neotest\").output.open({ enter = true })<CR>\ato1<cmd>lua require(\"neotest\").run.attach()<CR>\ata/<cmd>lua require(\"neotest\").run.stop()<CR>\atsB<cmd>lua require(\"neotest\").run.run({ strategy = \"dap\" })<CR>\atd@<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<CR>\atc.<cmd>lua require(\"neotest\").run.run()<CR>\atn\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\radapters\1\0\0\21neotest-vim-test\17neotest-jest\nsetup\fneotest\frequire\5����\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: fern.vim
time([[Config for fern.vim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\f\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\n\0)\1\1\0=\1\v\0K\0\1\0\"fern_disable_startup_warnings\6g\1\0\2\vsilent\2\fnoremap\0020:Fern . -drawer -width=50 -reveal=%<CR><CR>\ass\1\0\2\vsilent\2\fnoremap\2*:Fern . -drawer -width=50 -toggle<CR>\t<F2>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "fern.vim")
time([[Config for fern.vim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\0\vformat\bbuf\blsp\bvim�\14\1\2\t\0040\0�\1-\2\0\0009\2\0\2\18\4\0\0B\2\2\1-\2\1\0009\2\0\2\18\4\0\0\18\5\1\0B\2\3\0016\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0005\b\t\0B\2\6\0016\2\1\0009\2\2\0029\2\n\2\18\4\1\0'\5\v\0'\6\f\0B\2\4\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\25\0'\a\26\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\27\0'\a\28\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\29\0'\a\30\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6\31\0'\a \0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5\6\0'\6!\0'\a\"\0-\b\2\0B\2\6\0016\2\1\0009\2\2\0029\2\5\2\18\4\1\0'\5#\0'\6!\0'\a$\0-\b\2\0B\2\6\0019\2%\0'\4&\0B\2\2\2\15\0\2\0X\3\19�6\2\1\0009\2\2\0029\2'\0025\4(\0-\5\3\0=\5)\4=\1*\4B\2\2\0016\2\1\0009\2\2\0029\2+\2'\4,\0005\5-\0-\6\3\0=\6)\5=\1*\0053\6.\0=\6/\5B\2\3\0012\0\0�K\0\1\0\3�\6�\b�\a�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\28textDocument/formatting\20supports_method1<cmd>lua vim.lsp.buf.range_code_action()<CR>\6v+<cmd>lua vim.lsp.buf.code_action()<CR>\aca�\1<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({ show_line = false, fname_width = 100 }))<CR>\agre<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<CR>\agdj<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<CR>\agDi<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\acrJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\6H%<cmd>lua vim.lsp.buf.hover()<CR>\6K\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\1\0\1\vsilent\2(<Cmd>lua vim.lsp.codelens.run()<CR>\14<leader>l\6n\24nvim_buf_set_keymapWautocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()\17nvim_command\bapi\bvim\14on_attachU\0\1\5\3\4\0\n-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3-\4\2\0=\4\3\3B\1\2\1K\0\1\0\2�\t�\n�\17capabilities\14on_attach\1\0\0\nsetup�\3\0\0\b\4\26\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0-\4\0\0=\4\t\3-\4\1\0=\4\n\0035\4\21\0005\5\r\0005\6\v\0-\a\2\0=\a\f\6=\6\14\0055\6\16\0005\a\15\0=\a\17\6=\6\18\0055\6\19\0=\6\20\5=\5\22\4=\4\23\3=\3\24\2B\0\2\2-\1\3\0009\1\25\0019\1\2\1\18\3\0\0B\1\2\1K\0\1\0\t�\n�\0\0\2�\16sumneko_lua\14lspconfig\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\tpath\1\0\1\fversion\vLuaJIT\17capabilities\14on_attach\1\0\0\flibrary\1\0\1\17runtime_path\1\fplugins\1\4\0\0\20nvim-treesitter\17plenary.nvim\fneotest\1\0\2\ntypes\2\15vimruntime\2\nsetup\flua-dev\frequire\29\0\2\6\1\0\0\5-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0�\1\1\0\6\3\n\0\16-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\2-\3\2\0=\3\5\2-\3\0\0009\3\6\0039\3\a\3'\5\b\0B\3\2\2=\3\t\2B\0\2\1K\0\1\0\2�\t�\n�\rroot_dir\14deno.json\17root_pattern\tutil\17capabilities\14on_attach\1\0\2\14autostart\1\24single_file_support\1\0\nsetup\vdenols\29\0\2\6\1\0\0\5-\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1\0�\2\1\0\6\3\v\0\16-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\2-\3\2\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\0\3=\3\n\2B\0\2\1K\0\1\0\2�\t�\n�\rsettings\1\0\0\nhints\1\0\0\1\0\a\27compositeLiteralFields\2\24assignVariableTypes\2\23rangeVariableTypes\2\19parameterNames\2\27functionTypeParameters\2\19constantValues\2\26compositeLiteralTypes\2\17capabilities\14on_attach\1\0\0\0\nsetup\ngopls�\3\0\2\v\1\18\0--\2\0\0\18\4\0\0\18\5\1\0B\2\3\0019\2\0\0+\3\1\0=\3\1\0026\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\5\0B\3\2\0019\3\6\2\18\5\0\0B\3\2\0015\3\a\0006\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\f\0'\t\r\0\18\n\3\0B\4\6\0016\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\14\0'\t\15\0\18\n\3\0B\4\6\0016\4\b\0009\4\t\0049\4\n\4\18\6\1\0'\a\v\0'\b\16\0'\t\17\0\18\n\3\0B\4\6\1K\0\1\0\1\0\24:TSLspImportAll<CR>\14<space>ia\25:TSLspRenameFile<CR>\arf\23:TSLspOrganize<CR>\14<space>io\6n\24nvim_buf_set_keymap\bapi\bvim\1\0\1\vsilent\2\17setup_client\1\0\3\27update_imports_on_move\2\21auto_inlay_hints\1!require_confirmation_on_move\2\nsetup\22nvim-lsp-ts-utils\frequire\24document_formatting\24server_capabilities�\6\1\0\6\3\19\0\26-\0\0\0009\0\0\0009\0\1\0005\2\5\0-\3\0\0009\3\2\0039\3\3\3'\5\4\0B\3\2\2=\3\6\0023\3\a\0=\3\b\2-\3\2\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\f\4=\4\17\3=\3\18\2B\0\2\1K\0\1\0\2�\t�\n�\rsettings\15javascript\1\0\0\1\0\a+includeInlayFunctionParameterTypeHints\2:includeInlayParameterNameHintsWhenArgumentMatchesName\1#includeInlayParameterNameHints\ball%includeInlayEnumMemberValueHints\2,includeInlayFunctionLikeReturnTypeHints\2-includeInlayPropertyDeclarationTypeHints\2\"includeInlayVariableTypeHints\2\15typescript\1\0\0\15inlayHints\1\0\0\1\0\a+includeInlayFunctionParameterTypeHints\2:includeInlayParameterNameHintsWhenArgumentMatchesName\1#includeInlayParameterNameHints\ball%includeInlayEnumMemberValueHints\2,includeInlayFunctionLikeReturnTypeHints\2-includeInlayPropertyDeclarationTypeHints\2\"includeInlayVariableTypeHints\2\17capabilities\14on_attach\0\rroot_dir\1\0\0\17package.json\17root_pattern\tutil\nsetup\rtsserver�\2\0\2\a\2\v\0\0219\2\0\0+\3\2\0=\3\1\0029\2\0\0+\3\2\0=\3\2\2-\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0005\5\a\0-\6\1\0=\6\b\0055\6\t\0=\6\n\5B\2\3\1K\0\1\0\1\0\2\0\fpattern\1\5\0\0\n*.tsx\t*.ts\n*.jsx\t*.js\ngroup\1\0\1\fcommand\25silent! EslintFixAll\16BufWritePre\24nvim_create_autocmd\bapi\bvim\30document_range_formatting\24document_formatting\24server_capabilities�\1\1\0\5\3\v\0\14-\0\0\0009\0\0\0009\0\1\0005\2\3\0003\3\2\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\1K\0\1\0\2�\t�\a�\rsettings\vformat\1\0\1\venable\2\21codeActionOnSave\1\0\0\1\0\2\tmode\ball\venable\2\14on_attach\1\0\0\0\nsetup\veslintI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1�\nbufnr\1\0\0\vformat\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0�K\0\1\0\a�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\f\1\0\16\1K\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0026\5\0\0'\a\6\0B\5\2\0026\6\0\0'\b\a\0B\6\2\0029\a\b\0065\t\n\0005\n\t\0=\n\v\tB\a\2\0019\a\f\3B\a\1\0016\a\0\0'\t\r\0B\a\2\0029\a\b\a4\t\0\0B\a\2\0019\a\b\0045\t\19\0006\n\14\0009\n\15\n9\n\16\n'\f\17\0B\n\2\2'\v\18\0&\n\v\n=\n\20\t5\n\21\0=\n\22\tB\a\2\0016\a\14\0009\a\23\a9\a\24\a'\t\25\0004\n\0\0B\a\3\0026\b\14\0009\b\26\b9\b\27\b6\t\14\0009\t\26\t9\t\29\t6\v\14\0009\v\26\v9\v\30\v9\v\31\v5\f \0B\t\3\2=\t\28\b5\b!\0006\t\14\0009\t\23\t9\t\"\t'\v#\0'\f$\0'\r%\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f&\0'\r'\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f(\0'\r)\0\18\14\b\0B\t\5\0016\t\14\0009\t\23\t9\t\"\t'\v#\0'\f*\0'\r+\0\18\14\b\0B\t\5\0013\t,\0006\n\0\0'\f-\0B\n\2\0029\n.\n6\f\14\0009\f\26\f9\f/\f9\f0\fB\f\1\0A\n\0\0026\v\14\0009\v1\v'\r2\0\18\14\n\0009\0153\3B\v\4\2\18\n\v\0009\v\b\0004\r\0\0B\v\2\0019\v\b\0014\r\0\0B\v\2\0019\v4\0015\r7\0003\0145\0>\14\1\r3\0146\0=\0148\r3\0149\0=\14:\r3\14;\0=\14<\r3\14=\0=\14>\r3\14?\0=\14@\rB\v\2\0019\v\b\0055\rG\0004\14\4\0009\15A\0059\15B\0159\15C\15>\15\1\0149\15A\0059\15D\0159\15E\15>\15\2\0149\15A\0059\15B\0159\15F\15>\15\3\14=\14H\r3\14I\0=\14J\rB\v\2\0012\0\0�K\0\1\0\0\0\14on_attach\0\fsources\1\0\0\vstylua\rgitsigns\17code_actions\rprettier\15formatting\rbuiltins\veslint\0\rtsserver\0\ngopls\0\vdenols\0\16sumneko_lua\1\0\0\0\0\19setup_handlers\17capabilities\tkeep\15tbl_extend\29make_client_capabilities\rprotocol\24update_capabilities\17cmp_nvim_lsp\0-<cmd>lua vim.diagnostic.setloclist()<CR>\r<space>q,<cmd>lua vim.diagnostic.goto_next()<CR>\a]d,<cmd>lua vim.diagnostic.goto_prev()<CR>\a[d-<cmd>lua vim.diagnostic.open_float()<CR>\r<space>e\6n\20nvim_set_keymap\1\0\2\vsilent\2\fnoremap\2\1\0\3\nsigns\2\14underline\2\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\18LspFormatting\24nvim_create_augroup\bapi local_settings_root_markers\1\2\0\0\t.git\16config_home\1\0\3\vloader\tjson\27append_default_schemas\2\23local_settings_dir\19.nlsp-settings\19/nlsp-settings\vconfig\fstdpath\afn\bvim\vfidget\22register_progress\16inlay_hints\1\0\0\1\0\1\22only_current_line\2\nsetup\19lsp-inlayhints\fnull-ls\17nlspsettings\15lsp-status\14lspconfig\20mason-lspconfig\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\2\4\0\a\0\0189\2\0\0009\2\1\2\n\2\0\0X\2\b�9\2\0\0009\2\1\2\6\2\2\0X\2\4�9\2\0\0009\2\1\2=\2\3\1X\2\5�5\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\tname\vsource\1\0\4\vbuffer\r[Buffer]\fluasnip\14[Snippet]\tpath\v[Path]\rnvim_lsp\n[LSP]\tmenu\5\vdetail\20completion_item;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim�\n\1\0\v\0B\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\n\0005\5\b\0009\6\4\0015\b\5\0003\t\6\0=\t\a\bB\6\2\2=\6\t\5=\5\v\0045\5\r\0003\6\f\0=\6\14\5=\5\15\0044\5\0\0=\5\16\0049\5\17\0009\5\18\0059\5\19\0055\a\21\0009\b\17\0009\b\20\b)\n��B\b\2\2=\b\22\a9\b\17\0009\b\20\b)\n\4\0B\b\2\2=\b\23\a9\b\17\0009\b\24\bB\b\1\2=\b\25\a9\b\17\0009\b\26\bB\b\1\2=\b\27\a9\b\17\0009\b\28\b5\n\29\0B\b\2\2=\b\30\aB\5\2\2=\5\17\0049\5\31\0009\5 \0054\a\4\0005\b!\0>\b\1\a5\b\"\0>\b\2\a5\b#\0>\b\3\a4\b\5\0005\t$\0>\t\1\b5\t%\0>\t\2\b5\t&\0>\t\3\b5\t'\0>\t\4\bB\5\3\2=\5 \4B\2\2\0019\2\3\0009\2(\2'\4)\0005\5/\0009\6\31\0009\6 \0064\b\3\0005\t*\0>\t\1\b4\t\5\0005\n+\0>\n\1\t5\n,\0>\n\2\t5\n-\0>\n\3\t5\n.\0>\n\4\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\2(\2'\0040\0005\0056\0009\6\31\0009\6 \0064\b\3\0005\t1\0>\t\1\b4\t\5\0005\n2\0>\n\1\t5\n3\0>\n\2\t5\n4\0>\n\3\t5\n5\0>\n\4\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\0027\2'\0048\0005\0059\0009\6\17\0009\6\18\0069\0067\6B\6\1\2=\6\17\0059\6\31\0009\6 \0064\b\3\0005\t:\0>\t\1\b4\t\4\0005\n;\0>\n\1\t5\n<\0>\n\2\t5\n=\0>\n\3\tB\6\3\2=\6 \5B\2\3\0019\2\3\0009\0027\2'\4>\0005\5?\0009\6\17\0009\6\18\0069\0067\6B\6\1\2=\6\17\0059\6\31\0009\6 \0064\b\3\0005\t@\0>\t\1\b4\t\3\0005\nA\0>\n\1\tB\6\3\2=\6 \5B\2\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\blua\1\0\0\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\fmocword\1\0\1\tname\nspell\1\0\1\tname\nemoji\1\0\1\tname\vbuffer\1\0\1\tname\nvsnip\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\vbefore\0\1\0\2\rmaxwidth\0032\tmode\16symbol_text\15cmp_format\nsetup\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
