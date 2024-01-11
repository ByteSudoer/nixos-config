local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
require("null-ls").setup({
	sources = {
		-- For Nix
		require("null-ls").builtins.formatting.nixpkgs_fmt,
		require("null-ls").builtins.code_actions.statix,
		-- For Bash
		require("null-ls").builtins.diagnostics.shellcheck,
		require("null-ls").builtins.code_actions.shellcheck,

		-- For C/C++
		require("null-ls").builtins.diagnostics.cpplint,
		require("null-ls").builtins.formatting.clang_format,

		-- For Lua
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.luacheck,

		-- For Python
		require("null-ls").builtins.diagnostics.pylint,

		--For YAML
		require("null-ls").builtins.diagnostics.yamllint,

		-- For JSON
		require("null-ls").builtins.formatting.jq,
		require("null-ls").builtins.formatting.prettierd,

		-- For Rust
		require("null-ls").builtins.formatting.rustfmt,
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = 0,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
