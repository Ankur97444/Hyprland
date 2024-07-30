return {
	"MeanderingProgrammer/markdown.nvim",
	main = "render-markdown",
	opts = {},
	name = "render-markdown",
	ft = { "markdown", "markdown_inline" },
	config = function()
		local markdown = require("render-markdown")
		markdown.setup({
			file_types = { "markdown", "vimwiki" },
      code = { left_pad = 1, border = "thick" },
      bullet = { icons = { '●', '○', '◆', '◇' }, },
      quote = { icon = '▋', },

		})

		-- Keys
		local map = vim.keymap.set
    --map("n", "<leader>mm", require("render-markdown").toggle(), {})
	end,
}
