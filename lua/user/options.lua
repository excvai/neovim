local options = {
  backup = false,                          -- creates a backup file
  writebackup = true,
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = false,                      -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 4,                           -- is one of my fav
  sidescrolloff = 4,
  spell = false,

  -- Enabling russian/ukrainian language in input mode (use Ctrl-6 to switch between languages)
  keymap = "russian-jcukenwin",
  -- keymap = "ukrainian-jcuken",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Return english in input mode by default
vim.cmd "set iminsert=0"

-- Disable html tags rendering (check :help html.vim)
vim.api.nvim_set_var('html_no_rendering', '1')

-- Setup providers
vim.api.nvim_set_var('loaded_node_provider', '0')
vim.api.nvim_set_var('loaded_python3_provider', '0')
-- vim.api.nvim_set_var('node_host_prog', '/home/cvai/.yarn/bin/neovim-node-host')
