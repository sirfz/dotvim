return {
    -- moonfly
    {
        "bluz71/vim-moonfly-colors",
        lazy = false,
        priority = 999,
        enabled = true,
        config = function()
            vim.cmd [[colorscheme moonfly]]
            vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#e4e4e4", bg = "#444444", bold = true })
            vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = "#e3c78a", bg = "#444444", bold = true })
            vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = "#e4e4e4", bg = "#444444", bold = true })
            vim.api.nvim_set_hl(0, "BufferCurrentTarget", { fg = "red", bg = "#444444" })
            vim.api.nvim_set_hl(0, "BufferAlternate", { fg = "#444444", bg = "#888888"})
            vim.api.nvim_set_hl(0, "BufferAlternateIndex", { fg = "#444444", bg = "#888888"})
            vim.api.nvim_set_hl(0, "BufferAlternateSign" , { fg = "#444444", bg = "#888888"})
            vim.api.nvim_set_hl(0, "BufferAlternateTarget", { fg = "red", bg = "#888888"})
            vim.api.nvim_set_hl(0, "BufferAlternateMod", { fg = "pink", bg = "#888888"})
            vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = "purple", bg = "#303030"})
        end
    },
    -- oxocarbon
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 999,
        enabled = false,
        config = function()
            vim.cmd [[colorscheme oxocarbon]]
        end
    },
    -- themer jellybeans
    {
        "ThemerCorp/themer.lua",
        lazy = false,
        priority = 999,
        enabled = false,
        opts = {
            colorscheme = "jellybeans",
            transparent = false,
            term_colors = true,
            dim_inactive = false,
            styles = {
                comment = { style = "italic" },
            },
            enable_installer = false, -- enable installer module
        }
    },
    -- base16 jellybeans
    {
        "RRethy/nvim-base16",
        lazy = false,
        priority = 999,
        enabled = false,
        config = function()
            require("base16-colorscheme").setup({
                base00 = "#1c1c1c",
                base01 = "#d7afff",
                base02 = "#72a25a",
                base03 = "#d8ad4c",
                base04 = "#597bc5",
                base05 = "#8787af",
                base06 = "#4a8382",
                base07 = "#99ad6a",
                base08 = "#e8e8de",
                base09 = "#ffb964",
                base0A = "#adadad",
                base0B = "#fad07a",
                base0C = "#8197bf",
                base0D = "#d75f5f",
                base0E = "#8fbfdc",
                base0F = "#e8e8de",
            })
        end
    },
    -- nightfox (carbonfox)
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 999,
        enabled = false,
        config = function()
            require("nightfox").setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    transparent = false,    -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = true,   -- Non focused panes set to alternative background
                    module_default = true,  -- Default enable value for modules
                    styles = {              -- Style to be applied to different syntax groups
                        comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = {             -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    modules = {             -- List of various plugins and additional options
                        barbar = true,
                    },
                },
                palettes = {
                    carbonfox = {
                        bg1 = "#111111", -- 5% darker
                    }
                },
                specs = {},
                groups = {
                    carbonfox = {
                        BufferCurrent        = { bg = "bg3", fg = "fg1", style = "bold" },  -- fg3, fg1
                        BufferCurrentIndex   = { bg = "bg3", fg = "diag.info" },
                        BufferCurrentMod     = { bg = "bg3", fg = "diag.info", style = "bold" },
                        BufferCurrentSign    = { bg = "bg3", fg = "diag.info" },
                        BufferCurrentTarget  = { bg = "bg3", fg = "palette.green" },
                        -- BufferVisible        = { bg = "bg2", fg = "palette.comment", style = "italic" },
                        -- BufferVisibleIndex   = { bg = "bg2", fg = "palette.magenta" },
                        -- BufferVisibleMod     = { bg = "bg2", fg = "palette.magenta", style = "italic" },
                        -- BufferVisibleSign    = { bg = "bg2", fg = "palette.magenta" },
                        -- BufferVisibleTarget  = { bg = "bg2", fg = "diag.error" },
                        -- BufferInactive       = { bg = spec.bg0, fg = syn.comment },
                        -- BufferInactiveIndex  = { bg = spec.bg0, fg = syn.comment },
                        -- BufferInactiveMod    = { bg = spec.bg0, fg = spec.diag_bg.warn },
                        -- BufferInactiveSign   = { bg = spec.bg0, fg = spec.bg3 },
                        -- BufferInactiveTarget = { bg = spec.bg0, fg = spec.diag.error },
                        -- BufferTabpages       = { bg = spec.bg0 },
                        -- BufferTabpage        = { bg = spec.bg0, fg = spec.bg3 },
                        BufferAlternate     = { bg = "#666666", fg = "palette.pink" },
                        BufferAlternateIndex     = { bg = "#666666", fg = "palette.pink" },
                        BufferAlternateMod     = { bg = "#666666", fg = "palette.green" },
                        BufferAlternateSign     = { bg = "#666666", fg = "palette.pink" },
                    },
                },
            })

            -- set colorscheme carbonfox
            vim.cmd [[colorscheme carbonfox]]
        end
    },
}
