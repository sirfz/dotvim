local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua" }
    -- use { "akinsho/bufferline.nvim" }
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
    -- use { "moll/vim-bbye" }
    use { "nvim-lualine/lualine.nvim" }
    use { "akinsho/toggleterm.nvim" }
    use { "ahmedkhalf/project.nvim" }
    use { "lewis6991/impatient.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "goolord/alpha-nvim" }

    -- Colorschemes
    use { "adisen99/jellybeans-nvim", requires = "rktjmp/lush.nvim" }
    use { "EdenEast/nightfox.nvim" }
    use { "tomasiser/vim-code-dark" }
    use { "marko-cerovac/material.nvim" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    -- snippets
    use { "L3MON4D3/LuaSnip" } --snippet engine
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- LSP
    -- use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer
    use { "neovim/nvim-lspconfig" } -- enable LSP
    use { "williamboman/mason.nvim"}
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    use { "RRethy/vim-illuminate" }

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use { "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use { "nvim-treesitter/nvim-treesitter-context" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }

    -- DAP
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "ravenxrz/DAPInstall.nvim" }

    -- Misc
    use { "tpope/vim-unimpaired" }
    use { "folke/trouble.nvim" }
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
    -- use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
    use { "tmhedberg/SimpylFold" }
    use { "Konfekt/FastFold" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
