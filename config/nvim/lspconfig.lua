local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Nix Config
lspconfig.nil_ls.setup({})

lspconfig.bashls.setup({})
lspconfig.cmake.setup({})
lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.marksman.setup({})
lspconfig.pyright.setup({})
lspconfig.taplo.setup({})
lspconfig.yamlls.setup({})
-- Docker Server
lspconfig.dockerls.setup({})

--- Terraform server
lspconfig.terraformls.setup({})

-- Rust Config
require("rust-tools").setup({})
require("rust-tools").runnables.runnables()
require("rust-tools").inlay_hints.enable()
require("rust-tools").hover_range.hover_range()
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			diagnostics = {
				disabled = { "unresolved-import" },
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})
