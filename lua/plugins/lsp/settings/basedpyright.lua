-- local util = require("lspconfig/util")

return {
    cmd = { 'uvx', '--from=basedpyright', 'basedpyright-langserver', '--stdio' },
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            disableLanguageServices = true,
            -- disableTaggedHints = true,
            analysis = {
                -- diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
            },
        },
    },
}
