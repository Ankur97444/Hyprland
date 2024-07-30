return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy=true },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	event = "UIEnter",
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					hidden = true,
				},
				["ui-select"] = {
					require("telescope.themes").get_cursor({}),
				},
			},
			defaults = {
				preview = {
					timeout = 500,
					msg_bg_filechar = "",
				},
				multi_icon = " ",
				vimgrep_arguments = {
					"rg",
          "-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				prompt_prefix = "❯ ",
				selection_caret = "❯ ",
				color_devicons = true,
				dynamic_preview_title = true,
				-- winblend = 4,
				layout_config = {
					--prompt_position = "bottom",
					horizontal = {
						width_padding = 0.04,
						height_padding = 0.1,
						preview_width = 0.6,
					},
					vertical = {
						width_padding = 0.05,
						height_padding = 1,
						preview_height = 0.5,
					},
				},
				mappings = {
					n = {
						["<Del>"] = actions.close,
					},
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		-- file_browser
		--telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		-- keymaps
		local builtin = require("telescope.builtin")
		--local key_map = vim.keymap.set
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
