local configs = {
  "options",
  "keymaps",
  "lazy",
}
for _, file in pairs(configs) do
  require("config." .. file)
end

-- Transparent backgrounds
local function fix_transparency()
  local groups = {
    "Normal", "NormalFloat", "SignColumn",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", force = true })
  end
end

fix_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = fix_transparency,
})
