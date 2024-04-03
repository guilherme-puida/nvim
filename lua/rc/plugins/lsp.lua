return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'folke/neodev.nvim', config = true },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('rc_lsp_attach', { clear = true }),
        callback = function(event)
          local set = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'lsp: ' .. desc })
          end

          set('<leader>cr', vim.lsp.buf.rename, 'rename')
          set('<leader>ca', vim.lsp.buf.code_action, 'code action')
          set('<leader>cs', require('telescope.builtin').lsp_document_symbols, 'document symbols')
          set('<leader>cw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace symbols')

          set('gd', require('telescope.builtin').lsp_definitions, 'goto definition')
          set('gD', vim.lsp.buf.declaration, 'goto declaration')
          set('gr', require('telescope.builtin').lsp_references, 'goto references')
          set('gI', require('telescope.builtin').lsp_implementations, 'goto implementation')
          set('K', vim.lsp.buf.hover, 'show hover documentation')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local servers = {
        lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
        emmet_language_server = {},
        gopls = {},
      }

      local tools = {
        'stylua',
      }

      local ensure_installed = {}
      vim.list_extend(vim.tbl_keys(servers or {}), tools)

      require('mason').setup()
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end
        }
      }
    end,
  },
}
