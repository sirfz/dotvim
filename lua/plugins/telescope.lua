local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim", build = "make"
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      dependencies = "kkharji/sqlite.lua"
    }
  },
}

function M.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local lga_actions = require("telescope-live-grep-args.actions")

  telescope.setup {
      defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },
          preview = false,
          mappings = {
              i = {
                  ["<Down>"] = actions.cycle_history_next,
                  ["<Up>"] = actions.cycle_history_prev,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
              },
          },
          layout_config = { prompt_position = "top" }, -- search bar at the top
          sorting_strategy = "ascending", -- results appear top-bottom
      },
      extensions = {
          live_grep_args = {
              auto_quoting = false, -- enable/disable auto-quoting
              -- define mappings, e.g.
              mappings = { -- extend mappings
                  i = {
                      ["<Up>"] = lga_actions.quote_prompt(),
                      ["<Down>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                      ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
                  },
              },
          },
          frecency = {
              show_scores = false,
              show_unindexed = true,
              ignore_patterns = {"*.git/*", "*/tmp/*"},
              disable_devicons = false,
          },
          fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
          }
      }
  }
  telescope.load_extension('fzf')
  telescope.load_extension('frecency')
  telescope.load_extension('live_grep_args')
end

return M
