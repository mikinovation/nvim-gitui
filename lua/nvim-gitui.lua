local M = {}

vim.g.loaded_nvim_gitui = 0

-- default config
local default_config = {
  -- Keymaps settings
  keymaps = {
    n = "<leader>gu", -- Normal mode keybinding
  },
  -- Window appearance settings
  window = {
    width = 0.9, -- Window width as a percentage of the screen
    height = 0.9, -- Window height as a percentage of the screen
    border = "rounded", -- Border style (options: "rounded", "single", "double", "shadow", "none")
  }
}

M.config = {}

M.setup = function(config)
  config = vim.tbl_deep_extend("force", default_config, config or {})

  vim.api.nvim_set_keymap(
    "n",
    config.keymaps.n,
    "<cmd>lua require('nvim-gitui').open_gitui()<cr>",
    { noremap = true, silent = true }
  )
end

M.open_gitui = function()
  -- calculate window size
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  local win_height = math.ceil(height * 0.9)
  local win_width = math.ceil(width * 0.9)
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- create buffer
  local bufnr = vim.api.nvim_create_buf(false, true)

  -- setting window options
  local window_options = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded"
  }

  -- open window
  local win_id = vim.api.nvim_open_win(bufnr, true, window_options)

  -- execute gitui on window
  vim.fn.termopen("gitui", {
    on_exit = function()
      vim.api.nvim_win_close(win_id, true)
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end,
  })

  -- change to insert mode
  vim.cmd("startinsert!")
end

vim.g.loaded_nvim_gitui = 1

return M
