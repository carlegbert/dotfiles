require('carl.opts')
require('carl.mappings')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require('carl.gitsigns'),
  require('carl.telescope'),
  require('carl.lsp'),
  require('carl.nvim-cmp'),
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  'amdt/vim-niji',
  'jiangmiao/auto-pairs',
  'lewis6991/satellite.nvim',
  'tpope/vim-fugitive',

  { 'nvim-lualine/lualine.nvim', opts = {} },


  {
    'folke/neodev.nvim',
    opts = {}
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>/',
        block = '<leader>\\',
      },
      opleader = {
        line = '<leader>/',
        block = '<leader>\\',
      }
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
