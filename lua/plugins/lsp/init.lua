local M = {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
    lazy = false,
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
        "saghen/blink.cmp",
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "none",
                    icons = {
                        package_installed = "◍",
                        package_pending = "◍",
                        package_uninstalled = "◍",
                    },
                },
                log_level = vim.log.levels.INFO,
                max_concurrent_installers = 4,
            }
        },
        "williamboman/mason-lspconfig.nvim",
        -- "nvimtools/none-ls.nvim",
        "RRethy/vim-illuminate",
    },
}

function M.config()
  -- local lspconfig = require("lspconfig")
  local servers = {
      "basedpyright",
      "ruff",
      "bashls",
  }
  require("mason-lspconfig").setup({
    ensure_installed = servers,
	automatic_installation = true,
  })

  require("plugins.lsp.illuminate").setup()
  local handlers = require("plugins.lsp.handlers")
  local opts = {}

  for _, server in pairs(servers) do
    opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- lspconfig[server].setup(opts)
    vim.lsp.config(server, opts)
  end
  handlers.setup()
  -- require("plugins.lsp.null-ls").setup()
end

return M
