return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local keymap = vim.keymap.set
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { width = 180 },
			},
		})

		keymap("n", "<leader>fp", builtin.git_files, { desc = "Telescope [F]ind in Git [P]roject" })
		keymap("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end, { desc = "Telescope find files" })

		keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		keymap("n", "<leader>pws", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		keymap("n", "<leader>ps", function()
			builtin.grep_string({
				search = vim.fn.input("Grep > "),
				additional_args = {
					"-Hn",
				},
			})
		end)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				keymap("n", "gr", function()
					require("telescope.builtin").lsp_references({ show_line = false })
				end, {})
			end,
		})
	end,
}
