-- local util = require("lspconfig/util")

return {
    settings = {
        pyright = {
            disableOrganizeImports = true,
            -- disableTaggedHints = true,
        },
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
            },
        },
    },
    -- root_dir =function(fname)
    --     return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
    --         util.path.dirname(fname)
    -- end
}
