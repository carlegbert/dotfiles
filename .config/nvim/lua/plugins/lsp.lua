return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local vmap = function(keys, func, desc)
					vim.keymap.set("v", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

				map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				vmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				map("K", vim.lsp.buf.hover, "Hover Documentation")

				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local telescope_builtin = require("telescope.builtin")

				local doc_symbols = function()
					return telescope_builtin.lsp_document_symbols({
						ignore_symbols = { "constant", "variable" },
					})
				end

				map("<leader>ss", doc_symbols, "[S]earch Document [S]ymbols")
				map("<leader>sas", telescope_builtin.lsp_document_symbols, "[S]earch [A]ll Document [S]ymbols")
				map("<leader>ws", telescope_builtin.lsp_workspace_symbols, "[W]orkspace [S]ymbols")

				map("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")

				map("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			ts_ls = {},

			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							Version = "LuaJIT",
						},
						completion = {},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			},
		}

		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, {
			"ruff",
			"stylua",
			"eslint",
			"prettier",
			"dockerls",
			"clangd",
			"cpptools",
			"vale",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
