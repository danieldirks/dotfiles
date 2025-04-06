vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- buffers
vim.keymap.set("n", "<leader>b",  "", { desc = "buffers" })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>bq", ":bd<cr>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>ba", ":%bd<cr>", { desc = "close all buffers" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<cr>", { desc = "close other buffers" })

-- replace
vim.keymap.set("n", "<leader>r",  "", { desc = "replace" })
vim.keymap.set("n", "<leader>rn", ":%s/\\r//g<cr>", { desc = "remove carriage return" })
