return {
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = true,
    keys = {
      { '<leader>gg', '<cmd>Neogit kind=split<cr>', 'git panel (split)' },
      { '<leader>gG', '<cmd>Neogit<cr>', 'git panel' },
    }
  },
}
