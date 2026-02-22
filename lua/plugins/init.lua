return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
	{
		"mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
		config = function()
			require("configs.dap")
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
      local dap = require('dap')
      vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
		end,
		lazy = false,
	},
  --{"mfussenegger/nvim-jdtls"},


{
  "hyperstown/nvim-live-server",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle"},
  lazy = false,
  opts = {
    host = "127.0.0.1", -- optional, default 0.0.0.0
    port = 5550, -- optional, default 8080
    bind_attempts = 3, -- optional, default 2
    ignore_files = { "*.env" }, -- optional, default {}
    ignore_dotfiles = true, -- optional default true
  },
},
{
  'nvim-java/nvim-java',
  -- lazy = false,
  ft = "java",
  config = function()
    require('java').setup()
    vim.lsp.enable('jdtls')
  end,
},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap", "nvim-dap-ui" },
	},

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
