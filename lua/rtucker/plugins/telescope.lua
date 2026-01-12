return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		-- funcstart
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		local function smart_select(prompt_bufnr)
			local selection = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			if not selection then
				return
			end

			local current_buf = vim.api.nvim_get_current_buf()
			local buf_name = vim.api.nvim_buf_get_name(current_buf)
			-- If current buffer is unnamed, overwrite it
			if buf_name == "" then
				vim.cmd("edit " .. vim.fn.fnameescape(selection.value))
			else
				vim.cmd("tabedit " .. vim.fn.fnameescape(selection.value))
			end
		end

		-- funcend
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			defaults = {
				preview = {
					treesitter = false,
				},
				path_display = { "smart" },
				mappings = {
					n = {
						["<CR>"] = smart_select,
					},
					i = {
						["<CR>"] = smart_select,
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						--						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find todos" })
	end,
}
