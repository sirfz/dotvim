return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        {
            'echasnovski/mini.icons',
            version = '*',
            lazy = true,
            opts = function()
                require("mini.icons").mock_nvim_web_devicons()
                return {
                    lsp = {
                        copilot = { glyph = '', hl = 'MiniIconsOrange'  }
                    }
                }
            end,
        },
        {
            "zbirenbaum/copilot.lua",
            config = true,
            cmd = "Copilot",
            event = "InsertEnter",
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
            },
            dependencies = {
                {
                    'giuxtaposition/blink-cmp-copilot',
                },
                {
                    "CopilotC-Nvim/CopilotChat.nvim",
                    cmd = "CopilotChat",
                    branch = "main",
                    dependencies = {
                        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
                    },
                    config = true,
                }
            }
        }
    },

    -- use a release tag to download pre-built binaries
    -- version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

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
            ['<Tab>'] = {
                'select_next',
                'fallback',
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
            nerd_font_variant = 'mono'
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            providers = {
                copilot = {
                    name = 'copilot',
                    module = 'blink-cmp-copilot',
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
            default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot', },
            -- optionally disable cmdline completions
            cmdline = {},
        },

        completion = {
            list = { selection = 'auto_insert' },
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
