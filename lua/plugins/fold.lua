local M = {
    "tmhedberg/SimpylFold",
    dependencies = {
        "Konfekt/FastFold"
    },
    -- evnet = "BufEnter",
    ft = "python",
    config = function()
        vim.g.fastfold_savehook = 1
        vim.g.fastfold_fold_command_suffixes =  { 'x', 'X', 'a', 'A', 'o', 'O', 'c', 'C' }
        vim.g.fastfold_fold_movement_commands = { ']z', '[z', 'zj', 'zk' }
        vim.g.SimpylFold_docstring_preview = 1
    end
}

return M
