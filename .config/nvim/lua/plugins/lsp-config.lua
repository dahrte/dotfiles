return {
  {
    'williamboman/mason.nvim',
    config = function()
       require'mason'.setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require'mason-lspconfig'.setup({
        ensure_installed = { 'astro', 'css_variables', 'tailwindcss', 'html', 'biome', 'lua_ls', 'ts_ls', 'volar' }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require'cmp_nvim_lsp'.default_capabilities()

      require'lspconfig'.astro.setup{
        capabilities = capabilities
      }
      require'lspconfig'.biome.setup{
        capabilities = capabilities
      }
      require'lspconfig'.css_variables.setup{
        capabilities = capabilities
      }
      require'lspconfig'.lua_ls.setup{
        capabilities = capabilities
      }
      require'lspconfig'.html.setup{
        capabilities = capabilities
      }
      require'lspconfig'.tailwindcss.setup{
        capabilities = capabilities
      }
      require'lspconfig'.ts_ls.setup{
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = '/home/robdins/.bun/install/global/node_modules/@vue/typescript-plugin',
              languages = { 'javascript', 'typescript', 'vue' },
            },
          },
        },
        filetypes = {
          'javascript',
          'typescript',
          'vue',
        },
      }
      require'lspconfig'.volar.setup{
        capabilities = capabilities,
        init_options = {
          typescript = {
            tsdk = '/home/robdins/.bun/install/global/node_modules/typescript/lib'
          }
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
      }

      --Bindings
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
