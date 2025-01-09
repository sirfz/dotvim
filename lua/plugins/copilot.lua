return {
    {
        "zbirenbaum/copilot.lua",
        enabled = false,
        config = true,
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
        dependencies = {
            -- {
            --     "CopilotC-Nvim/CopilotChat.nvim",
            --     cmd = "CopilotChat",
            --     branch = "main",
            --     dependencies = {
            --         "nvim-lua/plenary.nvim", -- for curl, log wrapper
            --     },
            --     config = true,
            -- },
            {
                "giuxtaposition/blink-cmp-copilot",
            },

        }
    },
}
