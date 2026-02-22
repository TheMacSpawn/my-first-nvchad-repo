local lspconfig_defaults = require("nvchad.configs.lspconfig")  -- Pull NVChad's defaults
local on_attach = lspconfig_defaults.on_attach
local capabilities = lspconfig_defaults.capabilities

require("java").setup({})  -- Basic nvim-java setup; customize options here if needed (see repo docs)

require("lspconfig").jdtls.setup({
  on_attach = function(client, bufnr)
    require("java").dap.on_attach(client, bufnr)  -- Integrates nvim-java's DAP handling with nvim-dap
    on_attach(client, bufnr)  -- Applies NVChad's default on_attach (keymaps, etc.)
  end,
  capabilities = capabilities,
  filetypes = { "java" },
  -- Optional: Add custom JDTLS settings, e.g., for JDK runtimes if your project uses a specific version
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",  -- Example; adjust to your JDK version/name
            path = "/path/to/your/jdk-17",  -- e.g., /usr/lib/jvm/java-17-openjdk
            default = true,
          },
        },
      },
    },
  },
})
