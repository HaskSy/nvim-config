local bonzer0Group = augroup("bonzer0", {})
autocmd("LspAttach", {
    group = bonzer0Group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.lsp.completion.enable(true, e.data.client_id, e.buf, {
		    autotrigger = true,
		    convert = function(item)
                return { abbr = item.label:gsub("%b()", "") }
		    end,
        })
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>ws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>d", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>rr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>rn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "[d", function()
            require("trouble").prev({
                skip_groups = true,
                jump = true,
                mode = "diagnostics",
            })
        end, opts)
        vim.keymap.set("n", "]d", function()
            require("trouble").next({
                skip_groups = true,
                jump = true,
                mode = "diagnostics",
            })
        end, opts)
    end,
})
