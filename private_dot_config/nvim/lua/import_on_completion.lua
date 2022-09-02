local make_handler = function(fn)
    return function(...)
        local config_or_client_id = select(4, ...)
        local is_new = type(config_or_client_id) ~= "number"
        if is_new then
            fn(...)
        else
            local err = select(1, ...)
            local method = select(2, ...)
            local result = select(3, ...)
            local client_id = select(4, ...)
            local bufnr = select(5, ...)
            local config = select(6, ...)
            fn(err, result, { method = method, client_id = client_id, bufnr = bufnr }, config)
        end
    end
end

local should_fix_position = function(edits)
    local range = edits[1].range
    local pos = vim.api.nvim_win_get_cursor(0)
    return range["end"].line == pos[1] - 1
end

local fix_position = function(edits)
    local new_text = edits[1].newText
    local _, new_lines = string.gsub(new_text, "\n", "")

    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = pos[1], pos[2]
    vim.api.nvim_win_set_cursor(0, { row + new_lines, col })
end

local M = {}

local last

M.handle_pum_complete_done = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local completed_item = vim.g['pum#completed_item']

	if
		not (
			completed_item
			and completed_item.user_data
			and completed_item.user_data.lspitem
		)
	then
		return
	end

	local item = vim.fn.json_decode(completed_item.user_data.lspitem)

	if last == item.label then
		return
	end

	last = item.label

	-- use timeout to prevent multiple imports, since CompleteDone can fire multiple times
	vim.defer_fn(function()
		last = nil
	end, 5000)

	vim.lsp.buf_request(
		bufnr,
		"completionItem/resolve",
		item,
		make_handler(function(_, result)
			if not (result and result.additionalTextEdits) then
				return
			end
			local edits = result.additionalTextEdits

			-- when an edit's range includes the current line, the cursor won't move, which is annoying
			local should_fix = should_fix_position(edits)
			vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr, "utf-16")
			if should_fix then
					fix_position(edits)
			end
		end)
	)
end

return M
