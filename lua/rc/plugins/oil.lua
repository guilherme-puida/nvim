return {
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
    keys = {
      { '<leader>ee', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    }
  }
}
