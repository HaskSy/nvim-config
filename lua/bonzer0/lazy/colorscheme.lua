return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = "macchiato",
            transparent_background = true,
            integrations = {
                harpoon = true
            },
            custom_highlights = {
                TelescopeNormal = { bg = "none" },
                TelescopeBorder = { bg = "none" },
                TelescopeTitle = { bg = "none" },
                NormalFloat = { bg = "none" },
                FloatTitle = { bg = "none" },
                FloatBorder = { bg = "none" }
            }
        })
        vim.cmd("colorscheme catppuccin-macchiato")
    end
}

-- This one doesn't work with borders

--[===[
function SetTransparentBG(color)
	color = color or 'palenightfall'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = "none" })
end

return {
    {
        'JoosepAlviste/palenightfall.nvim',
        config = function ()
            require('palenightfall').setup({})

	 		vim.cmd("colorscheme palenightfall")
	 		-- SetTransparentBG('palenightfall')
        end
    }
}
--]===]
