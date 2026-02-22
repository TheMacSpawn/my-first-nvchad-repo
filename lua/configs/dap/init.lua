local dap = require("dap")

-- ui
require("configs.dap.ui")

-- debuggers
local gdb = require("configs.dap.adapters.gdb")
local cppdbg = require("configs.dap.adapters.cppdbg")

dap.adapters.gdb = gdb.adapter
dap.adapters.cppdbg = cppdbg.adapter
-- require("java").dap.config_dap()

dap.configurations.c = gdb.config
dap.configurations.cpp = cppdbg.config
dap.configurations.rust = gdb.config
-- dap.configurations.java = {
--   {
--     type = "java",
--     name = "Attach to Process",
--     request = "attach",
--     hostName = "127.0.0.1",
--     port = 5005,
--   },
-- }


