require("opts")
require("mappings")
require("eol")
require("fqf")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	"tpope/vim-fugitive",
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	"amdt/vim-niji",
	"jiangmiao/auto-pairs",
	"lewis6991/satellite.nvim",

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 5,
			trim_scope = "outer",
		},
		init = function()
			local tsctx = require("treesitter-context")
			vim.keymap.set("n", "<leader>tt", tsctx.toggle, { desc = "[T]oggle [T]reesitter Context" })
		end,
	},

	{ "nvim-lualine/lualine.nvim", opts = { theme = "auto" } },

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("cyberdream")
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				line = "<leader>/",
				block = "<leader>\\",
			},
			opleader = {
				line = "<leader>/",
				block = "<leader>\\",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
			local api = require("nvim-tree.api")
			vim.keymap.set("n", "<leader>ds", api.tree.toggle, { desc = "Toggle Tree" })
		end,
	},
})
