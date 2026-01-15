return {
	"mskelton/live-reload.nvim",
	root_dir = "/home/rob_tucker/.config/nvim",
	setup = function()
		require("live-reload").setup({
			debounce_time = 500,
			plugins = {
				"asana",
			},
		})
	end,
}
