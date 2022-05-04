local status_ok, impatient = pcall(require, "impatient")
if status_ok then
   impatient.enable_profile()
end

-- Opt-in feature to increase startup performance
vim.api.nvim_set_var('do_filetype_lua', 1)
vim.api.nvim_set_var('did_load_filetypes', 0)

local required_modules = {
  "core.options",
  "core.autocmds",
  "core.keymaps",
  "plugins",
  "core.helper-functions",
}

for _, module in ipairs(required_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
