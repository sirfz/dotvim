local M = {
    "romgrk/barbar.nvim",
    event = "BufEnter",
    -- init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- Enable/disable animations
        animation = false,

        -- Enable/disable auto-hiding the tab bar when there is a single buffer
        auto_hide = false,

        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = true,

        -- Enable/disable close button
        closable = true,

        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,

        -- Excludes buffers from the tabline
        exclude_ft = {'fugitive'},
        exclude_name = {'package.json'},

        -- Hide file extensions.
        hide = {extensions = true, inactive = false},

        -- highlight alternate buffers
        highlight_alternate = true,

        -- highlight visible buffers
        highlight_visible = true,

        -- Enable/disable icons
        icons = {
            -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
            preset = 'default',

            buffer_index = true,
            filetype = { enabled = true },
            -- inactive = {
            --     separator = {
            --         left = '▎'
            --     }
            -- },
            -- active = {
            --     separator = {
            --         left =  '▎'
            --     }
            -- },
            pinned = {
                button = '󰐃',
            },
            button = '󰅖',
            modified = {
                button = '●'
            },
        },

        -- If set, the icon color will follow its corresponding buffer
        -- highlight group. By default, the Buffer*Icon group is linked to the
        -- Buffer* group (see Highlighting below). Otherwise, it will take its
        -- default value as defined by devicons.
        icon_custom_colors = false,

        -- Configure icons on the bufferline.

        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = false,
        insert_at_start = false,

        -- Sets the maximum padding width with which to surround each tab
        maximum_padding = 1,

        -- Sets the minimum padding width with which to surround each tab
        minimum_padding = 1,

        -- Sets the maximum buffer name length.
        maximum_length = 30,

        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,

        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustement
        -- for other layouts.
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        -- where X is the buffer number. But only a static string is accepted here.
        no_name_title = nil,
        sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
            NvimTree = false,
            -- Or, specify the text used for the offset:
            undotree = {
                text = 'undotree',
                align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
            },
            -- Or, specify the event which the sidebar executes when leaving:
            ['neo-tree'] = {event = 'BufWipeout'},
            -- Or, specify all three
            Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
        },
    }
}

return M
