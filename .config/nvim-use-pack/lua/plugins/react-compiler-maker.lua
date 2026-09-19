vim.pack.add({
  "https://github.com/blazejkustra/react-compiler-marker"
})

-- install / update 時に自動でビルドスクリプトを実行
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(args)
    local data = args.data or {}
    local spec = data.spec or {}

    -- このプラグインの install/update イベントだけを拾う
    if spec.name ~= 'react-compiler-marker' then
      return
    end
    -- if data.kind ~= 'install' and data.kind ~= 'update' then
    --   return
    -- end

    -- spec.path (or data.path) にプラグインの実ディレクトリが入っている
    local plugin_dir = data.path or spec.path

    vim.notify('Building react-compiler-marker LSP server...', vim.log.levels.INFO)

    vim.system(
      { './scripts/build-nvim.sh' },
      { cwd = plugin_dir },
      function(obj)
        vim.schedule(function()
          if obj.code == 0 then
            vim.notify('react-compiler-marker: build succeeded', vim.log.levels.INFO)
          else
            vim.notify(
              'react-compiler-marker: build failed\n' .. (obj.stderr or ''),
              vim.log.levels.ERROR
            )
          end
        end)
      end
    )
  end,
})

local ok, rcm = pcall(require, 'react-compiler-marker')

if ok then
  rcm.setup({})
end
