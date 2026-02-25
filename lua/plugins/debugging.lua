return {
  { "rcarriga/nvim-dap-ui" },

  {
    "nvim-java/nvim-java",
    -- lazy = false,   -- often helpful to make sure it loads early
    config = function()
      require("java").setup()
      -- If you use lspconfig elsewhere, you can remove the line below
      vim.lsp.enable("jdtls")   -- ← probably not needed with nvim-java
    end,
  },

  { "nvim-neotest/nvim-nio" },

  {
    "mfussenegger/nvim-dap",
    dependencies = {   -- prefer 'dependencies' over the misspelled 'dependancies'
      "rcarriga/nvim-dap-ui",
      "nvim-java/nvim-java",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      -- Let nvim-java register the java adapter + configurations
      -- (this is the most important missing piece)
      require("java").setup()   -- safe to call again, but you can remove the duplicate

      -- These auto-open/close UI – good
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Your mappings are fine
      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>dc", dap.continue, {})
      vim.keymap.set("n", "<Leader>de", dap.step_over, {})
    end,
  },
}
