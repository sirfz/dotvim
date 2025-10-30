return {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "nvim-tree/nvim-web-devicons",

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
        opts = {
            auto_open = false,
            use_diagnostic_signs = true, -- en
        },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "cbochs/portal.nvim",
        event = "BufEnter",
        config = true
    },
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
        opts = {},
    },
    {
        'hat0uma/csvview.nvim',
        ft = "csv",
        config = true
    }
}
