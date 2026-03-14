return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      -- Set header
      dashboard.section.header.val = {
        '                                                                        ',
        '                                                                        ',
        '      ▄▄▄▄███▄▄▄▄      ▄████████ ▄██   ▄      ▄████████     ███     ',
        '    ▄██▀▀▀███▀▀▀██▄   ███    ███ ███   ██▄   ███    ███ ▀█████████▄ ',
        '    ███   ███   ███   ███    ███ ███▄▄▄███   ███    ███   ▀███▀▀██ ',
        '    ███   ███   ███   ███    ███ ▀▀▀▀▀▀███   ███    ███    ███   ▀ ',
        '    ███   ███   ███ ▀███████████ ▄██   ███ ▀███████████    ███     ',
        '    ███   ███   ███   ███    ███ ███   ███   ███    ███    ███      ',
        '    ███   ███   ███   ███    ███ ███   ███   ███    ███    ███     ',
        '     ▀█   ███   █▀    ███    █▀   ▀█████▀    ███    █▀    ▄████▀    ',
        '                                                                        ',
        '                                                                        ',
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('g', '  Find text', ':Telescope live_grep<CR>'),
        dashboard.button('s', '  Settings', ':e ~/.config/nvim/lua/config/settings.lua<CR>'),
        dashboard.button('t', '  Theme', ':Telescope colorscheme<CR>'),
        dashboard.button('l', '  Lazy', ':Lazy<CR>'),
        dashboard.button('m', '  Mason', ':Mason<CR>'),
        dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
      }

      -- Load quotes from separate file
      local quotes_module = require('config.quotes')

      -- Wrap text to multiple lines
      local function wrap_text(text, max_width)
        local lines = {}
        local line = ""
        for word in text:gmatch("%S+") do
          if #line + #word + 1 > max_width then
            table.insert(lines, line)
            line = word
          else
            if #line > 0 then
              line = line .. " " .. word
            else
              line = word
            end
          end
        end
        if #line > 0 then
          table.insert(lines, line)
        end
        return lines
      end

      -- Get stats and quote
      local stats = require('lazy').stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local random_quote = quotes_module.get_random_quote()
      local max_width = 60
      local quote_lines = wrap_text(random_quote[1], max_width)

      -- Stats footer (first)
      dashboard.section.footer.val = {
        '  ' .. stats.loaded .. '/' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms',
      }

      -- Quote footer (second)
      local quote_val = { '' }
      for i, line in ipairs(quote_lines) do
        if i == 1 then
          table.insert(quote_val, '  "' .. line)
        elseif i == #quote_lines then
          table.insert(quote_val, '   ' .. line .. '"')
        else
          table.insert(quote_val, '   ' .. line)
        end
      end
      table.insert(quote_val, '  — ' .. random_quote[2])

      dashboard.section.footer2 = {
        type = "text",
        val = quote_val,
        opts = {
          hl = "AlphaQuote",
          position = "center",
        },
      }

      -- Set highlight groups
      dashboard.section.header.opts.hl = 'AlphaHeader'
      dashboard.section.buttons.opts.hl = 'AlphaButtons'
      dashboard.section.footer.opts.hl = 'AlphaStats'

      vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#89b4fa' })
      vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#cdd6f4' })
      vim.api.nvim_set_hl(0, 'AlphaStats', { fg = '#6c7086' })
      vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#a6adc8' })

      -- Custom layout with both footers
      alpha.setup({
        layout = {
          { type = "padding", val = 2 },
          dashboard.section.header,
          { type = "padding", val = 2 },
          dashboard.section.buttons,
          { type = "padding", val = 2 },
          dashboard.section.footer,
          dashboard.section.footer2,
        },
        opts = {
          margin = 5,
          setup = function()
            vim.cmd([[
              autocmd FileType alpha setlocal nofoldenable
            ]])
          end,
        },
      })
    end,
  }
}
