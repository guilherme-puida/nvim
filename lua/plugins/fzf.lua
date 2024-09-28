return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "files" },
        { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "help tags" },
        { "<leader>f.", "<cmd>FzfLua resume<cr>", desc = "resume" },
        { "<leader>f/", "<cmd>FzfLua live_grep_glob<cr>", desc = "grep" },
        { "<leader>f/", "<cmd>FzfLua grep_visual<cr>", desc = "grep", mode = "x" },
        { "z=", "<cmd>FzfLua spell_suggest<cr>", desc = "spell" },
    },
    opts = function()
        local actions = require "fzf-lua.actions"

        return {
            fzf_opts = {
                ["--info"] = "default",
                ["--layout"] = "reverse-list",
            },
            keymap = {
                builtin = {
                    ["<C-/>"] = "toggle-help",
                    ["<C-a>"] = "toggle-fullscreen",
                    ["<C-i>"] = "toggle-preview",
                    ["<C-f>"] = "preview-page-down",
                    ["<C-b>"] = "preview-page-up",
                },
                fzf = {
                    ["alt-s"] = "toggle",
                    ["alt-a"] = "toggle-all",
                },
            },
            winopts = {
                height = 0.7,
                width = 0.55,
                preview = {
                    scrollbar = false,
                    layout = "vertical",
                    vertical = "up:40%",
                },
            },
            helptags = {
                actions = {
                    ["enter"] = actions.help_vert,
                },
            },
        }
    end,
}
