return {
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- or call .setup() below
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local ls = require("luasnip")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- Navigate up/down the completion menu
					["<C-n>"] = cmp.mapping.select_next_item(), -- next candidate
					["<C-p>"] = cmp.mapping.select_prev_item(), -- previous candidate

					-- Alternative: arrow keys (very intuitive for many people)
					["<Down>"] = cmp.mapping.select_next_item(),
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping(function(fallback)
						if ls.expand_or_locally_jumpable() then
							ls.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if ls.jumpable(-1) then
							ls.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			}) -- In your completion.lua, inside cmp.setup({ ... })
			cmp.setup.filetype({ "html" }, {
				sources = cmp.config.sources({
					{ name = "emmet_ls", priority = 1000 }, -- higher = comes first

					{ name = "luasnip" },
				}, { name = "buffer" }),
			})
			cmp.setup.filetype({ "javascriptreact", "typescriptreact" }, {
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 900 },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
