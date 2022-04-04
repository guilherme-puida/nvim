local opt = vim.opt
local cmd = vim.api.nvim_command
local g = vim.g

--- General stuff ---
opt.mouse = 'n'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noselect'
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.autowriteall = true
opt.laststatus = 3

--- UI ---
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
cmd [[syntax on]]

--- Editing ---
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

--- Performance ---
opt.lazyredraw = true
opt.ttyfast = true
opt.updatetime = 250
opt.history = 100

--- Startup ---
opt.shortmess:append 'sI'

local disabled_plugins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit'
}

for _, plugin in pairs(disabled_plugins) do
  g['loaded_'..plugin] = 1
end

--- setting 2 space indentation for certain filetypes
cmd [[autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,typescript setlocal shiftwidth=2 tabstop=2]]
