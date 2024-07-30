return {
	"folke/noice.nvim",
	event = "UIEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local config = require("noice")
		config.setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			popupmenu = {
				backend = "cmp",
			},
		})
	end,
}