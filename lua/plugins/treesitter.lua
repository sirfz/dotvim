local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    event = "BufReadPost",
    build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        },
        {
            "yioneko/nvim-yati",
            -- dependencies = {
            --     "yioneko/vim-tmindent",
            -- }
        },
        -- "RRethy/vim-illuminate",
    }
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
        -- ensure_installed = "all", -- one of "all" or a list of languages
        ignore_install = { "" }, -- List of parsers to ignore installing
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "css" }, -- list of language that will be disabled
        },
        autopairs = {
            enable = true,
        },
        indent = { enable = false },  -- disable = { "python", "css" } },
        yati = {
            enable = true,
            -- Disable by languages, see `Supported languages`
            -- disable = { "python" },

            -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
            default_lazy = true,

            -- Determine the fallback method used when we cannot calculate indent by tree-sitter
            --   "auto": fallback to vim auto indent
            --   "asis": use current indent as-is
            --   "cindent": see `:h cindent()`
            -- Or a custom function return the final indent result.
            default_fallback = "auto",
            -- default_fallback = function(lnum, computed, bufnr)
            --     if vim.tbl_contains(tm_fts, vim.bo[bufnr].filetype) then
            --         return require('tmindent').get_indent(lnum, bufnr) + computed
            --     end
            --     -- or any other fallback methods
            --     return require('nvim-yati.fallback').vim_auto(lnum, computed, bufnr)
            -- end,
        },
    })
end

return M
