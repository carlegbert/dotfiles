return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'javascript',
      'json',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'mermaid',
      'prisma',
      'python',
      'rust',
      'sql',
      'terraform',
      'tmux',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        -- keymaps are set manually in the config below for better searchability.
        init_selection = false,
        scope_incremental = false,
        node_incremental = false,
        node_decremental = false,
      },
    },
  },
  config = function(_, opts)
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = 'Treesitter Incremental Selection: ' .. desc })
    end

    local incremental_selection = require('nvim-treesitter.incremental_selection')

    map('n', '<leader>v', incremental_selection.init_selection, 'Begin Selection')
    map('v', '<leader>vs', incremental_selection.scope_incremental, 'Select [S]cope')
    map('v', '<leader>vi', incremental_selection.node_incremental, 'Node [I]ncremental')
    map('v', '<leader>vd', incremental_selection.node_decremental, 'Node [D]ecremental')

    vim.highlight.priorities.semantic_tokens = 95

    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup(opts)
  end
}
