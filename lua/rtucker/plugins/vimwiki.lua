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
		vim.g.vimwiki_key_mappings = {
			table_mappings = 0, -- disable table mappings
		}
	end,
}
