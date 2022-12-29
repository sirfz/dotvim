-- local colorscheme = "jellybeans-nvim"
local colorscheme = "carbonfox"
-- local colorscheme = "codedark"
-- local colorscheme = "jellybeans"
-- local colorscheme = "material"
-- local colorscheme = "oxocarbon"
-- local colorscheme = "selenized"

-- nightfox
require('nightfox').setup({
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
            -- ...
            barbar = false,
        },
    },
    palettes = {
        carbonfox = {
            bg1 = "#111111", -- 5% darker
        }
    },
    specs = {},
    groups = {},
})

-- codedark
-- vim.g.codedark_italics = 1

-- material
-- vim.g.material_style = "darker"
-- require('material').setup({
--     contrast = {
--         terminal = false, -- Enable contrast for the built-in terminal
--         sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--         floating_windows = false, -- Enable contrast for floating windows
--         cursor_line = false, -- Enable darker background for the cursor line
--         non_current_windows = false, -- Enable darker background for non-current windows
--         filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
--     },
--
--     styles = { -- Give comments style such as bold, italic, underline etc.
--         comments = { italic = true },
--         strings = { --[[ bold = true ]] },
--         keywords = { --[[ underline = true ]] },
--         functions = { --[[ bold = true, undercurl = true ]] },
--         variables = {},
--         operators = {},
--         types = {},
--     },
--
--     plugins = { -- Uncomment the plugins that you use to highlight them
--         -- Available plugins:
--         -- "dap",
--         -- "dashboard",
--         "gitsigns",
--         -- "hop",
--         "indent-blankline",
--         -- "lspsaga",
--         -- "mini",
--         -- "neogit",
--         "nvim-cmp",
--         -- "nvim-navic",
--         "nvim-tree",
--         "nvim-web-devicons",
--         -- "sneak",
--         "telescope",
--         "trouble",
--         -- "which-key",
--     },
--
--     disable = {
--         colored_cursor = false, -- Disable the colored cursor
--         borders = false, -- Disable borders between verticaly split windows
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--         term_colors = false, -- Prevent the theme from setting terminal colors
--         eob_lines = false -- Hide the end-of-buffer lines
--     },
--
--     high_visibility = {
--         lighter = false, -- Enable higher contrast text for lighter style
--         darker = true -- Enable higher contrast text for darker style
--     },
--
--     lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
--     async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--     custom_highlights = {  -- Overwrite highlights with your own
--         Folded = { fg = "#656565", italic = true },
--     },
--     custom_colors = function(colors)  -- If you want to everride the default colors, set this to a function
--         -- 5% darker
--         colors.editor.bg = "#1c1c1c"
--         colors.editor.bg_alt = "#151515"
--         colors.editor.contrast = "#151515"
--         colors.editor.active = "#2d2d2d"
--         colors.editor.disabled = "#424242"
--         colors.editor.accent = "#fa9300"
--         -- contrasted comments/line_numbers
--         -- colors.syntax.comments = "#757575"
--         -- colors.editor.line_numbers = "#5c5c5c"
--     end,
-- })

-- jellybeans
-- require'colors.jellybeans'.setup()

-- selenized
-- vim.g.selenized_variant = "bw"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
