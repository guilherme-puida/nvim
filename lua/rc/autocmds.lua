local function augroup(name)
  return vim.api.nvim_create_augroup('rc_' .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

-- check if we need to realod the file when it has changed.
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd 'checktime'
    end
  end,
})

-- highlight on yank.
autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits when window is resized.
autocmd('VimResized', {
  group = augroup('resize_splits'),
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
