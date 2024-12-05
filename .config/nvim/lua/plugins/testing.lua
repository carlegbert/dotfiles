return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = "Neotest: " .. desc })
		end

		local run_all_in_file = function()
			neotest.run.run(vim.fn.expand("%"))
		end

		local run_nearest = function()
			neotest.run.run()
		end

		local toggle_watch = function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end

		map("<leader>ta", run_all_in_file, "Run all in file")
		map("<leader>tn", run_nearest, "Run nearest")
		map("<leader>tw", toggle_watch, "Toggle watching tests in this file")

		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					is_test_file = function()
						-- this probably should be removed if I add some alias for running tests across multiple files.
						return true
					end,
				}),
			},
		})
	end,
}
