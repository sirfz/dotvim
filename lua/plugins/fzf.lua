return {
    {
        'ibhagwan/fzf-lua',
        enabled = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        branch = 'main',
        cmd = { 'FzfLua' },
        opts = {
            { "fzf-native", "hide" },
        },
        config = function(_, opts)
            require('fzf-lua').setup(opts)
            require("fzf-lua").register_ui_select(function(_, items)
                local min_h, max_h = 0.15, 0.70
                local h = (#items + 4) / vim.o.lines
                if h < min_h then
                    h = min_h
                elseif h > max_h then
                    h = max_h
                end
                return { no_resume = true, winopts = { height = h, width = 0.60, row = 0.40 } }
            end)
        end,
        keys = {
            { "<leader>ff", ":FzfLua files<CR>", desc = "Smart Find Files" },
            {
                "<leader>fe", function()
                    require('fzf-lua-frecency').frecency(
                        {
                            cwd_only=true,
                            all_files=true,
                            fzf_opts={["--no-sort"] = false }
                        }
                    )
                end,
                desc = "Files frecency"
            },
            { "<leader>ft", ":FzfLua live_grep<CR>", desc = "Grep" },
            { "<leader>fo", ":FzfLua oldfiles<CR>", desc = "Oldfiles" },
            {
                "<leader>fm", function()
                    require('fzf-lua-frecency').frecency(
                        {
                            cwd_only=false,
                            all_files=true,
                            fzf_opts={["--no-sort"] = false }
                        }
                    )
                end,
                desc = "Recent"
            },
            { "<leader>fb", ":FzfLua buffers<CR>", desc = "Buffers" },
            { "<leader>fr", ":FzfLua resume<CR>", desc = "Resume" },
            { "<leader>fk", ":FzfLua keymaps<CR>", desc = "Keymaps" },
            { "<leader>fd", ":FzfLua diagnostics_document<CR>", desc = "Buffer diagnostics" },
            { 
                "<C-x><C-f>",
                mode = "i",
                function() require("fzf-lua").complete_path() end,
                desc = "Fuzzy complete path",
            },
        }
    },
    {
        'elanmed/fzf-lua-frecency.nvim',
        enabled = true,
        dependencies = 'ibhagwan/fzf-lua',
        config = true,
    }
}
