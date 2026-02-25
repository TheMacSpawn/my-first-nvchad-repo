return {
	"ngtuonghy/live-server-nvim",
	event = "VeryLazy",
	build = ":LiveServerInstall",
	config = function()
		require("live-server-nvim").setup({
            port = 5550,
            host = "127.0.0.1",
        })
	end,
}
