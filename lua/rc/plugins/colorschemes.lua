return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    opts = {
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
        },
      },
    },
    config = function(_, opts)
      require 'catppuccin'.setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    priority = 1000,
    opts = {
      dimInactive = true,
      background = {
        dark = 'dragon',
        light = 'lotus',
      },
    },
    config = function(_, opts)
      require 'kanagawa'.setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      dim_inactive = true,
    },
    config = function(_, opts)
      require 'nightfox'.setup(opts)
      vim.cmd.colorscheme 'carbonfox'
    end
  }
}
