-- local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("docker_language_server")
vim.lsp.enable("helm_ls")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("nil_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("sqls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("terraformls")
vim.lsp.enable("yamlls")

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())
-- vim.lsp.config.lua_ls.setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 			},
-- 			-- Do not send telemetry data containing a randomized but unique identifier
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })
--
-- -- Nix Config
-- vim.lsp.config.nil_ls.setup({})
-- vim.lsp.config.bashls.setup({})
-- vim.lsp.config.cmake.setup({})
-- vim.lsp.config.clangd.setup({})
-- vim.lsp.config.cssls.setup({})
-- vim.lsp.config.html.setup({})
-- vim.lsp.config.jsonls.setup({})
-- vim.lsp.config.ts_ls.setup({})
-- vim.lsp.config.marksman.setup({})
-- vim.lsp.config.pyright.setup({})
-- vim.lsp.config.taplo.setup({})
-- vim.lsp.config.yamlls.setup({})
-- -- Docker Server
-- vim.lsp.config.dockerls.setup({})
--
-- --- Terraform server
-- vim.lsp.config.terraformls.setup({})
--
-- Rust Config
-- require("rust-tools").setup({})
-- require("rust-tools").runnables.runnables()
--require("rust-tools").inlay_hints.enable()
-- require("rust-tools").hover_range.hover_range()
-- vim.lsp.config.rust_analyzer.setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			assist = {
-- 				importMergeBehavior = "last",
-- 				importPrefix = "by_self",
-- 			},
-- 			diagnostics = {
-- 				disabled = { "unresolved-import" },
-- 			},
-- 			cargo = {
-- 				loadOutDirsFromCheck = true,
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 			checkOnSave = {
-- 				command = "clippy",
-- 			},
-- 		},
-- 	},
-- })
