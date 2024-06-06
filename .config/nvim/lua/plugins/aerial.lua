return {
  'stevearc/aerial.nvim',
  opts = {
    on_attach = function(bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Aerial: ' .. desc })
      end

      local aerial = require('aerial')

      map('<leader>{', aerial.prev, 'Previous Symbol')
      map('<leader>}', aerial.next, 'Next Symbol')
    end,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },

  config = function(_, opts)
    local aerial = require('aerial')
    aerial.setup(opts)
    vim.keymap.set('n', '<leader>a', aerial.toggle, { desc = 'Toggle [A]erial' })
  end
}
