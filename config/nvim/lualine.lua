-- local gps = require("nvim-gps")
local navic = require("nvim-navic")
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				function()
					return navic.get_location()
				end,
				cond = function()
					return navic.is_available()
				end,
			},
		},
		lualine_c = { "filename" },
		-- lualine_c = {
		-- { gps.get_location, cond = gps.is_available },
		--},
		-- lualine_c = {
		--   {
		--     function()
		--       return navic.get_location()
		--     end,
		--     cond = function()
		--       print(navic.get_location())
		--       return navic.is_available()
		--     end,
		--   },
		-- },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
