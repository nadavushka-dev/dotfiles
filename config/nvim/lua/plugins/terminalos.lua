local floater = require("self.floater")
vim.keymap.set({ 'n', 't' }, "<leader>tt", floater.terminalosToggle)
vim.keymap.set({ 'n' }, "<leader>sk", floater.sketch)

return {
}
