local configs = {
    "options",
    "keymaps",
    "lazy",
}
for _, file in pairs(configs) do
    require("config." .. file)
end
