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
				vim.lsp.enable("lua_ls")
				vim.lsp.enable("tsserver")
				-- vim.lsp.config({
				--
				--     lspconfig.lua_ls.setup({})
				--     lspconfig.tsserver.setup({})
				-- })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			end,
		},
	},
}
