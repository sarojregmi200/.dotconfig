return {
	"aurum77/live-server.nvim",
	config = function()
		require("plugins.live-server").install()
	end,
	cmd = {
		"LiveServer",
		"LiveServerStart",
		"LiveServerStop",
		"LiveServerInstall",
	},
	build = function()
		require("live_server.util").install()
	end,
}
