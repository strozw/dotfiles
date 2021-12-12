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
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\n\0'\2\v\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\n\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2          let g:fern#default_hidden=1\n          let g:fern#width=50\n          let g:fern#renderer='nerdfont'\n\n          function! FernInit() abort\n            nmap <buffer> <C-L> :TmuxNavigateRight<CR>\n          endfunction\n\n          augroup FernEvents\n            autocmd!\n            autocmd FileType fern call FernInit()\n          augroup END\n        C          nnoremap <silent> <space>x :BufferClose<CR>\n        \14nvim_exec\1\0\2\fnoremap\2\vsilent\2\20:BufferPrev<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\2\20:BufferNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["coc-nvim-lua"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/coc-nvim-lua",
    url = "https://github.com/rafcamlet/coc-nvim-lua"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\n�\25\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\25          \" Always show the signcolumn, otherwise it would shift the text each time\n          \" diagnostics appear/become resolved.\n          if has(\"nvim-0.5.0\") || has(\"patch-8.1.1564\")\n            \" Recently vim can merge signcolumn and number column into one\n            set signcolumn=number\n          else\n            set signcolumn=yes\n          endif\n\n          \" Use <c-space> to trigger completion.\n          if has('nvim')\n            inoremap <silent><expr> <c-space> coc#refresh()\n          else\n            inoremap <silent><expr> <c-@> coc#refresh()\n          endif\n\n\n          \" Make <CR> auto-select the first completion item and notify coc.nvim to\n          \" format on enter, <cr> could be remapped by other vim plugin\n          inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"\n\n          nmap <silent> [d <Plug>(coc-diagnostic-prev)\n          nmap <silent> ]d <Plug>(coc-diagnostic-next)\n\n          \" GoTo code navigation.\n          \"nmap <silent> gd <Plug>(coc-definition)\n          nmap <silent> gd :Telescope coc definitions theme=ivy<CR>\n          \"nmap <silent> gy <Plug>(coc-type-definition)\n          nmap <silent> gy :Telescope coc type_definitions theme=ivy<CR>\n          \"nmap <silent> gi <Plug>(coc-implementation)\n          nmap <silent> gi :Telescope coc implementations theme=ivy<CR>\n          \"nmap <silent> gr <Plug>(coc-references)\n          nmap <silent> gr :Telescope coc references theme=ivy<CR>\n\n          \" Symbol renaming.\n          nmap cr <Plug>(coc-rename)\n\n          \" Applying codeAction to the selected region.\n          xmap ca  <Plug>(coc-codeaction-selected)\n          nmap ca  <Plug>(coc-codeaction-selected)\n\n          \" Remap keys for applying codeAction to the current buffer.\n          nmap ca  <Plug>(coc-codeaction)\n\n          \" Use K to show documentation in preview window.\n          function! s:show_documentation()\n            if (index(['vim','help'], &filetype) >= 0)\n              execute 'h '.expand('<cword>')\n            elseif (coc#rpc#ready())\n              call CocActionAsync('doHover')\n            else\n              execute '!' . &keywordprg . \" \" . expand('<cword>')\n            endif\n          endfunction\n\n          \" Use K to show documentation in preview window.\n          nnoremap <silent> K :call <SID>show_documentation()<CR>\n\n\n          \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n          \" snippets\n          \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n          \" Use <C-l> for trigger snippet expand.\n          imap <C-l> <Plug>(coc-snippets-expand)\n\n          \" Use <C-j> for select text for visual placeholder of snippet.\n          vmap <C-j> <Plug>(coc-snippets-select)\n\n          \" Use <C-j> for jump to next placeholder, it's default of coc.nvim\n          let g:coc_snippet_next = '<c-j>'\n\n          \" Use <C-k> for jump to previous placeholder, it's default of coc.nvim\n          let g:coc_snippet_prev = '<c-k>'\n\n          \" Use <C-j> for both expand and jump (make expand higher priority.)\n          imap <C-j> <Plug>(coc-snippets-expand-jump)\n\n          \" Use <leader>x for convert visual selected code to snippet\n          xmap <leader>x  <Plug>(coc-convert-snippet)\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
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
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0020:Fern . -drawer -width=50 -reveal=%<CR><CR>\ass\1\0\2\fnoremap\2\vsilent\2*:Fern . -drawer -width=50 -toggle<CR>\t<F2>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  ["gina.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\1          let g:gina#command#blame#formatter#format=\"%au:%su%=on %ti %ma%in\"\n          nmap <silent> gb :Gina blame<CR>\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\b\0\0\5\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3�\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3�\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0001&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\texpr\2\tn ]c\1\2\1\0001&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\texpr\2\1\0\1\fnoremap\2\nsigns\1\0\t\20update_debounce\3d\18sign_priority\3\6\14word_diff\1\nnumhl\1\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\20max_file_length\3��\2\15signcolumn\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/glyph-palette.vim",
    url = "https://github.com/lambdalisue/glyph-palette.vim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\b\0\"\00036\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1-�9\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0005\a\15\0=\a\16\6>\6\3\5=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0004\5\0\0=\5\f\0044\5\0\0=\5\17\0045\5\28\0=\5\19\0045\5\29\0=\5\21\0044\5\0\0=\5\23\0044\5\0\0=\5\25\4=\4\30\0034\4\0\0=\4\31\0035\4 \0=\4!\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\tfern\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\17g:coc_status\rfilename\14lualine_b\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\2B\0\2\1K\0\1\0\fitalics\1\0\5\rkeywords\1\14functions\1\14variables\1\fstrings\1\rcomments\2\1\0\3\rcontrast\2\15popup_menu\tdark\fborders\2\nsetup\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nerdfont.vim",
    url = "https://github.com/lambdalisue/nerdfont.vim"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/tcomment_vim",
    url = "https://github.com/tomtom/tcomment_vim"
  },
  ["telescope-coc.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bcoc\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\a\0\0\n\0\27\0$6\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\24�9\1\2\0005\3\r\0005\4\3\0005\5\4\0=\5\5\0045\5\n\0005\6\b\0006\a\0\0'\t\6\0B\a\2\0029\a\a\a=\a\t\6=\6\v\5=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\0016\1\23\0009\1\24\0019\1\25\1'\3\26\0+\4\1\0B\1\3\1K\0\1\0�\3        nmap <Space>o :Telescope find_files<CR>\n        nmap <Space>f :Telescope find_files<CR>\n        nmap <Space>b :Telescope buffers<CR>\n        nmap <Space>s :Telescope live_grep<CR>\n        nmap <Space>ll :Telescope loclist<CR>\n        nmap <Space>ln :Telescope jumplist<CR>\n        nmap <Space>gf :Telescope git_files<CR>\n        nmap <Space>gs :Telescope git_status<CR>\n        nmap <Space>gb :Telescope git_bcommits<CR>\n        nmap <Space>gla :Telescope git_commits<CR>\n      \14nvim_exec\bapi\bvim\15extensions\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\fpickers\15find_files\1\0\0\1\0\3\14no_ignore\1\vhidden\2\16find_comand\arg\rdefaults\1\0\0\rmappings\6i\1\0\0\t<F2>\1\0\0\19toggle_preview\29telescope.actions.layout\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\ntheme\vcursor\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight-vim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\v6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0+\3\1\0B\0\3\1K\0\1\0�\1          let g:tokyonight_style = 'night'\n          let g:tokyonight_enable_italic = 1\n          let g:tokyonight_disable_italic_comment = 1\n        \14nvim_exec\bapi\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/tokyonight-vim",
    url = "https://github.com/ghifarit53/tokyonight-vim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-mergetool"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0j          let g:mergetool_layout = 'lmr'\n          let g:mergetool_prefer_revision = 'local'\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-mergetool",
    url = "https://github.com/samoshkin/vim-mergetool"
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
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  winresizer = {
    config = { "\27LJ\2\nm\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0<          let g:winresizer_start_key = '<C-E>'\n        \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/satoru/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ni\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: fern.vim
time([[Config for fern.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0020:Fern . -drawer -width=50 -reveal=%<CR><CR>\ass\1\0\2\fnoremap\2\vsilent\2*:Fern . -drawer -width=50 -toggle<CR>\t<F2>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "fern.vim")
time([[Config for fern.vim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\b\0\0\5\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\rrelative\vcursor\nstyle\fminimal\vborder\vsingle\bcol\3\1\brow\3\0&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3�\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\rinterval\3�\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0001&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\texpr\2\tn ]c\1\2\1\0001&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\texpr\2\1\0\1\fnoremap\2\nsigns\1\0\t\20update_debounce\3d\18sign_priority\3\6\14word_diff\1\nnumhl\1\23current_line_blame\1\24attach_to_untracked\2\vlinehl\1\20max_file_length\3��\2\15signcolumn\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‾\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b│\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b│\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\b\0\"\00036\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1-�9\1\2\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0005\6\14\0005\a\15\0=\a\16\6>\6\3\5=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\4=\4\26\0035\4\27\0004\5\0\0=\5\f\0044\5\0\0=\5\17\0045\5\28\0=\5\19\0045\5\29\0=\5\21\0044\5\0\0=\5\23\0044\5\0\0=\5\25\4=\4\30\0034\4\0\0=\4\31\0035\4 \0=\4!\3B\1\2\1K\0\1\0\15extensions\1\2\0\0\tfern\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\17g:coc_status\rfilename\14lualine_b\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: winresizer
time([[Config for winresizer]], true)
try_loadstring("\27LJ\2\nm\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0<          let g:winresizer_start_key = '<C-E>'\n        \14nvim_exec\bapi\bvim\0", "config", "winresizer")
time([[Config for winresizer]], false)
-- Config for: gina.vim
time([[Config for gina.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\1          let g:gina#command#blame#formatter#format=\"%au:%su%=on %ti %ma%in\"\n          nmap <silent> gb :Gina blame<CR>\n        \14nvim_exec\bapi\bvim\0", "config", "gina.vim")
time([[Config for gina.vim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\n\0'\2\v\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\n\0'\2\f\0+\3\1\0B\0\3\1K\0\1\0�\2          let g:fern#default_hidden=1\n          let g:fern#width=50\n          let g:fern#renderer='nerdfont'\n\n          function! FernInit() abort\n            nmap <buffer> <C-L> :TmuxNavigateRight<CR>\n          endfunction\n\n          augroup FernEvents\n            autocmd!\n            autocmd FileType fern call FernInit()\n          augroup END\n        C          nnoremap <silent> <space>x :BufferClose<CR>\n        \14nvim_exec\1\0\2\fnoremap\2\vsilent\2\20:BufferPrev<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\2\20:BufferNext<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: vim-mergetool
time([[Config for vim-mergetool]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0j          let g:mergetool_layout = 'lmr'\n          let g:mergetool_prefer_revision = 'local'\n        \14nvim_exec\bapi\bvim\0", "config", "vim-mergetool")
time([[Config for vim-mergetool]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: telescope-coc.nvim
time([[Config for telescope-coc.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bcoc\19load_extension\14telescope\frequire\0", "config", "telescope-coc.nvim")
time([[Config for telescope-coc.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\2B\0\2\1K\0\1\0\fitalics\1\0\5\rkeywords\1\14functions\1\14variables\1\fstrings\1\rcomments\2\1\0\3\rcontrast\2\15popup_menu\tdark\fborders\2\nsetup\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: tokyonight-vim
time([[Config for tokyonight-vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\v6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0+\3\1\0B\0\3\1K\0\1\0�\1          let g:tokyonight_style = 'night'\n          let g:tokyonight_enable_italic = 1\n          let g:tokyonight_disable_italic_comment = 1\n        \14nvim_exec\bapi\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight-vim")
time([[Config for tokyonight-vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\a\0\0\n\0\27\0$6\0\0\0'\2\1\0B\0\2\2\15\0\0\0X\1\24�9\1\2\0005\3\r\0005\4\3\0005\5\4\0=\5\5\0045\5\n\0005\6\b\0006\a\0\0'\t\6\0B\a\2\0029\a\a\a=\a\t\6=\6\v\5=\5\f\4=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\0016\1\23\0009\1\24\0019\1\25\1'\3\26\0+\4\1\0B\1\3\1K\0\1\0�\3        nmap <Space>o :Telescope find_files<CR>\n        nmap <Space>f :Telescope find_files<CR>\n        nmap <Space>b :Telescope buffers<CR>\n        nmap <Space>s :Telescope live_grep<CR>\n        nmap <Space>ll :Telescope loclist<CR>\n        nmap <Space>ln :Telescope jumplist<CR>\n        nmap <Space>gf :Telescope git_files<CR>\n        nmap <Space>gs :Telescope git_status<CR>\n        nmap <Space>gb :Telescope git_bcommits<CR>\n        nmap <Space>gla :Telescope git_commits<CR>\n      \14nvim_exec\bapi\bvim\15extensions\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\fpickers\15find_files\1\0\0\1\0\3\14no_ignore\1\vhidden\2\16find_comand\arg\rdefaults\1\0\0\rmappings\6i\1\0\0\t<F2>\1\0\0\19toggle_preview\29telescope.actions.layout\18layout_config\1\0\1\20prompt_position\btop\1\0\2\21sorting_strategy\14ascending\ntheme\vcursor\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\n�\25\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\1K\0\1\0�\25          \" Always show the signcolumn, otherwise it would shift the text each time\n          \" diagnostics appear/become resolved.\n          if has(\"nvim-0.5.0\") || has(\"patch-8.1.1564\")\n            \" Recently vim can merge signcolumn and number column into one\n            set signcolumn=number\n          else\n            set signcolumn=yes\n          endif\n\n          \" Use <c-space> to trigger completion.\n          if has('nvim')\n            inoremap <silent><expr> <c-space> coc#refresh()\n          else\n            inoremap <silent><expr> <c-@> coc#refresh()\n          endif\n\n\n          \" Make <CR> auto-select the first completion item and notify coc.nvim to\n          \" format on enter, <cr> could be remapped by other vim plugin\n          inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"\n\n          nmap <silent> [d <Plug>(coc-diagnostic-prev)\n          nmap <silent> ]d <Plug>(coc-diagnostic-next)\n\n          \" GoTo code navigation.\n          \"nmap <silent> gd <Plug>(coc-definition)\n          nmap <silent> gd :Telescope coc definitions theme=ivy<CR>\n          \"nmap <silent> gy <Plug>(coc-type-definition)\n          nmap <silent> gy :Telescope coc type_definitions theme=ivy<CR>\n          \"nmap <silent> gi <Plug>(coc-implementation)\n          nmap <silent> gi :Telescope coc implementations theme=ivy<CR>\n          \"nmap <silent> gr <Plug>(coc-references)\n          nmap <silent> gr :Telescope coc references theme=ivy<CR>\n\n          \" Symbol renaming.\n          nmap cr <Plug>(coc-rename)\n\n          \" Applying codeAction to the selected region.\n          xmap ca  <Plug>(coc-codeaction-selected)\n          nmap ca  <Plug>(coc-codeaction-selected)\n\n          \" Remap keys for applying codeAction to the current buffer.\n          nmap ca  <Plug>(coc-codeaction)\n\n          \" Use K to show documentation in preview window.\n          function! s:show_documentation()\n            if (index(['vim','help'], &filetype) >= 0)\n              execute 'h '.expand('<cword>')\n            elseif (coc#rpc#ready())\n              call CocActionAsync('doHover')\n            else\n              execute '!' . &keywordprg . \" \" . expand('<cword>')\n            endif\n          endfunction\n\n          \" Use K to show documentation in preview window.\n          nnoremap <silent> K :call <SID>show_documentation()<CR>\n\n\n          \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n          \" snippets\n          \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n          \" Use <C-l> for trigger snippet expand.\n          imap <C-l> <Plug>(coc-snippets-expand)\n\n          \" Use <C-j> for select text for visual placeholder of snippet.\n          vmap <C-j> <Plug>(coc-snippets-select)\n\n          \" Use <C-j> for jump to next placeholder, it's default of coc.nvim\n          let g:coc_snippet_next = '<c-j>'\n\n          \" Use <C-k> for jump to previous placeholder, it's default of coc.nvim\n          let g:coc_snippet_prev = '<c-k>'\n\n          \" Use <C-j> for both expand and jump (make expand higher priority.)\n          imap <C-j> <Plug>(coc-snippets-expand-jump)\n\n          \" Use <leader>x for convert visual selected code to snippet\n          xmap <leader>x  <Plug>(coc-convert-snippet)\n        \14nvim_exec\bapi\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
