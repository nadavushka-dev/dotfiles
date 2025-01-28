local state = {
  floating = {
    buf = -1,
    win = -1
  }
}

local function open_floating_terminal(opts)
  -- Define the size of the floating window
  opts = opts or {}
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate the starting position
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create the floating window
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a new unlisted buffer
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded", -- Add a border style (rounded, single, double, etc.)
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local terminalosToggle = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_terminal { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end
vim.api.nvim_create_user_command("Terminalos", terminalosToggle, {})

vim.keymap.set({ 'n', 't' }, "<leader>tt", terminalosToggle)

return {}
