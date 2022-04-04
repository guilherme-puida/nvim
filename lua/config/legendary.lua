local legendary = require 'legendary'
local wk = require 'which-key'
local telescope = require 'telescope.builtin'

vim.g.mapleader = ' '

wk.setup {
  plugins = {
    spelling = {
      enabled = true,
    },
  },
}

legendary.setup()

wk.register {
  ['<leader>'] = {
    f = {
      name = '+find',
      f = { telescope.find_files, 'Find files' },
      s = { telescope.live_grep, 'Live grep'},
      b = { telescope.buffers, 'Find open buffer'},
      h = { telescope.help_tags, 'Search help tags'},
      c = { telescope.commands, 'Find command'},
      r = { telescope.resume, 'Resume last search'},
      q = { telescope.quickfix, 'Search quickfix list'},
      g = {
        name = '+git',
        c = { telescope.git_commits, 'List git commits'},
        b = { telescope.git_branches, 'List git branches'},
        s = { telescope.git_status, 'List git status'},
        t = { telescope.git_stash, 'List stash items in current directory'}
      },
      l = {
        name = '+lsp',
        r = { telescope.lsp_references, 'List all references for word under cursor'},
        o = { telescope.diagnostics, 'Show diagnostics for all open buffers'},
        i = { telescope.lsp_implementations, 'Show implementations of word under cursor'},
        d = { telescope.lsp_definitions, 'Show definitions of word under cursor'},
        t = { telescope.lsp_type_definitions, 'Show type definitions of word under cursor'}
      }
    },
  }
}


