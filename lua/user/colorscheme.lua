-- local colorscheme = "jellybeans-nvim"
-- local colorscheme = "adwaita"
local colorscheme = "onedark"

-- adwaita
-- vim.g.adwaita_darker = true -- for darker version
-- vim.g.adwaita_disable_cursorline = false -- to disable cursorline

-- onedark
require('onedark').setup {
    style = 'warmer'
}

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
