local M = {}
M.ui = {
  statusline = {
    modules = {
	  live_server = require("live-server.statusline.nvchad").render
    },
    order = { "mode", "file", "git", "%=", "lsp_msg", "live_server", "diagnostics", "lsp", "cwd" } -- "live_server" is our live server module here
  }
}
return M
