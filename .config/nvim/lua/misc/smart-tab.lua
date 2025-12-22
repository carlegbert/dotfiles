function SmartTab()
	local r, c = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	local pattern = "[%)%]%}%\"%'%`%>]"
	local start_idx, _ = string.find(line, pattern, c + 1)

	if start_idx then
		local target_col_before = start_idx - 1

		if c < target_col_before then
			vim.api.nvim_win_set_cursor(0, { r, target_col_before })
		elseif c == target_col_before then
			vim.api.nvim_win_set_cursor(0, { r, start_idx })
		end
	end
end

local M = {
	SmartTab = SmartTab,
}

return M
