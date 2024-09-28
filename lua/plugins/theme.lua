return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            options = {
                styles = {
                    comments = "italic",
                    types = "bold",
                },
            },
            groups = {
                all = {
                    SnippetTabStop = { link = "Search" },
                },
            },
        },
        config = function(_, opts)
            require("nightfox").setup(opts)
            vim.cmd.colorscheme "carbonfox"
        end,
    },
}
