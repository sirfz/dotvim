return {
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "kyazdani42/nvim-web-devicons",

    -- cmp plugins
    -- use { "hrsh7th/nvim-cmp" } -- The completion plugin
    -- use { "hrsh7th/cmp-buffer" } -- buffer completions
    -- use { "hrsh7th/cmp-path" } -- path completions
    -- use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    -- use { "hrsh7th/cmp-nvim-lsp" }
    -- use { "hrsh7th/cmp-nvim-lua" }

    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    -- use { "neovim/nvim-lspconfig" } -- enable LSP
    -- use { "williamboman/mason.nvim"}
    -- use { "williamboman/mason-lspconfig.nvim" }
    -- use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    -- use { "RRethy/vim-illuminate" }

    -- Telescope
 --    use {
 --        "nvim-telescope/telescope.nvim",
 --        requires = {
 --            { "nvim-telescope/telescope-live-grep-args.nvim" },
 --        },
 --    }
 --    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	-- use { "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } }

    -- Treesitter
    -- use {
    --     "nvim-treesitter/nvim-treesitter",
    --     run = function()
    --         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    --         ts_update()
    --     end,
    -- }
    -- use { "nvim-treesitter/nvim-treesitter-context" }

    -- Git
    "tpope/vim-fugitive",
    -- use { "lewis6991/gitsigns.nvim" }

    -- DAP
    -- use { "mfussenegger/nvim-dap" }
    -- use { "rcarriga/nvim-dap-ui" }
    -- use { "ravenxrz/DAPInstall.nvim" }

    -- Misc
    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    -- use { "folke/trouble.nvim" }
    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    },
    -- use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
    -- use { "tmhedberg/SimpylFold" }
    -- use { "Konfekt/FastFold" }
    "folke/which-key.nvim",
    "cbochs/portal.nvim",
}
