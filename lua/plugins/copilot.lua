return {
    {
        "zbirenbaum/copilot.lua",
        config = true,
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        cmd = "CopilotChat",
        branch = "main",
        dependencies = {
            "nvim-lua/plenary.nvim", -- for curl, log wrapper
        },
        config = true,
        dependencies = {
            "zbirenbaum/copilot.lua",
        }
    },
    {
        "giuxtaposition/blink-cmp-copilot",
        dependencies = {
            "zbirenbaum/copilot.lua",
        },
    },
}
