return {
	"vimwiki/vimwiki",
	lazy = false,
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Library/Mobile Documents/com~apple~CloudDocs/vimwiki",
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_key_mappings = {
			table_mappings = 0, -- disable table mappings
		}
	end,
}
