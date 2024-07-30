return {
	"kylechui/nvim-surround",
	version = "*",
	event = "BufReadPost",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				normal = "<leader>sa",
				normal_cur = false,
				normal_line = false,
				normal_cur_line = false,
				visual = "<leader>s",
				visual_line = "<leader>S",
				delete = "<leader>sd",
				change = "<leader>sr",
			},
			aliases = {
				["i"] = "]", -- Index
				["r"] = ")", -- Round
				["b"] = "}", -- Brackets
			},
			move_cursor = false,
		})

		-- keymap
		--         Old text                    Command         New text
		-- --------------------------------------------------------------------------------
		--     surr*ound_words             ysiw)           (surround_words)
		--     *make strings               ys$"            "make strings"
		--     [delete ar*ound me!]        ds]             delete around me!
		--     remove <b>HTML t*ags</b>    dst             remove HTML tags
		--     'change quot*es'            cs'"            "change quotes"
		--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
		--     delete(functi*on calls)     dsf             function calls
	end,
}
