return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 25, -- Decreased from default (40) by 15
                    mappings = {
                        ["<space>"] = "none", -- Disable space key in neo-tree
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                },
            })

            -- Make neo-tree transparent
            vim.cmd([[
                highlight NeoTreeNormal guibg=none
                highlight NeoTreeNormalNC guibg=none
                highlight NeoTreeEndOfBuffer guibg=none
                highlight NeoTreeWinSeparator guibg=none
                highlight NeoTreeVertSplit guibg=none
                highlight WinSeparator guibg=none
                highlight VertSplit guibg=none
                highlight NormalNC guibg=none
            ]])

            -- Ensure transparency is maintained when switching windows
            vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
                pattern = "*",
                callback = function()
                    vim.cmd([[
                        highlight Normal guibg=none
                        highlight NormalNC guibg=none
                    ]])
                end,
            })
        end,
        keys = {
            { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle Explorer' },
            { '<leader>o', function()
                local winid = vim.api.nvim_get_current_win()
                local bufnr = vim.api.nvim_win_get_buf(winid)
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("neo%-tree") then
                    vim.cmd("wincmd p")
                else
                    vim.cmd("Neotree focus")
                end
            end, desc = 'Toggle Focus Explorer/Code' },
        },
    }
}
