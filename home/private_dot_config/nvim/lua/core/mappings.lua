vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- buffers
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bq", ":bd<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>ba", ":%bd<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<cr>", { desc = "Close other buffers" })

-- replace
vim.keymap.set("n", "<leader>rn", ":%s/\\r//g<cr>", { desc = "Remove carriage return" })
