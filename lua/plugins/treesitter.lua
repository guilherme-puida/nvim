return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                max_lines = 3,
                multiline_threshold = 1,
                min_window_height = 20,
            },
        },
        version = false,
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            ensure_installed = { "lua", "vim", "vimdoc" },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        },
    },
}
