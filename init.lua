vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require("config.autocmds")
--     require("config.keymaps")
--   end,
-- })

require("config.options")
require("config.lazy")

require("config.autocmds")
require("config.keymaps")
