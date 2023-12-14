local consts = {
    modes = {
      all = "",
      normal = "n",
      visual_select = "v",
      select = "s",
      visual = "x",
      operator_pending = "o",
      insert_command = "!",
      insert = "i",
      insert_command_lang_arg = "l",
      command_line = "c",
      terminal = "t"
    },
    runtime_path = runtime_path
  }
local mode = consts.modes
local wk = require("which-key")
local function map(mode, mapping, cmd, options)
  local opts = { noremap = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end

  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

-- set Space Key as map leader
vim.g.mapleader = " "

-- delete does not replace system vim & clipboard
map(mode.normal, "x", '"_x')
-- increment and decrement
map(mode.normal, "+", "<C-a>")
map(mode.normal, "-", "<C-x>")

-- Add keyMap to delete whole words backwards
map(mode.normal, "dq", 'vb"_d')

-- Exit insert mode &&
map(mode.insert, "kj", "<esc>")
-- search results navigation
map(mode.normal, "n", "nzz")
map(mode.normal, "N", "Nzz")

-- Remove Search highlights when entering insert mode
map(mode.normal, "i", ":nohlsearch<CR>:TSEnable highlight<CR>i")

--CLose all windows and tabs
-- map(mode.normal, "qa", ":quitall<CR>")

--tabs Navigation
map(mode.normal, "te", ":tabedit<CR>:Telescope find_files hidden=true<CR>")
map(mode.normal, "<Tab>", ":tabnext<CR>")
map(mode.normal, "<S-Tab>", ":tabprevious<CR>")

-- Split Windows
map(mode.normal, "ss", ":split<Return><C-w>w")
map(mode.normal, "sv", ":vsplit<Return><C-w>w")

--Move Window
map("", "sh", "<C-w>h")
map("", "sk", "<C-w>k")
map("", "sj", "<C-w>j")
map("", "sl", "<C-w>l")

-- Resize window
map(mode.normal, "<C-w><left>", "<C-w><")
map(mode.normal, "<C-w><right>", "<C-w>>")
map(mode.normal, "<C-w><up>", "<C-w>+")
map(mode.normal, "<C-w><down>", "<C-w>-")

--Indent Multiple Lines
map(mode.visual, "<", "<gv")
map(mode.visual, ">", ">gv")

-- Packer function Sync call (clean and install)
map(mode.normal, "<C-u>", ":PackerSync<CR>")

-- Adding key Maps to the WhichKey help menu

wk.register({
  ["<leader>"] = {
    name = "+leader",
    x = { "<cmd>NvimTreeToggle<CR>", "Open/Close NvimTree" },
    w = { "<cmd>WhichKey<CR>", "Open WhichKey help Menu" },
    q = { "<cmd>CheatSH<CR>", "Open CheatSheet for Language and Keyword under Cursor" },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files hidden=true prompt_prefix=🔍<CR>", "Telescope file finder" },
      b = { "<cmd>Telescope buffers<CR>", "Telescope buffer list" },
      g = { "<cmd>Telescope live_grep<CR>", "Search for a string in a current directory" },
      s = { "<cmd>Telescope grep_string<CR>", "Search the string under the cursor" },
      h = { "<cmd>Telescope help_tags<CR>", "List Available Help Tags" },
    },
    b = {
      name = "+buffers",
      m = { "<cmd>Telescope man_pages<CR>", "Lists Manpage entries" },
      c = { "<cmd>Telescope colorscheme<CR>", "Lists Available colorschemes" },
    },
    a = { "<cmd>Lspsaga code_action<CR>", "Show Code Actions" },
    j = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Show next LSP Message" },
    k = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Show previous LSP Message" },
  },
})

wk.register({
  q = {
    a = { "<cmd>quitall<CR>", "Close All Windows and Tabs" },
    q = { "<cmd>Lspsaga hover_doc<CR>", "LSP Hover doc" },
  },
})

-- LSP Mappings
wk.register({
  ["<leader>"] = {
    l = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      q = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "LSP Indo" },
    },
    g = {
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    },
  },
})
