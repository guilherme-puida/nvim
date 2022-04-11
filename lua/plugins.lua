local fn = vim.fn
local install_path = fn.stdpath 'data' .. 'site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require'packer'.startup(
  function(use)
    ---- General ----

    -- plugin management
    use 'wbthomason/packer.nvim'

    -- stdlib
    use 'nvim-lua/plenary.nvim'

    -- keybindings
    use 'folke/which-key.nvim'
    use { 'mrjones2014/legendary.nvim', config = { function() require 'config.legendary' end } }

    -- file navigation with telescope
    use { 
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, { 'nvim-lua/plenary.nvim' } },
      config = { function() require 'config.telescope' end },
    }

    ---- Visual ----
    
    -- theme
    use { 'folke/tokyonight.nvim', config = { function() require 'config.tokyonight' end } }

    -- status line
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = { function() require 'config.lualine' end } }

    -- UI stuff
    use 'stevearc/dressing.nvim'

    use { 'lewis6991/gitsigns.nvim', config = function() require'gitsigns'.setup() end }

    ---- Editing ----
    
    -- autopairing opening and closing stuff
    use { 'windwp/nvim-autopairs', config = { function() require'nvim-autopairs'.setup() end } }

    -- commenting lines with `gcc`
    use { 'numToStr/Comment.nvim', config = { function() require'Comment'.setup() end } }

    use { 'lukas-reineke/indent-blankline.nvim', config = { function() require'config.indent-blankline' end } }


    ---- Lsp stuff ----
    use { 'neovim/nvim-lspconfig', config = { function() require 'config.nvim-lspconfig' end } }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = { function() require 'config.nvim-treesitter' end } }

    use { 'ms-jpq/coq_nvim', branch = 'coq', requires = { {'ms-jpq/coq.artifacts', branch = 'artifacts' } }, config = { function() require 'config.coq' end } }


    ---- Terminal ----
    use { 'numToStr/FTerm.nvim', config = { function() require 'config.fterm' end } }

  end
)
