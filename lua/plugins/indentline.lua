local M = {
	"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
	opts = {
		indent = {
            char = "¦",
        },
        whitespace = {
            remove_blankline_trail = true
        },
        scope = {
            enabled = true,
        },
		exclude = {
            buftypes = {
                "terminal",
                "nofile",
                "quickfix",
                "prompt",
            },
            filetypes = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "neo-tree",
                "Trouble",
                "",
            },
        },
	}
}

return M
