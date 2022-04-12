local fterm = require 'FTerm'

-- vim.api.nvim_add_user_command('FTermOpen', fterm.open, { bang = true })
-- vim.api.nvim_add_user_command('FTermClose', fterm.close, { bang = true })
-- vim.api.nvim_add_user_command('FTermExit', fterm.exit, { bang = true })
-- vim.api.nvim_add_user_command('FTermToggle', fterm.toggle, { bang = true })

-- Terminal for gitui
local gitui = fterm:new {
  cmd = 'gitui',
}

function _G.__fterm_gitui()
  gitui:toggle()
end

-- Terminal for btop
local btop = fterm:new {
  cmd = 'btop'
}

function _G.__fterm_btop()
  btop:toggle()
end

