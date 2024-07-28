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
		terminal = "t",
	},
	runtime_path = runtime_path,
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

wk.add({
	{ "<leader>", group = "leader" },
	{ "<leader>a", "<cmd>Lspsaga code_action<CR>", desc = "Show Code Actions" },
	{ "<leader>b", group = "buffers" },
	{ "<leader>bc", "<cmd>Telescope colorscheme<CR>", desc = "Lists Available colorschemes" },
	{ "<leader>bm", "<cmd>Telescope man_pages<CR>", desc = "Lists Manpage entries" },
	{ "<leader>f", group = "file" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffer list" },
	{ "<leader>ff", "<cmd>Telescope find_files hidden=true prompt_prefix=🔍<CR>", desc = "Telescope file finder" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search for a string in a current directory" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "List Available Help Tags" },
	{ "<leader>fs", "<cmd>Telescope grep_string<CR>", desc = "Search the string under the cursor" },
	{ "<leader>j", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Show next LSP Message" },
	{ "<leader>k", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Show previous LSP Message" },
	{ "<leader>q", "<cmd>CheatSH<CR>", desc = "Open CheatSheet for Language and Keyword under Cursor" },
	{ "<leader>w", "<cmd>WhichKey<CR>", desc = "Open WhichKey help Menu" },
	{ "<leader>x", "<cmd>NvimTreeToggle<CR>", desc = "Open/Close NvimTree" },
	{ "qa", "<cmd>quitall<CR>", desc = "Close All Windows and Tabs" },
	{ "qq", "<cmd>Lspsaga hover_doc<CR>", desc = "LSP Hover doc" },
	{ "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Goto Declaration" },
	{ "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Goto Definition" },
	{ "<leader>l", group = "Code" },
	{ "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
	{ "<leader>li", "<cmd>LspInfo<CR>", desc = "LSP Indo" },
	{ "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
})
