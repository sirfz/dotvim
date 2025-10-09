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
                enabled = true,
                keymap = {
                    accept_and_goto = "<leader>p",
                    accept = false,
                    dismiss = "<Esc>",
                },
            },
        },
        dependencies = {
            {
                "copilotlsp-nvim/copilot-lsp",
                config = function()
                    vim.g.copilot_nes_debounce = 500
                end,
            }
        }
    },
}
