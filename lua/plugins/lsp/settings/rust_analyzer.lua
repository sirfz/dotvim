return {
    default_settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = true,
            check = {
                command = "clippy", -- Run cargo clippy on save for richer warnings
            },
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                parameterHints = { enable = true },
                typeHints = { enable = true },
            },
        },
    },
}
