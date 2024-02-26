
return {
    init_options = {
        settings = {
            lint = {
                args = {
                    "--select=E,F,A,ARG,UP,PIE,PLC,PLE,PLR,PLW,RUF",
                    "--ignore=ARG001,PLR2004,E741,PLR0913",
                    "--line-length=120",
                }
            },
            format = {
                args = {
                    "--line-length=120",
                    "--quote-style=double",
                    "--indent-style=space",
                    "--skip-magic-trailing-comma=false",
                    "--line-ending=auto",
                },
            },
        },
    },
}
