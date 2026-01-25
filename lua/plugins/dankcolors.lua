return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#181825',
				base01 = '#181825',
				base02 = '#d2d3d7',
				base03 = '#d2d3d7',
				base04 = '#444447',
				base05 = '#f9faff',
				base06 = '#f9faff',
				base07 = '#f9faff',
				base08 = '#ff7fa0',
				base09 = '#ff7fa0',
				base0A = '#adb8ff',
				base0B = '#72ff8a',
				base0C = '#d9deff',
				base0D = '#adb8ff',
				base0E = '#e7eaff',
				base0F = '#e7eaff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#d2d3d7',
				fg = '#f9faff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#adb8ff',
				fg = '#181825',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#d2d3d7' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d9deff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#e7eaff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#adb8ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#adb8ff',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#d9deff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#72ff8a',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#444447' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#444447' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#d2d3d7',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
