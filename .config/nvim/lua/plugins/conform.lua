return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "gofmt" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			ocaml = { "ocamlformat" },
			python = { "ruff_format" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
		formatters = {
			ocamlformat = {
				prepend_args = {
					"--if-then-else",
					"vertical",
					"--break-cases",
					"fit-or-vertical",
					"--type-decl",
					"sparse",
				},
			},
		},
	},
}
