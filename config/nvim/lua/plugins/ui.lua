local function last_exec_command()
  local foo = vim.g.last_command
  return (foo ~= nil and foo ~= '') and string.format(':%s', foo) or ''
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "#d3cdc3",
      normal_bg = "#282828",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      legacy_computing_symbols_support = false,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true
      },
      messages = {
        enabled = false
      },
      notify = {
        enabled = false
      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { last_exec_command },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    },
  },
}
