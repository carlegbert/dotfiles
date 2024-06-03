return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 0,
    },
    on_attach = function(buf)
      local gitsigns = require 'gitsigns'
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = buf, desc = 'Gitsigns: ' .. desc })
      end

      local vmap = function(keys, func, desc)
        vim.keymap.set('v', keys, func, { buffer = buf, desc = 'Gitsigns (Visual): ' .. desc })
      end

      local next_hunk = function()
        gitsigns.nav_hunk('next')
      end

      local prev_hunk = function()
        gitsigns.nav_hunk('prev')
      end

      local full_blame = function()
        gitsigns.blame_line { full = true }
      end

      local stage_visual = function()
        gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
      end

      local reset_visual = function()
        gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
      end

      local setqf = function()
        gitsigns.setqflist('all', { open = false })
      end

      map(']h', next_hunk, 'Next [H]unk')
      map('[h', prev_hunk, 'Previous [H]unk')

      map('<leader>hs', gitsigns.stage_hunk, '[S]tage [H]unk')
      map('<leader>hr', gitsigns.reset_hunk, '[R]eset [H]unk')
      vmap('<leader>hs', stage_visual, '[S]tage [H]unk')
      vmap('<leader>hr', reset_visual, '[R]eset [H]unk')
      map('<leader>hu', gitsigns.undo_stage_hunk, '[U]ndo stage [H]unk')
      map('<leader>hS', gitsigns.stage_buffer, '[S]tage buffer')
      map('<leader>hR', gitsigns.reset_buffer, '[R]eset buffer')

      map('<leader>hp', gitsigns.preview_hunk, '[P]review [H]unk')
      map('<leader>hb', full_blame, 'Show full [B]lame for [H]unk')

      map('<leader>tb', gitsigns.toggle_current_line_blame, '[T]oggle inline git [B]lame')

      map('<leader>hd', gitsigns.diffthis, 'Show diff')
      map('<leader>hD', function() gitsigns.diffthis('~') end, 'Show diff')

      map('<leader>hq', setqf, 'Unstaged changes to [Q]uickfix')
    end
  },
}
