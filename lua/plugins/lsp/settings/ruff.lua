
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
    -- capabilities = {
    --     textDocument = {
    --         hover = {
    --             dynamic_registration: false,
    --         }
    --     },
    -- },
    on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
    end,
}
