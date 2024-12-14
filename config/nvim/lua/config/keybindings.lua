vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "<leader>yc", "\"+y")
vim.keymap.set("n", "<leader>us", "<cmd>e!<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")

-- Disable arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Up>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '', { noremap = true, silent = true })

-- Commenter
vim.api.nvim_set_keymap('n', '<leader>/', 'gcc', {})
vim.api.nvim_set_keymap('v', '<leader>/', 'gc', {})

