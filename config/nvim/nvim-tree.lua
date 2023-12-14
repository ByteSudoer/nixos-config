function winsize()
  return unpack({
    vim.api.nvim_win_get_width(0),
    vim.api.nvim_win_get_height(0),
  })
end

local function inc_width()
  local width, _height = winsize()
  vim.cmd(string.format("NvimTreeResize %d", width + 10))
end

local function dec_width()
  local width, _height = winsize()

  local new_width = width - 10

  if new_width < 30 then
    return
  end

  vim.cmd(string.format("NvimTreeResize %d", width - 10))
end

require("nvim-tree").setup({
  diagnostics = {
    enable = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  -- ignore_ft_on_setup = { "dashboard" },
  -- auto_close = true,
  -- open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = false },
  sort_by = "name",
  -- view = {
  --   mappings = {
  --     custom_only = true,
  --     list = {
  --       { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  --       { key = "<tab>",                          action = "preview" },
  --       { key = "<C-v>",                          action = "vsplit" },
  --       { key = "<C-x>",                          action = "split" },
  --       { key = "<C-t>",                          action = "tabnew" },
  --       { key = "r",                              action = "refresh" },
  --       { key = "a",                              action = "create" },
  --       { key = "d",                              action = "remove" },
  --       { key = "m",                              action = "rename" },
  --       { key = "y",                              action = "copy_name" },
  --       { key = "Y",                              action = "copy_path" },
  --       { key = "gy",                             action = "copy_absolute_path" },
  --       { key = "q",                              action = "close" },
  --       { key = "W",                              action = "collapse_all" },
  --       { key = "S",                              action = "search_node" },
  --       { key = "<C-k>",                          action = "toggle_file_info" },
  --       { key = ">",                              action = "more_wide",         action_cb = inc_width },
  --       { key = "<",                              action = "less_wide",         action_cb = dec_width },
  --     },
  --   },
  -- },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
