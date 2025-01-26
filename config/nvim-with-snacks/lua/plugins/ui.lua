local function last_exec_command()
  local foo = vim.g.last_command
  return (foo ~= nil and foo ~= '') and string.format(':%s', foo) or ''
end


-- kirby belongs to:   https://github.com/rachartier/dotfiles/blob/main/.config%2Fnvim%2Flua%2Fplugins%2Fui%2Flualine.lua#L159
local kirby_default = "(>*-*)>"
local mode_kirby = {
  n = "<(•ᴗ•)>",
  i = "<(•o•)>",
  v = "(v•-•)v",
  [""] = "(v•-•)>",
  V = "(>•-•)>",
  c = kirby_default,
  no = "<(•ᴗ•)>",
  s = kirby_default,
  S = kirby_default,
  [""] = kirby_default,
  ic = kirby_default,
  R = kirby_default,
  Rv = kirby_default,
  cv = "<(•ᴗ•)>",
  ce = "<(•ᴗ•)>",
  r = kirby_default,
  rm = kirby_default,
  ["r?"] = kirby_default,
  ["!"] = "<(•ᴗ•)>",
  t = "<(•ᴗ•)>",
}

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
        lualine_a = {
          {
            "mode",
            -- icons_enabled = true,
            fmt = function()
              return mode_kirby[vim.fn.mode()] or vim.api.nvim_get_mode().mode
            end,
            separator = { right = "" },
            padding = { left = 1, right = 0 },
          },
        },
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
