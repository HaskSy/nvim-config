require("bonzer0.vimopt")
require("bonzer0.mapping")
require("bonzer0.lazy_init")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

_G.autocmd = autocmd
_G.augroup = augroup

function R(name)
    require("plenary.reload").reload_module(name)
end

-- autocmd
require("bonzer0.mapping-lsp")
require("bonzer0.highlight-yank")
-- autocmd
