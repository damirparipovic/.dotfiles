function ColorMyPencils(color)
	color = color or "tokyonight-night" or "rose-pine"
    if (color == "material")
    then
        materialSets(color)
    end
	vim.cmd.colorscheme(color)
end

function materialSets(color)
    if (color == "material")
    then
        vim.g.material_style = "deep ocean"
    else
        vim.g.material_style = "oceanic"
    end
end

ColorMyPencils()
