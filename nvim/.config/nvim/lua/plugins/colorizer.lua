return {
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup({
                "*", -- Highlight all files
                css = { rgb_fn = true, hsl_fn = true }, -- Enable CSS rgb() and hsl() functions
                html = { names = false }, -- Disable named colors in HTML
            }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes (with alpha)
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features
                css_fn = true,   -- Enable all CSS *functions*
                names = true,    -- "Name" codes like Blue
            })
        end,
    }
}
