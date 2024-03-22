return {
  {
    'echasnovski/mini.pairs',
    config = true,
  },
  {
    'echasnovski/mini.trailspace',
    config = true,
  },
  {
    'echasnovski/mini.comment',
    config = true,
  },
  {
    'echasnovski/mini.statusline',
    opts = {
      set_vim_settings = false,
    },
  },
  {
    'echasnovski/mini.files',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      windows = {
        max_number = 3,
      },
    },
    keys = {
      { '<leader>ee', '<cmd>lua MiniFiles.open()<cr>', desc = 'open directory' },
    },
  },
}
