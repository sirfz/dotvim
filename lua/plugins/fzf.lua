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
            desc = "fzf with `bat` as native previewer",
            winopts = { preview = { default = "bat" } },
            manpages = { previewer = "man_native" },
            helptags = { previewer = "help_native" },
            tags = { previewer = "bat" },
            btags = { previewer = "bat" },
        },
        keys = {
            -- { "<leader>ff", ":FzfLua files<CR>", desc = "Smart Find Files" },
            {
                "<leader>ff", function()
                    require('fzf-lua-frecency').frecency(
                        {
                            cwd_only=true,
                            all_files=true,
                            fzf_opts={["--no-sort"] = false }
                        }
                    )
                end,
                desc = "Files"
            },
            { "<leader>ft", ":FzfLua live_grep<CR>", desc = "Grep" },
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
            { "<leader>fk", ":FzfLua keymaps<CR>", desc = "Resume" },
            { "<leader>fd", ":FzfLua diagnostics_document<CR>", desc = "Resume" },
        },
    },
    {
        'elanmed/fzf-lua-frecency.nvim',
        enabled = true,
        dependencies = 'ibhagwan/fzf-lua',
        config = true,
    }
}
