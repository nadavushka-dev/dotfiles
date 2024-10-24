return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set('n', '<leader>tt',
      '<CMD>FloatermNew --height=0.8 --width=0.9 --wintype=float --autoclose=2<CR>')
    vim.keymap.set('n', '<leader>kt','<CMD>FloatermKill<CR>')
    vim.keymap.set('n', '<leader>lg',
      '<CMD>FloatermNew --height=0.8 --width=0.9 --wintype=float --autoclose=2 lazygit<CR>')
  end
}
