return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[A]dd to [H]arpoon" })

		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle [H]arpoon Menu" })

		vim.keymap.set("n", "<leader>hx", function()
			harpoon:list():remove()
		end, { desc = "Delete from [H]arpoon" })

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				harpoon:list():select(i)
			end)
		end
	end,
}
