vim.g.mapleader = " "
vim.g.maplocalleader = ";"

vim.keymap.set("n", "<F3>", ":UndoTreeToggle<CR>", { desc = "open undo tree" })
vim.keymap.set("n", "<F2>", ":Neotree<CR>", { desc = "open neo-tree" })
