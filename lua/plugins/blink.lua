return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        {
            'echasnovski/mini.icons',
            version = '*',
            lazy = true,
            opts = function()
                require("mini.icons").mock_nvim_web_devicons()
                return {
                    lsp = {
                        copilot = { glyph = '', hl = 'MiniIconsOrange'  },
                    }
                }
            end,
        },
        -- 'giuxtaposition/blink-cmp-copilot',
        "fang2hou/blink-copilot",
    },

    build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
            preset = 'enter',
            -- ['<Tab>'] = {
            --     'select_next',
            --     'fallback',
            -- },
            ["<Tab>"] = {
                "select_next",
                function() -- sidekick next edit suggestion
                    return require("sidekick").nes_jump_or_apply()
                end,
                function() -- if you are using Neovim's native inline completions
                    return vim.lsp.inline_completion.get()
                end,
                "fallback",
            },
            ['<S-Tab>'] = {
                'select_prev',
                'fallback',
            },
            -- ['<CR>'] = { 'accept', 'fallback' },
            ['<C-C>'] = { 'cancel', 'fallback' },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'normal'
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            providers = {
                copilot = {
                    name = 'copilot',
                    -- module = 'blink-cmp-copilot',
                    module = 'blink-copilot',
                    -- score_offset = 100,
                    async = true,
                    -- transform_items = function(_, items)
                    --     local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                    --     local kind_idx = #CompletionItemKind + 1
                    --     CompletionItemKind[kind_idx] = "Copilot"
                    --     for _, item in ipairs(items) do
                    --         item.kind = kind_idx
                    --     end
                    --     return items
                    -- end,
                },
            },
            default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        },

        -- optionally disable cmdline completions
        cmdline = {
            enabled = false,
        },

        completion = {
            list = { selection = { preselect = false, auto_insert = true } },
            documentation = { auto_show = true },
            accept = { auto_brackets = { enabled = true } },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                -- return (
                                -- require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                                -- or "BlinkCmpKind"
                                -- ) .. ctx.kind
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                    },
                },
            },
        },

        -- experimental signature help support
        signature = { enabled = true },
    },

    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it, via opts_extend
    opts_extend = { "sources.default" }
}
