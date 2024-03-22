return {
  {
    'folke/which-key.nvim',
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { 'n', 'v' },
        ['g'] = { name = '+goto' },
        ['z'] = { name = '+fold' },
        [']'] = { name = '+next' },
        ['['] = { name = '+prev' },
        ['<leader>e'] = { name = '+explore' },
        ['<leader>f'] = { name = '+file/find' },
      },
    },
    config = function(_, opts)
      local wk = require 'which-key'
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
}
