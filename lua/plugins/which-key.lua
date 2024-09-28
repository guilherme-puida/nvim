return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        spec = {
            { "<leader>c", group = "code", mode = { "n", "x" } },
            { "<leader>f", group = "find" }
        },
    },
}
