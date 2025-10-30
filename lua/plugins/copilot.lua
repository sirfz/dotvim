return {
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            nes = {
                enabled = false,
                keymap = {
                    accept_and_goto = "<leader>p",
                    accept = false,
                    dismiss = "<Esc>",
                },
            },
        },
    },
}
