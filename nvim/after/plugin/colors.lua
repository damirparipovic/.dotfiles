function ColorMyPencils(color)
	color = color or "tokyonight-night" or "rose-pine"
	vim.cmd.colorscheme(color)

end

ColorMyPencils()
