require("config.lazy")
require("remaps")
require("options")
--require("java.lua")
require('live-server-nvim').setup ({
    custom = {
        "--port=5550",
        "--no-css-inject",
    },
 serverPath = vim.fn.stdpath("data") .. "/live-server/", --default
 open = "folder", -- folder|cwd     --default
})
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
