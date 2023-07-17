return {
    "yioneko/vim-tmindent",
    opts = {
        enabled = function() return vim.tbl_contains({ "lua" }, vim.bo.filetype) end,
        use_treesitter = function() return true end, -- used to detect different langauge region and comments
        default_rule = {},
        rules = {
            lua = {
                comment = {'--'},
                -- inherit pair rules
                inherit = {'&{}', '&()'},
                -- these patterns are the same as TextMate's
                increase = {'\v<%(else|function|then|do|repeat)>((<%(end|until)>)@!.)*$'},
                decrease = {'^\v<%(elseif|else|end|until)>'},
                unindented = {},
                indentnext = {},
            }
        }
    }
}
