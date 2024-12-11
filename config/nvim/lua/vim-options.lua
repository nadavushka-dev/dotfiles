vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

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

vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<Up>', '', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<Down>', '', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<Left>', '', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<Right>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle left<CR>")

