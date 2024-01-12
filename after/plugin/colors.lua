function SetupSonokai(name)
	vim.g.sonokai_style = name
	vim.g.sonokai_better_performance = 1
	vim.g.sonokai_transparent_background = 1
end

function ToggleBackgroundTheme()
	if vim.opt.background == "light" then
		vim.opt.background = "dark"
	else
		if vim.opt.background == "dark" then
			vim.opt.background = "light"
		end
	end
end

function ColorMyPencils(color, theme)
	if theme == nil then
		theme = "shusia"
	end

	if color ~= "rose-pine" then
		color = color or "sonokai"
		SetupSonokai(theme)
	end
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
