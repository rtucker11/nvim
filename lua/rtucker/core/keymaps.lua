vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true, desc = "Source Neovim config" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<Esc>E]", "<cmd>Telescope find_files<cr>", { desc = "Launch Telescope find_files" })
keymap.set("n", "<C-h>", ":tabprevious<CR>", { desc = "Previous Tab" })
keymap.set("n", "<C-l>", ":tabnext<CR>", { desc = "Previous Tab" })
keymap.set("n", "<leader>ws", ":VimwikiSearch /", { desc = "Search Wiki" })
keymap.set("n", "<leader>ww", ":VimwikiIndex", { desc = "Launch Index" })
-- keymap.set("n", "<C-l>", "<cmd>tabn<CR>", { desc = "Previous Tab" })
-- keymap.set("n", "<C-l>", "<cmd>tabn<CR>", { desc = "Next Tab" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment

keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<C-g>", ":LazyGit<CR>", { desc = "Open LazyGit" }) --  move current buffer to new tab
keymap.set("n", "<C-`>", ":FloatermToggle<CR>", { desc = "Toggle terminal" })
--keymap.set("t", "<C-t>", "<C-h>:FloatermToggle<CR>", { desc = "Toggle terminal" })
--keymap.set("t", "<C-t>", "<C-h><CR>")
vim.keymap.set("t", "<C-`>", [[<C-\><C-n>:FloatermToggle<CR>]], { noremap = true, silent = true })

vim.diagnostic.config({
	underline = false,
	virtual_text = {
		spacing = 2,
		prefix = "●",
	},
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			-- Alas nerdfont icons don't render properly on Medium!
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
vim.api.nvim_set_keymap("n", "<C-1>", ":1ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-2>", ":2ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-3>", ":3ToggleTerm<CR>", { noremap = true, silent = true })
-- And so on for other numbers...
