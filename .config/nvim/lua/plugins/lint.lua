return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		linters_by_ft = {
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			python = { "ruff" },
		}
	},
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				require('lint').try_lint()
			end
		})
	end,
}
