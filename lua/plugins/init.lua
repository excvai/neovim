local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer require failed")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Base dependencies
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "kyazdani42/nvim-web-devicons"

  -- Colorschemes
  use {
    "Mofiqul/vscode.nvim",
    config = function()
      require "plugins.configs.colorscheme"
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require "plugins.configs.bufferline"
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require "plugins.configs.indentline"
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter"
  }

  -- Git stuff
  use {
    "lewis6991/gitsigns.nvim",
    opt = true,
    config = function()
      require "plugins.configs.gitsigns"
    end,
    setup = function()
      require("core.utils").packer_lazy_load "gitsigns.nvim"
    end,
  }

  -- LSP stuff
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    config = function()
      require "plugins.configs.lsp"
    end,
  } -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  -- Load luasnips + cmp related in insert mode only
  use {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  } -- a bunch of snippets to use
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "plugins.configs.cmp"
    end,
  } -- The completion plugin
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
  } --snippet engine
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  } -- snippet completions
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  }
  use {
   "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua",
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp",
  } -- buffer completions
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  } -- path completions
  use {
    "hrsh7th/cmp-cmdline",
    after = "cmp-path"
  } -- cmdline completions


  -- Misc plugins
  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.autopairs"
    end,
  } -- Autopairs, integrates with both cmp and treesitter

  use {
    "goolord/alpha-nvim",
    config = function()
      require "plugins.configs.alpha"
    end,
  }

  use {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    config = function()
      require "plugins.configs.comment"
    end,
  } -- Easily comment stuff

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvim-tree"
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins.configs.telescope"
    end,
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use "moll/vim-bbye"

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.configs.toggleterm"
    end,
  }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require "plugins.configs.project"
    end,
  }

  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  use "tpope/vim-surround"

  use {
    "mattn/emmet-vim",
    config = function()
      require "plugins.configs.emmet"
    end,
  }

  use {
    "kamykn/spelunker.vim",
    config = function()
      require "plugins.configs.spelunker"
    end,
  }

  --use "psliwka/vim-smoothie"

  use "Darazaki/indent-o-matic"

  use {
    "unblevable/quick-scope",
    config = function()
      require "plugins.configs.quick-scope"
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require "plugins.configs.whichkey"
    end,
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
