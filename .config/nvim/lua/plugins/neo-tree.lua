return {
	-- neo-tree
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		--"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	event = "VeryLazy",
	config = function()
		local config = require("neo-tree")
		config.setup({
			enable_diagnostics = true,
			default_component_configs = {
				container = {
					enable_character_fade = false,
				},
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
				},
				icon = {
					folder_closed = "󰉋",
					folder_open = "",
					folder_empty = "",
				},
				modified = {
					symbol = "",
				},
			},
			window = {
				width = 35,
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				follow_current_file = {
					leave_dir_open = true,
				},
			},
		})
	end,
}
