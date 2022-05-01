local opts = { noremap = true, silent = true }
local recurs_opts = { noremap = false, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Paste text using mouse
keymap("n", "<MiddleMouse>", "p", opts)

-- Rename repetitive word
keymap("n", "<leader>ar", "yiw:.,$s:<C-r>0::Igc<left><left><left><left>", opts)

-- Motion alternatives
keymap("n", "[[", "[{", opts)
keymap("n", "]]", "]}", opts)

keymap("n", "]{", "/{<cr>:noh<cr>", opts)
keymap("n", "]}", "/}<cr>:noh<cr>", opts)
keymap("n", "[{", "?{<cr>:noh<cr>", opts)
keymap("n", "[}", "?}<cr>:noh<cr>", opts)

keymap("n", "]<", "/<<cr>:noh<cr>", opts)
keymap("n", "]>", "/><cr>:noh<cr>", opts)
keymap("n", "[<", "?<<cr>:noh<cr>", opts)
keymap("n", "[>", "?><cr>:noh<cr>", opts)

-- Window splitting
keymap("n", "<C-w>h", "<C-w>s", opts)

-- Toggle spell check
-- keymap("n", "<F3>", ":set spell!<CR>", opts)
keymap("n", "<F3>", "ZT", recurs_opts)

-- Jumplist mutations
keymap("n", "k", "(v:count > 5 ? \"m\'\" . v:count : \"\") . \'k\'", expr_opts)
keymap("n", "j", "(v:count > 5 ? \"m\'\" . v:count : \"\") . \'j\'", expr_opts)

-- Add new line without insert mode (with count)
-- keymap('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<cr>', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<cr>", opts)
keymap("n", "<A-k>", ":m .-2<cr>", opts)

-- Insert --
-- Undo break points
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

-- Toggle spell check
-- keymap("i", "<F3>", "<C-O>:set spell!<CR>", opts)
keymap("i", "<F3>", "<C-O>ZT", recurs_opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Additional way to copy selected text
keymap("v", "<C-c>", "y", opts)
keymap("v", "<RightMouse>", "y", opts)

-- Rename repetitive selected text
keymap("v", "<leader>ar", "y:.,$s:<C-r>0::Igc<left><left><left><left>", opts)

-- Motion alternatives
keymap("v", "[[", "[{", opts)
keymap("v", "]]", "]}", opts)

keymap("v", "]{", "/{<cr>", opts)
keymap("v", "]}", "/}<cr>", opts)
keymap("v", "[{", "?{<cr>", opts)
keymap("v", "[}", "?}<cr>", opts)

keymap("v", "]<", "/<<cr>", opts)
keymap("v", "]>", "/><cr>", opts)
keymap("v", "[<", "?<<cr>", opts)
keymap("v", "[>", "?><cr>", opts)

-- Replace text without changing register's content
keymap("v", "p", '"_dP', opts)
keymap("v", "P", '"_dp', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)
