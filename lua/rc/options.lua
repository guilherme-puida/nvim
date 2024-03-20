local opt = vim.opt

opt.backup      = false    -- don't store backups.
opt.breakindent = true     -- indent wrapped lines to math line start.
opt.cursorline  = true     -- highlight current line.
opt.expandtab   = true     -- indent with spaces.
opt.ignorecase  = true     -- ignore case when searching.
opt.infercase   = true     -- infer letter cases on completion.
opt.laststatus  = 3        -- global statusline.
opt.linebreak   = true     -- wrap long lines at 'breakat' if 'wrap' is set.
opt.number      = true     -- show line numbers
opt.pumheight   = 10       -- make popup menu smaller.
opt.ruler       = false    -- don't show cursor position on the status line.
opt.shiftround  = true     -- shift by multiple of tabstop.
opt.shiftwidth  = 0        -- shift by 'tabstop'.
opt.showmode    = false    -- don't show current mode on the status line.
opt.signcolumn  = 'yes'    -- always show sign column.
opt.smartcase   = true     -- don't ignore case if any upper-case character.
opt.smartindent = true     -- smarter indentation.
opt.splitbelow  = true     -- horizontal splits will be placed below.
opt.splitkeep   = 'screen' -- keep cursor position when splitting.
opt.splitright  = true     -- vertical splits will be placed on the right.
opt.tabstop     = 2        -- tabs are two spaces.
opt.undofile    = true     -- persistent undo.
opt.undolevels  = 10000    -- save more undo steps.
opt.wrap        = false    -- don't wrap long lines.
opt.writebackup = false    -- don't store backups.

opt.shortmess:append('WcC') -- show less status line messages.

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '
