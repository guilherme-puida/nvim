local au = function(name, opts)
    vim.api.nvim_create_augroup("puida/" .. name, opts or {})
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
    group = au("close-with-q", { clear = true }),
    desc = "Close with <q>",
    pattern = {
        "git",
        "help",
        "man",
    },
    callback = function(args)
        vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
    end,
})

autocmd("TextYankPost", {
    group = au("yank-highlight", { clear = true }),
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", priority = 250 }
    end,
})
