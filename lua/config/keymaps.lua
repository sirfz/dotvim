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

-- Paste linewise before/after current line
-- Usage: `yiw` to yank a word and `]p` to put it on the next line.
keymap("n", '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
keymap("n", ']p', '<Cmd>exe "put " . v:register<CR>', { desc = 'Paste Below' })
keymap('n', '>P', '<Cmd>exe "put! " . v:register<CR>>>^', { desc = 'Paste Above and Indent' })
keymap('n', '>p', '<Cmd>exe "put " . v:register<CR>>>^', { desc = 'Paste Below and Indent' })
keymap('n', '<P', '<Cmd>exe "put! " . v:register<CR><<^', { desc = 'Paste Above and Dedent' })
keymap('n', '<p', '<Cmd>exe "put " . v:register<CR><<^', { desc = 'Paste Below and Dedent' })
keymap('n', '=P', '<Cmd>exe "put! " . v:register<CR>==^', { desc = 'Paste Above and re-indent' })
keymap('n', '=p', '<Cmd>exe "put " . v:register<CR>==^', { desc = 'Paste Below and re-indent' })

-- Better paste
keymap("v", "p", '"_dP', { desc = "improved visual paste", silent = true })

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

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

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
