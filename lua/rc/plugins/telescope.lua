return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown()
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      local set = vim.keymap.set

      set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
      set('n', '<leader>fh', builtin.help_tags, { desc = 'help' })
      set('n', '<leader>fk', builtin.keymaps, { desc = 'keymaps' })
      set('n', '<leader>ff', builtin.find_files, { desc = 'files' })
      set('n', '<leader>fw', builtin.grep_string, { desc = 'word' })
      set('n', '<leader>fl', builtin.live_grep, { desc = 'live grep' })
      set('n', '<leader>fr', builtin.resume, { desc = 'resume' })
      set('n', '<leader>f.', builtin.oldfiles, { desc = 'recent files' })

      set('n', '<leader>f/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        }) end, { desc = 'search in buffer' })

      set('n', '<leader>fo', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'live grep in open files',
        }
      end, { desc = 'live grep open' })
    end
  }
}
