local set = vim.keymap.set

-- clear search with esc.
set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- undo breakpoints.
set('i', ',', ',<c-g>u')
set('i', '.', '.<c-g>u')
set('i', ';', ';<c-g>u')
