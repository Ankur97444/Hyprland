return {
	-- autopairs
	"windwp/nvim-autopairs",
	event = "BufReadPost",
	config = function()
		local config = require("nvim-autopairs")
		config.setup({
			disable_filetype = { "TelescopePrompt", "rust", "spectre_panel", "vim" },
			enable_check_bracket_line = false,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		})

		-- nvim-cmp
		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Use tree-sitter to check for pairs
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		})

		local ts_conds = require("nvim-autopairs.ts-conds")

		-- press % => %% only while inside a comment or string
		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})

		-- put this to setup function and press <a-e> to use fast_wrap
		npairs.setup({
			fast_wrap = {},
		})

		-- change default fast_wrap
		npairs.setup({
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})
	end,
}