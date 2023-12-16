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
local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<tab>", api.node.open.preview, opts("Open Preview"))
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
  vim.keymap.set("n", "r", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "a", api.fs.create, opts("Create"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "m", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
  vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
  vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
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
  on_attach = on_attach,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = false },
  sort_by = "name",
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

