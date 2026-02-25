return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				-- local lspconfig = require('vim.lsp.config')
				-- local capabilities = vim.lsp.protocol.make_client_capabilities()
				-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				local lspconfig_defaults = require("lspconfig").util.default_config
				vim.lsp.config("lua_ls", {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				})
				-- vim.lsp.config(
				-- 	"pyright",
				-- 	vim.tbl_deep_extend("force", lspconfig_defaults, {
				-- 		capabilities = vim.tbl_deep_extend(
				-- 			"force",
				-- 			lspconfig_defaults.capabilities or {},
				-- 			capabilities
				-- 		),
				-- 	})
				-- )

				vim.lsp.enable("pyright")
				vim.lsp.enable("lua_ls")
				vim.lsp.config("ts_ls", vim.lsp.config.ts_ls)
				vim.lsp.enable("ts_ls")

				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			end,
		},
	},
}
