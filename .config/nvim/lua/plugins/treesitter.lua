return {
	-- TreeSitter
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufRead",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "python", "lua", "vim", "regex", "comment", "bash", "markdown", "markdown_inline", "norg" },
			auto_install = true,
			indent = { enable = true },
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "go" }, -- list of language that will be disabled
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
        --additional_vim_regex_highlighting = { "python", "lua", "javascript" },
			},
		})
	end,
}
