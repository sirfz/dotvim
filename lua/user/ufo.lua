local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'indent', 'treesitter'}
    end,
    open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>'
        }
    },
})
