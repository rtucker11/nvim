local function open_nvim_tree_at_startup()
	-- Check if the current buffer is a "No Name" buffer and it's the only buffer open
	local is_no_name = vim.fn.bufname() == "" and vim.bo.buftype == ""
	local buffer_count = vim.fn.bufnr("$")

	-- Only open nvim-tree if it's an empty, unnamed buffer (no filename argument was provided at launch)
	if is_no_name and buffer_count == 1 then
		require("nvim-tree.api").tree.toggle({ focus = false })
	end
end

-- Use the "VimEnter" autocmd event to trigger the function after Neovim starts up
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- callback = open_nvim_tree_at_startup,
-- })

vim.opt.mouse = ""
require("rtucker.core")
require("rtucker.lazy")
require("rtucker.lsp")
vim.api.nvim_set_keymap("i", "<C-Enter>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })
vim.g.vimwiki_table_mappings = 0

