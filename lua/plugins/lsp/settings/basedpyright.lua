-- local util = require("lspconfig/util")

return {
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            -- disableTaggedHints = true,
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
            },
        },
    },
}
