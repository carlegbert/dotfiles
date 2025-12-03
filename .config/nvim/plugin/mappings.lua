local open_diagnostic_float = function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end

local diag_prev = function()
	vim.diagnostic.jump({ count = -1, float = true })
end

local diag_next = function()
	vim.diagnostic.jump({ count = 1, float = true })
end

vim.keymap.set("n", "<leader>n", vim.cmd.nohlsearch)

vim.keymap.set("n", "[d", diag_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", diag_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", open_diagnostic_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<tab>", "%")
vim.keymap.set("v", "<tab>", "%")

vim.keymap.set("n", "<leader><leader>[", vim.cmd.bprev, { desc = "Next Buffer" })
vim.keymap.set("n", "<leader><leader>]", vim.cmd.bnext, { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader><leader>d", vim.cmd.bdel, { desc = "Delete Buffer" })

-- switch to using nvim_open_win when 0.11 is released
vim.keymap.set("n", "vv", ":vsplit<CR>", { desc = "Open vertical split" })

vim.keymap.set("n", "]c", vim.cmd.cnext, { desc = "Next in quickfix list" })
vim.keymap.set("n", "[c", vim.cmd.cnext, { desc = "Prev in quickfix list" })
vim.keymap.set("n", "<leader>cf", vim.cmd.cfirst, { desc = "First in quickfix list" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right in insert mode" })

vim.keymap.set("n", "<leader>mf", require("misc.make-floating").MakeCurrentWindowFloating)
