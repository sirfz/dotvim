local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
    options = {
        numbers = "ordinal",
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    },
    -- highlights = {
    --     fill = {
    --         fg = { attribute = "fg", highlight = "Pmenu" },
    --         -- bg = { attribute = "bg", highlight = "Pmenu" },
    --     },
    --
    --     -- background = {
    --     --     fg = { attribute = "fg", highlight = "TabLine" },
    --     --     bg = { attribute = "bg", highlight = "TabLine" },
    --     -- },
    --
    --     buffer = {
    --         fg = { attribute = "fg", highlight = "TabLineFill" },
    --         bg = { attribute = "bg", highlight = "TabLineFill" },
    --     },
    --
    --     buffer_selected = {
    --         fg = { attribute = "fg", highlight = "TabLineSel" },
    --         bg = { attribute = "bg", highlight = "TabLineSel" },
    --     },
    --
    --     buffer_visible = {
    --         fg = { attribute = "fg", highlight = "TabLine" },
    --         bg = { attribute = "bg", highlight = "TabLine" },
    --     },
    --
    --     close_button = {
    --         fg = { attribute = "fg", highlight = "TabLineFill" },
    --         bg = { attribute = "bg", highlight = "TabLineFill" },
    --     },
    --
    --     close_button_visible = {
    --         fg = { attribute = "fg", highlight = "TabLine" },
    --         bg = { attribute = "bg", highlight = "TabLine" },
    --     },
    --
    --     close_button_selected = {
    --         fg = { attribute = "fg", highlight = "TabLineSel" },
    --         bg = { attribute = "bg", highlight = "TabLineSel" },
    --     },
    --
    --     numbers = {
    --         fg = { attribute = "fg", highlight = "TabLineFill" },
    --         bg = { attribute = "bg", highlight = "TabLineFill" },
    --     },
    --
    --     numbers_visible = {
    --         fg = { attribute = "fg", highlight = "TabLine" },
    --         bg = { attribute = "bg", highlight = "TabLine" },
    --     },
    --
    --     numbers_selected = {
    --         fg = { attribute = "fg", highlight = "TabLineSel" },
    --         bg = { attribute = "bg", highlight = "TabLineSel" },
    --         -- bold = true,
    --         -- italic = true,
    --     },
    --
    --     modified = {
    --         fg = { attribute = "fg", highlight = "TabLineFill" },
    --         bg = { attribute = "bg", highlight = "TabLineFill" },
    --     },
    --
    --     modified_visible = {
    --         fg = { attribute = "fg", highlight = "TabLine" },
    --         bg = { attribute = "bg", highlight = "TabLine" },
    --     },
    --
    --     modified_selected = {
    --         fg = { attribute = "fg", highlight = "TabLineSel" },
    --         bg = { attribute = "bg", highlight = "TabLineSel" },
    --     },
    -- },
}
