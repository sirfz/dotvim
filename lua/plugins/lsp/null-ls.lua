local M = {}

function M.setup()
    local null_ls = require("null-ls")

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
        debug = false,
        sources = {
            formatting.prettier.with {
                filetypes = { "json", "toml" },
                extra_filetypes = { "toml" },
                extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            },
            formatting.black.with { extra_args = { "--fast", "--line-length=120" } },
            formatting.stylua,
            formatting.google_java_format,
            formatting.taplo,
            -- diagnostics.flake8,
            diagnostics.ruff.with { extra_args = { "--line-length=120", "--ignore=E741" } },
            diagnostics.pylint.with { extra_args = { "-j 8", "--load-plugins=perflint" } },
        },
        diagnostics_format = "[#{c}] #{m}",
    }
end

return M
