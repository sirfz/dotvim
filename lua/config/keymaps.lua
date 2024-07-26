-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffers
-- keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
-- bufferline
-- keymap("n", "]mb", ":BufferLineMoveNext<CR>", opts)
-- keymap("n", "[mb", ":BufferLineMovePrev<CR>", opts)
-- keymap("n", "]b", ":BufferLineCycleNext<CR>", opts)
-- keymap("n", "[b", ":BufferLineCyclePrev<CR>", opts)
-- barbar
keymap("n", "]mb", ":BufferMoveNext<CR>", opts)
keymap("n", "[mb", ":BufferMovePrevious<CR>", opts)
keymap("n", "]b", ":BufferNext<CR>", opts)
keymap("n", "[b", ":BufferPrevious<CR>", opts)
keymap("n", "]B", ":BufferLast<CR>", opts)
keymap("n", "[B", ":BufferFirst<CR>", opts)
keymap("n", "<S-q>", ":BufferClose<CR>", opts)
keymap("n", "<C-p>", ":BufferPick<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fm", ":lua require('telescope').extensions.frecency.frecency()<CR>", opts)
-- keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
-- keymap("n", "<leader>fd", ":Telescope diagnostics bufnr=0<CR>", opts)

-- fzf
keymap("n", "<leader>ff", ":FzfLua files<CR>", opts)
keymap("n", "<leader>fm", ":FzfLua oldfiles<CR>", opts)
keymap("n", "<leader>ft", ":FzfLua live_grep_glob<CR>", opts)
keymap("n", "<leader>fb", ":FzfLua buffers<CR>", opts)
keymap("n", "<leader>fk", ":FzfLua keymaps<CR>", opts)
keymap("n", "<leader>fd", ":FzfLua diagnostics_document<CR>", opts)
keymap("n", "<leader>fr", ":FzfLua resume<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- quickfix/trouble
keymap("n", "<leader>oq", ":Trouble quickfix<CR>", opts)
keymap("n", "<leader>cc", ":TroubleClose<CR>", opts)

-- fold
-- keymap('n', 'zR', require('ufo').openAllFolds, opts)
-- keymap('n', 'zM', require('ufo').closeAllFolds, opts)

-- portal
keymap("n", "<leader>o", "<cmd>Portal jumplist backward<cr>", opts)
keymap("n", "<leader>i", "<cmd>Portal jumplist forward<cr>", opts)

-- fzf filepath completion
keymap({ "n", "v", "i" }, "<C-x><C-f>", function() require("fzf-lua").complete_path() end,
       { silent = true, desc = "Fuzzy complete path" })
