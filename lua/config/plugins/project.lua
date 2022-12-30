local M = {
	"ahmedkhalf/project.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
}

function M.config()
	require("project").setup({
		-- manual_mode = true,
		-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
		detection_methods = { "pattern" },
		-- patterns used to detect root dir, when **"pattern"** is in detection_methods
		patterns = { ".git", "package.json" },
	})

	require("telescope").load_extension('projects')
end

return M
