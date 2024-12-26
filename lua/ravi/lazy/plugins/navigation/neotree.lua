return {
	"nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "disabled",
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		-- 	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			neo_tree_popup_input_ready = false, -- Enable normal mode for input dialogs.
		-- 	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
		-- 	sort_case_insensitive = false, -- used when sorting files and directories in the tree
		-- 	-- sort_function = nil, -- use a custom function for sorting files and directories in the tree
		-- 	sort_function = function (a,b)
		-- 	      if a.type == b.type then
		-- 	          return a.path > b.path
		-- 	      else
		-- 	          return a.type > b.type
		-- 	      end
		-- 	  end , -- this sorts files and directories descendantly
		-- 	default_component_configs = {
		-- 		container = {
		-- 			enable_character_fade = true,
		-- 		},
		-- 		indent = {
		-- 			indent_size = 2,
		-- 			padding = 1, -- extra padding on left hand side
		-- 			-- indent guides
		-- 			with_markers = true,
		-- 			indent_marker = "│",
		-- 			last_indent_marker = "└",
		-- 			highlight = "NeoTreeIndentMarker",
		-- 			-- expander config, needed for nesting files
		-- 			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
		-- 			expander_collapsed = "",
		-- 			expander_expanded = "",
		-- 			expander_highlight = "NeoTreeExpander",
		-- 		},
		-- 		icon = {
		-- 			folder_closed = "",
		-- 			folder_open = "",
		-- 			folder_empty = "󰜌",
		-- 			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
		-- 			-- then these will never be used.
		-- 			default = "*",
		-- 			highlight = "NeoTreeFileIcon",
		-- 		},
		-- 		modified = {
		-- 			symbol = "[+]",
		-- 			highlight = "NeoTreeModified",
		-- 		},
		-- 		name = {
		-- 			trailing_slash = false,
		-- 			use_git_status_colors = true,
		-- 			highlight = "NeoTreeFileName",
		-- 		},
		-- 		git_status = {
		-- 			symbols = {
		-- 				-- Change type
		-- 				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
		-- 				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
		-- 				deleted = "✖", -- this can only be used in the git_status source
		-- 				renamed = "󰁕", -- this can only be used in the git_status source
		-- 				-- Status type
		-- 				untracked = "",
		-- 				ignored = "",
		-- 				unstaged = "󰄱",
		-- 				staged = "",
		-- 				conflict = "",
		-- 			},
		-- 		},
		-- 		-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
		-- 		file_size = {
		-- 			enabled = true,
		-- 			required_width = 64, -- min width of window required to show this column
		-- 		},
		-- 		type = {
		-- 			enabled = true,
		-- 			required_width = 122, -- min width of window required to show this column
		-- 		},
		-- 		last_modified = {
		-- 			enabled = true,
		-- 			required_width = 88, -- min width of window required to show this column
		-- 		},
		-- 		created = {
		-- 			enabled = true,
		-- 			required_width = 110, -- min width of window required to show this column
		-- 		},
		-- 		symlink_target = {
		-- 			enabled = false,
		-- 		},
		-- 	},
		-- 	commands = {},
		-- 	window = {
		-- 		position = "left",
		-- 		width = 40,
		-- 		mapping_options = {
		-- 			noremap = true,
		-- 			nowait = true,
		-- 		},
		-- 		mappings = {
		-- 			["<space>"] = {
		-- 				"toggle_node",
		-- 				nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
		-- 			},
		-- 			["<2-LeftMouse>"] = "open",
		-- 			["<cr>"] = "open",
		-- 			["<esc>"] = "cancel", -- close preview or floating neo-tree window
		-- 			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
		-- 			-- Read `# Preview Mode` for more information
		-- 			["l"] = "focus_preview",
		-- 			["S"] = "open_split",
		-- 			["s"] = "open_vsplit",
		-- 			-- ["S"] = "split_with_window_picker",
		-- 			-- ["s"] = "vsplit_with_window_picker",
		-- 			["t"] = "open_tabnew",
		-- 			-- ["<cr>"] = "open_drop",
		-- 			-- ["t"] = "open_tab_drop",
		-- 			["w"] = "open_with_window_picker",
		-- 			--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
		-- 			["C"] = "close_node",
		-- 			-- ['C'] = 'close_all_subnodes',
		-- 			["z"] = "close_all_nodes",
		-- 			--["Z"] = "expand_all_nodes",
		-- 			["a"] = {
		-- 				"add",
		-- 				-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
		-- 				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
		-- 				config = {
		-- 					show_path = "none", -- "none", "relative", "absolute"
		-- 				},
		-- 			},
		-- 			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
		-- 			["d"] = "delete",
		-- 			["r"] = "rename",
		-- 			["y"] = "copy_to_clipboard",
		-- 			["x"] = "cut_to_clipboard",
		-- 			["p"] = "paste_from_clipboard",
		-- 			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
		-- 			-- ["c"] = {
		-- 			--  "copy",
		-- 			--  config = {
		-- 			--    show_path = "none" -- "none", "relative", "absolute"
		-- 			--  }
		-- 			--}
		-- 			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
		-- 			["q"] = "close_window",
		-- 			["R"] = "refresh",
		-- 			["?"] = "show_help",
		-- 			["<"] = "prev_source",
		-- 			[">"] = "next_source",
		-- 			["i"] = "show_file_details",
		-- 		},
		-- 	},
		})

		vim.keymap.set("n", "<leader>t", ":Neotree reveal toggle<CR>", { silent = true })
	end,
}
