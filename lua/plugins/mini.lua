return {
    { 'nvim-mini/mini.ai', version = false, config = true },
    { 'nvim-mini/mini.comment', version = false, config = true },
    { 'nvim-mini/mini.pairs', version = false, event = "InsertEnter", config = true },
    { 'nvim-mini/mini.surround', version = false, event = "VeryLazy", config = true },
    { 'nvim-mini/mini.basics', version = false, event = "VeryLazy", config = true },
    {
        'nvim-mini/mini.bracketed',
        version = false,
        event = "VeryLazy",
        opts = {
            buffer = { suffix = '' },  -- disable for buffers (use barbar keymaps)
        }
    },
    {
        'nvim-mini/mini.icons',
        version = false,
        lazy = true,
        opts = function()
            require("mini.icons").mock_nvim_web_devicons()
            return {
                lsp = {
                    copilot = { glyph = '', hl = 'MiniIconsOrange'  },
                }
            }
        end,
    },
    {
        'nvim-mini/mini.files',
        version = false,
        lazy = false,
        config = true,
        keys = {
            {
                "<leader>e",
                function()
                    MiniFiles.open()
                end,
                desc = "Explorer NeoTree (Root Dir)",
            }
        },
        dependencies = { 'nvim-mini/mini.icons' },
    },
    { 'nvim-mini/mini.cursorword', version = false, event = "BufReadPre", config = true },
    {
        'nvim-mini/mini.indentscope',
        version = false,
        event = "BufReadPre",
        config = function()
            require('mini.indentscope').setup {
                draw = {
                    animation = require('mini.indentscope').gen_animation.none(),
                }
            }
        end
    },
}
