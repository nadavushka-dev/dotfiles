vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4

vim.opt.undofile = true
vim.opt.undodir = '.vim/undo'

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("v", "<leader>yc", "\"+y")

-- Navigate vim panes better
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")

vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle left<CR>")


