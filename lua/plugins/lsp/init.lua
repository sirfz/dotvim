local M = {
    {
        "mrcjkb/rustaceanvim",
        version = "^9",
        ft = { "rust" },
        lazy = false,
        keys = {
            { "<leader>lh", "<Plug>RustHoverAction", desc = "Run Rust hover action" },
        },
        init = function()
            vim.g.rustaceanvim = {
                server = require("plugins.lsp.settings.rust_analyzer"),
                tools = {
                    code_actions = {
                        ui_select_fallback = true,
                    },
                    float_win_config = {
                        border = "rounded",
                        max_width = 100,
                        max_height = 30,
                    },
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        -- event = "BufReadPre",
        lazy = false,
        dependencies = {
            "saghen/blink.cmp",
        },
        keys = {
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
            {
                "K",
                function()
                    if vim.bo.filetype == "rust" then
                        vim.cmd.RustLsp({ "hover", "actions" })
                    else
                        vim.lsp.buf.hover({ border = "rounded" })
                    end
                end,
                desc = "hover",
            },
            { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "goto implementation" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "show references" },
            { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "show diagnostics float" },
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "format buffer" },
            { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
            { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "LSP install info" },
            {
                "<leader>la",
                function()
                    local fzf = require("fzf-lua")
                    if vim.bo.filetype == "rust" then
                        vim.cmd.RustLsp("codeAction")
                    else
                        fzf.lsp_code_actions({ no_resume = true })
                    end
                end,
                desc = "code action",
            },
            { "];", "<cmd>lua vim.diagnostic.jump({count=1})<cr>", desc = "next diagnostic" },
            { "[;", "<cmd>lua vim.diagnostic.jump({count=-1})<cr>", desc = "previous diagnostic" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename symbol" },
            { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help({border = \"rounded\"})<CR>", desc = "signature help" },
            { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "diagnostics to loclist" },
        }
    },
}

function disable_lsp_in_fugitive(client, bufnr)
    if vim.startswith(vim.api.nvim_buf_get_name(bufnr), 'fugitive://') then
        vim.lsp.buf_detach_client(bufnr, client.id)
        return true
    end
    return false
end

M[2].config = function()  -- M[2] is nvim-lspconfig
    local servers = {
        -- "basedpyright",
        "ruff",
        -- "zuban",
        "pyrefly",
        -- "ty",
        "copilot",
    }

    for _, server in pairs(servers) do
        server = vim.split(server, "@")[1]
        local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
        if require_ok then
            if conf_opts.on_attach then
                local on_attach = conf_opts.on_attach
                conf_opts.on_attach = function(client, bufnr)
                    if disable_lsp_in_fugitive(client, bufnr) then
                        return
                    end
                    on_attach(client, bufnr)
                end
            else
                conf_opts.on_attach = disable_lsp_in_fugitive
            end
            vim.lsp.config(server, conf_opts)
        else
            vim.lsp.config(server, {on_attach = disable_lsp_in_fugitive})
        end
        vim.lsp.enable(server)
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
end

return M
