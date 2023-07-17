M = {
    "sheerun/vim-polyglot",
    event = "BufReadPre",
    config = function()
        vim.g.csv_start = 1
        vim.g.csv_end = 100
    end,
    enabled = false,
}

return M
