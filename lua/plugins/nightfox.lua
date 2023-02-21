local M = {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 999,
  enabled = false
}

function M.config()
  require("nightfox").setup({
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
        barbar = true,
      },
    },
    palettes = {
      carbonfox = {
        bg1 = "#111111", -- 5% darker
      }
    },
    specs = {},
    groups = {
      carbonfox = {
        BufferCurrent        = { bg = "bg3", fg = "fg1", style = "bold" },  -- fg3, fg1
        BufferCurrentIndex   = { bg = "bg3", fg = "diag.info" },
        BufferCurrentMod     = { bg = "bg3", fg = "diag.info", style = "bold" },
        BufferCurrentSign    = { bg = "bg3", fg = "diag.info" },
        BufferCurrentTarget  = { bg = "bg3", fg = "palette.green" },
        -- BufferVisible        = { bg = "bg2", fg = "palette.comment", style = "italic" },
        -- BufferVisibleIndex   = { bg = "bg2", fg = "palette.magenta" },
        -- BufferVisibleMod     = { bg = "bg2", fg = "palette.magenta", style = "italic" },
        -- BufferVisibleSign    = { bg = "bg2", fg = "palette.magenta" },
        -- BufferVisibleTarget  = { bg = "bg2", fg = "diag.error" },
        -- BufferInactive       = { bg = spec.bg0, fg = syn.comment },
        -- BufferInactiveIndex  = { bg = spec.bg0, fg = syn.comment },
        -- BufferInactiveMod    = { bg = spec.bg0, fg = spec.diag_bg.warn },
        -- BufferInactiveSign   = { bg = spec.bg0, fg = spec.bg3 },
        -- BufferInactiveTarget = { bg = spec.bg0, fg = spec.diag.error },
        -- BufferTabpages       = { bg = spec.bg0 },
        -- BufferTabpage        = { bg = spec.bg0, fg = spec.bg3 },
        BufferAlternate     = { bg = "#666666", fg = "palette.pink" },
        BufferAlternateIndex     = { bg = "#666666", fg = "palette.pink" },
        BufferAlternateMod     = { bg = "#666666", fg = "palette.green" },
        BufferAlternateSign     = { bg = "#666666", fg = "palette.pink" },
      },
    },
  })

  -- set colorscheme carbonfox
  vim.cmd [[colorscheme carbonfox]]
end

return M
