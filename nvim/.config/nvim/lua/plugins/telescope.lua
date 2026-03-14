return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            telescope.setup({})
        end,
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
            { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
            { '<leader>fH', '<cmd>Telescope find_files hidden=true<cr>', desc = 'Find Hidden Files' },
        },
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
