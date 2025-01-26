vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.scrolloff = 8
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.mouse = ''

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Initialize the variable to store the last command
vim.g.last_command = ""

-- Autocommand to capture the last command
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    -- Capture the last command line input
    vim.g.last_command = vim.fn.getcmdline()
  end
})

