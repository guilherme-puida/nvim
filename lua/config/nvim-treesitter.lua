require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "javascript", "go", "gomod", "gowork", "rust", "lua", "c", "typescript"},
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
