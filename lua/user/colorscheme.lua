-- local colorscheme = "jellybeans-nvim"
-- local colorscheme = "adwaita"
-- local colorscheme = "onedark"
-- local colorscheme = "carbonfox"
-- local colorscheme = "darkplus"
-- local colorscheme = "ayu"
local colorscheme = "codedark"

-- adwaita
-- vim.g.adwaita_darker = true -- for darker version
-- vim.g.adwaita_disable_cursorline = false -- to disable cursorline

-- onedark
-- require('onedark').setup {
--     style = 'warmer'
-- }

-- nightfox
-- require('nightfox').setup({
--     options = {
--         -- Compiled file's destination location
--         compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--         compile_file_suffix = "_compiled", -- Compiled file suffix
--         transparent = false,    -- Disable setting background
--         terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--         dim_inactive = false,   -- Non focused panes set to alternative background
--         module_default = true,  -- Default enable value for modules
--         styles = {              -- Style to be applied to different syntax groups
--             comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
--             conditionals = "NONE",
--             constants = "NONE",
--             functions = "NONE",
--             keywords = "NONE",
--             numbers = "NONE",
--             operators = "NONE",
--             strings = "NONE",
--             types = "NONE",
--             variables = "NONE",
--         },
--         inverse = {             -- Inverse highlight for different types
--             match_paren = false,
--             visual = false,
--             search = false,
--         },
--         modules = {             -- List of various plugins and additional options
--             -- ...
--             barbar = true,
--         },
--     },
--     palettes = {},
--     specs = {},
--     groups = {},
-- })

-- ayu
-- require('ayu').setup({
--     mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--     overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })

-- codedark
vim.g.codedark_italics = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
