local M = {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
    lazy = false,
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
        "saghen/blink.cmp",
        -- "nvimtools/none-ls.nvim",
        "RRethy/vim-illuminate",
    },
    keys = {
        { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration" },
        { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
        { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover" },
        { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "goto implementation" },
        { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "show references" },
        { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "show diagnostics float" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "format buffer" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
        { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "LSP install info" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "code action" },
        { "];", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "next diagnostic" },
        { "[;", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "previous diagnostic" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename symbol" },
        { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "signature help" },
        { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "diagnostics to loclist" },
    }
}

function M.config()
    local servers = {
        "basedpyright",
        "ruff",
        -- "zuban",
        "pyrefly",
        -- "ty",
    }

    for _, server in pairs(servers) do
        server = vim.split(server, "@")[1]
        vim.lsp.enable(server)
        local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
        if require_ok then
            vim.lsp.config(server, conf_opts)
        end
    end

    local config = {
		virtual_text = false, -- disable virtual text
		signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "󰌵",
                [vim.diagnostic.severity.INFO] = "",
            },
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M
