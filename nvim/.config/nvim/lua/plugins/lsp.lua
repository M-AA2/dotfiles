return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Map Mason package names to lspconfig server names
      local server_map = {
        ["lua-language-server"] = "lua_ls",
        ["bash-language-server"] = "bashls",
        ["pylsp"] = "pylsp",
        ["rust-analyzer"] = "rust_analyzer",
        ["docker-compose-langserver"] = "docker_compose_language_service",
        ["java-language-server"] = "java_language_server",
      }
      
      -- Setup servers that exist in lspconfig
      for mason_name, lsp_name in pairs(server_map) do
        if configs[lsp_name] then
          lspconfig[lsp_name].setup({
            capabilities = capabilities,
          })
        end
      end
      
      -- Keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
    end,
  },
}
