function ColorMyPencils(color)
	color = color or "tokyonight-night" or "rose-pine"
    if (color == "material")
    then
        materialSets(color)
    end
    if (color == "gruvbox")
    then
        vim.o.background = "dark"
        require("gruvbox").setup({
            contrast = "",
        })
    end
    vim.cmd.colorscheme(color)
end

function materialSets(color)
    if (color == "material")
    then
        vim.g.material_style = "deep ocean"
    end
end

ColorMyPencils("gruvbox")
