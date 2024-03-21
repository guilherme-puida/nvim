local max_treesitter_highlight_filesize = 100 * 1024 -- 100 kb

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buffer)
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buffer))
          if ok and stats and stats.size > max_treesitter_highlight_filesize then
            return true
          end
        end,
      },
    },
    config = function(_, opts)
      require 'nvim-treesitter.configs'.setup(opts)
    end
  },
}
