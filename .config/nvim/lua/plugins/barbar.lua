return {
	"romgrk/barbar.nvim",
	event = "UIEnter",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0",
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				separator = { left = "▎", right = "" },
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				preset = "default", -- default, powerline, slanted.
			},
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
				NvimTree = true,
				undotree = {
					text = "undotree",
					align = "center", --(either 'left', 'center', or 'right')
				},
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = {
					event = "BufWipeout",
					text = "File Explorer",
					aling = "right",
				},
				Outline = {
					event = "BufWinLeave",
					text = "symbols-outline",
					align = "right",
				},
			},
		})
	end,
}
