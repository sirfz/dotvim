return {
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        config = true,
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
        }
    },
}
