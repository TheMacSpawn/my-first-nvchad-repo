return {
  -- ... other custom plugins ...

  {
    "nvim-java/nvim-java",
    ft = {"java"},
    lazy = false,  -- Load immediately to ensure setup
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",  -- Likely already in NVChad, but ensures it's available
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    config = function()
      require("custom.configs.java")  -- This points to your custom Java config file (created in Step 2)
    end,
  },

  -- ... other custom plugins ...
}
