return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      show_end_of_buffer = true,
      dim_inactive = {
        enabled = true,
      },
      color_overrides = {
        mocha = {
          base = '#000000',
          mantle = '#000000',
          crust = '#000000',
        }
      },
      integrations = {
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
      },
    },
    config = function(_, opts)
      require 'catppuccin'.setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end
  }
}
