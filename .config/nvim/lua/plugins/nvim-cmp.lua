return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end
        }
      }
    },
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-Space>'] = cmp.mapping.confirm { select = true },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
    }

    local lsfwd = function() luasnip.jump(1) end
    local lsback = function() luasnip.jump(-1) end
    local change_choice = function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end

    local map = function(mode, keys, fn, desc)
      vim.keymap.set(mode, keys, fn, {
        silent = true,
        desc = 'Luasnip: ' .. desc,
      })
    end

    map('i', '<C-K>', luasnip.expand, 'Expand Snippet')
    map({ 'i', 's' }, '<C-L>', lsfwd, 'Forward')
    map({ 'i', 's' }, '<C-J>', lsback, 'Back')
    map({ 'i', 's' }, '<C-E>', change_choice, 'Change Choice')
  end,
}
