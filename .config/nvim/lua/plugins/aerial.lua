return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function(_, opts)
		local aerial = require("aerial")
		aerial.setup(opts)
		vim.keymap.set("n", "<leader>a", aerial.toggle, { desc = "Toggle [A]erial" })
	end,
}
