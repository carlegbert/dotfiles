local eol_insert = function(keys)
	local cursor = vim.api.nvim_win_get_cursor(0)
	vim.cmd("norm A" .. keys)
	vim.api.nvim_win_set_cursor(0, cursor)
end

vim.keymap.set("n", "<leader>;", function()
	eol_insert(";")
end, { noremap = true, silent = true, desc = "Silently insert semicolon at EOL" })

vim.keymap.set("n", "<leader>,", function()
	eol_insert(",")
end, { noremap = true, silent = true, desc = "Silently insert semicolon at EOL" })
