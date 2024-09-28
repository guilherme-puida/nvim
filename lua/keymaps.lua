local set = vim.keymap.set

set("v", "<", "<gv")
set("v", ">", ">gv")

set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "close tab" })
set("n", "<leader>tn", "<cmd>tab split<cr>", { desc = "new tab" })
set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "close other tabs" })
