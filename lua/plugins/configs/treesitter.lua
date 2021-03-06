local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("nvim-treesitter.configs require failed")
  return
end

configs.setup {
  ensure_installed = { "lua", "bash", "javascript", "typescript", "python", "tsx", "css", "scss", "dockerfile", "yaml" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "html" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml", "css", "scss" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      }
    }
  }
}
