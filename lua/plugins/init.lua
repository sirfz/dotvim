return {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "kyazdani42/nvim-web-devicons",

    -- snippets
    {
        "L3MON4D3/LuaSnip", -- snippet engine
        dependencies = {
            "rafamadriz/friendly-snippets", -- a bunch of snippets to use
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        config = true
    },

    -- Git
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

    -- Misc
    {
        "tpope/vim-unimpaired",
        event = "VeryLazy",
    },
    {
        "tpope/vim-repeat",
        lazy = false
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = {
            auto_open = false,
            use_diagnostic_signs = true, -- en
        },
    },
    {
        "kylechui/nvim-surround",
        lazy = false,
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        "cbochs/portal.nvim",
        event = "BufEnter",
        config = true
    }
}
