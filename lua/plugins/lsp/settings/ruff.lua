
return {
    -- cmd = { 'uvx', 'ruff', 'server' },
    init_options = {
        settings = {
            lint = {
                args = {
                    "--line-length=120",
                }
            },
            format = {
                args = {
                    "--line-length=120",
                },
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end,
}
