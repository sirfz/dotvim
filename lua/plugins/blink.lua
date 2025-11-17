return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    version = '*',
    -- build = 'cargo build --release',
    dependencies = {
        'nvim-mini/mini.icons',
        -- 'giuxtaposition/blink-cmp-copilot',
        "fang2hou/blink-copilot",
    },
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
                -- function() -- if you are using Neovim's native inline completions
                --     return vim.lsp.inline_completion.get()
                -- end,
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
                    score_offset = 100,
                    async = true,
                },
                buffer = {
                    opts = {
                        -- get all normal buffers
                        get_bufnrs = function()
                            return vim.tbl_filter(function(bufnr)
                                return vim.bo[bufnr].buftype == ''
                            end, vim.api.nvim_list_bufs())
                        end
                    }
                },
                lsp = {
                    fallbacks = {}
                }
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
                            text = function(ctx)
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        },
                        kind = {
                            -- (optional) use highlights from mini.icons
                            highlight = function(ctx)
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end,
                        }
                    },
                    -- columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
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
