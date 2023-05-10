return {
  'ibhagwan/fzf-lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  branch = 'main',
  cmd = { 'FzfLua' },
  opts = {
    desc = "fzf with `bat` as native previewer",
    winopts = { preview = { default = "bat" } },
    manpages = { previewer = "man_native" },
    helptags = { previewer = "help_native" },
    tags = { previewer = "bat" },
    btags = { previewer = "bat" },
  }
}
