local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
}
function M.config()
	require("nvim-autopairs").setup({
		check_ts = true, -- treesitter integration
		disable_filetype = { "TelescopePrompt" },
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0, -- Offset from pattern match
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "PmenuSel",
			highlight_grey = "LineNr",
		},
	})
	require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({}))
end

return M