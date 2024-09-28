return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit/meta-library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            local configure = require("lsp").configure_server
            local lsp_util = require "lspconfig.util"

            configure "gopls"
            configure "rust_analyzer"
            configure "emmet_language_server"
            configure "html"
            configure "basedpyright"
            configure "ruff"
            configure "hls"
            configure "ocamllsp"
            configure "svelte"

            configure("denols", {
                root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
            })

            configure("ts_ls", {
                root_dir = lsp_util.root_pattern "package.json",
                single_file_support = false,
            })

            configure("lua_ls", {
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                    },
                },
            })

            configure("clangd", {
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--fallback-style=none",
                },
            })
        end,
    },
}
