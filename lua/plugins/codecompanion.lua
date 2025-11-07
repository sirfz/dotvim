return {
    "olimorris/codecompanion.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
        strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
        },
    }
}
