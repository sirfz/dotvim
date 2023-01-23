local M = {
	"lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
	opts = {
		char = "¦",
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
		use_treesitter = true,
		show_current_context = true,
		buftype_exclude = {
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
		},
		filetype_exclude = {
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
            "neo-tree",
            "Trouble",
			"",
		},
	}
}

return M
