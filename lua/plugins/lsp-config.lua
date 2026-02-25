return {

	-- 1. Mason + mason-lspconfig (installs servers automatically)
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "vtsls", "html" }, -- removed tsserver/ts_ls since you're switching
		},
		dependencies = { "williamboman/mason.nvim" },
	},

	-- 2. nvim-lspconfig (still needed — provides default configs that vim.lsp.config merges automatically)
	{ "neovim/nvim-lspconfig" },

	-- 3. nvim-vtsls (extra commands + better integration for vtsls)
	{
		"yioneko/nvim-vtsls",
		lazy = false,
		dependencies = { "neovim/nvim-lspconfig" },
		-- No .setup() needed here — we use the native API below
	},

	-- 4. Your main LSP setup (in a separate file or here)
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Example: Extend lua_ls (nvim-lspconfig provides the base config automatically)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				-- settings = { Lua = { ... } },  -- add your lua settings here if needed
			})
			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"jsx",
					"tsx", -- if you do React/etc.
					"haml",
					"pug",
					"less",
					"sass",
					"scss",
					"stylus",
				},
				-- Very common settings people use
				init_options = {
					html = {
						options = {
							-- For React/JSX: prefer self-closing tags
							["jsx.enabled"] = true, -- or false
							["jsx.selfClosing"] = true,
						},
					},
				},
			})

			vim.lsp.enable("emmet_ls")
			vim.lsp.config("html", {
				-- This merges with nvim-lspconfig's default (cmd, filetypes, root_dir, etc.)
				settings = {
					html = {
						format = {
							templating = true,
							wrapAttributes = "auto", -- or "force" / "force-aligned" / "aligned-multiple"
						},
						hover = {
							documentation = true,
							references = true,
						},
					},
				},
			})

			-- vtsls setup using native API + nvim-vtsls defaults
			-- nvim-vtsls registers its config via lspconfig.configs.vtsls
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					-- "vue",  -- uncomment if needed
				},
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						inlayHints = {
							parameterNames = { enabled = "all" },
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							-- etc.
						},
					},
					javascript = {
						-- mirror the typescript inlayHints if you want them in plain JS too
					},
				},
			})

			-- Enable the servers you want (they auto-attach on matching filetypes)
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("vtsls")
			-- vim.lsp.enable("rust_analyzer")  -- etc.

			-- Global keymaps (better to put these in LspAttach autocmd for buffer-local only)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- add more: gr, gi, <leader>rn, etc.
				end,
			})
		end,
	},
}
