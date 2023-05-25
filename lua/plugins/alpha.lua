local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  cond = function()
    return vim.api.nvim_buf_get_name(0) == ""
  end,
}

function M.config()
  local alpha = require("alpha")
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  }
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":FzfLua files<CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "󰄉 " .. " Recent files", ":FzfLua oldfiles<CR>"),
    dashboard.button("t", " " .. " Find text", ":FzfLua live_grep_glob <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
