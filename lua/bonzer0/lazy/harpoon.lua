return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "nvim-telescope/telescope.nvim"
        },
        config = function()
            local harpoon = require("harpoon")
            -- local conf = require("telescope.config").values
            -- local function toggle_telescope(harpoon_files)
            --     local file_paths = {}
            --     for _, item in ipairs(harpoon_files.items) do
            --         table.insert(file_paths, item.value)
            --     end

            --     require("telescope.pickers").new({}, {
            --         prompt_title = "Harpoon",
            --         finder = require("telescope.finders").new_table({
            --             results = file_paths,
            --         }),
            --         previewer = conf.file_previewer({}),
            --         sorter = conf.generic_sorter({}),
            --     }):find()
            -- end


            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            -- Quick menu (Telescope UI)
            -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end)
            -- Quick menu (Harpoon UI)
            vim.keymap.set({ "n" }, "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            -- Quick access to first 4 files (using leader + number)
            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

            -- Cycle through marked files (like buffer cycling)
            vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)
        end
    }
}
