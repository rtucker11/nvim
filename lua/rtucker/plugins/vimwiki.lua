return {
	"vimwiki/vimwiki",
	lazy = false,
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/docs/vimwiki",
				syntax = "default",
				ext = ".wiki",
			},
		}
	end,
}
