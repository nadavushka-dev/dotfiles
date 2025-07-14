return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Explicitly enable preview
        previewer = true,
        -- Make sure there's no preview cutoff
        preview = {
          hide_on_startup = false -- Ensure preview is shown by default
        },
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.95,
          height = 0.85,
          preview_width = 0.55, -- 55% width for preview
          preview_cutoff = 1,   -- Show preview even in small windows
        },
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
