local M = {
  "bluz71/vim-moonfly-colors",
  lazy = false,
  priority = 999,
  enabled = true
}

function M.config()
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

return M
