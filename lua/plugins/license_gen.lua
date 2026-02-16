return {
    "SayC8/license_gen.nvim",
    cmd = "AddLicense",
    config = function()
        require("license_gen").setup({
            -- default_name = "John Doe", -- Optional: overrides git config
                -- extra_licences = { -- Optional: add your own templates
                --     MyCustomLicense = "Copyright (c) [year] [fullname]\nAll rights reserved."
                -- }
        })
    end
}
