require "settings"
require "keymaps"
require "autocmds"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp = vim.opt.rtp ^ lazypath

require("lazy").setup("plugins", {
    change_detection = { notify = false },
})
