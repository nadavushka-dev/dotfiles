local M = {}

M.state = {
  floatingTerm = {
    buf = -1,
    win = -1
  },
  floatingSketch = {
    buf = -1,
    win = -1
  }
}

M.open_floating_window = function(opts)
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

M.sketch = function()
  if not vim.api.nvim_win_is_valid(M.state.floatingSketch.win) then
    M.state.floatingSketch = M.open_floating_window { buf = M.state.floatingSketch.buf }
  else
    vim.api.nvim_win_hide(M.state.floatingSketch.win)
  end
end

M.terminalosToggle = function()
  if not vim.api.nvim_win_is_valid(M.state.floatingTerm.win) then
    M.state.floatingTerm = M.open_floating_window { buf = M.state.floatingTerm.buf }
    if vim.bo[M.state.floatingTerm.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(M.state.floatingTerm.win)
  end
end
vim.api.nvim_create_user_command("Terminalos", M.terminalosToggle, {})

return M
