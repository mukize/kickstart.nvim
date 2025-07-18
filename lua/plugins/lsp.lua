return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'mfussenegger/nvim-jdtls',
    'stevearc/dressing.nvim',
    { 'j-hui/fidget.nvim',       opts = { notification = { window = { winblend = 0 } } } },
    { 'folke/lazydev.nvim',      opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc .. ' (LSP)' })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ss', require('telescope.builtin').lsp_document_symbols, '[S]earch: [S]ymbols')
        map('<leader>sw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]earch: [W]orkspace Symbols')

        map('<leader>cr', vim.lsp.buf.rename, '[C]ode: [R]ename')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,
          { buffer = event.buf, desc = '[C]ode: [A]ctions (LSP)' })
        -- highlight references under cursor (and remove when moving off)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
        -- The following autocommand is used to enable inlay hints in your code
        -- if the language server you are using supports them
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local server_configs = {
      lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
      -- jdtls = false,
      omnisharp = { cmd = { vim.fn.stdpath('data') .. '/mason/bin/omnisharp' } },
      phpactor = {
        init_options = {
          ["language_server_phpstan.enabled"] = true,
        }
      },
      jdtls = false
    }

    require('mason').setup()
    require('mason-lspconfig').setup({
      automatic_enable = true,
      ensure_installed = {},
      handlers = {
        function(server_name)
          if server_configs[server_name] == false then
            return
          end
          local server = server_configs[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      }
    })
    require('lspconfig').gleam.setup({ capabilities = capabilities })
    require('lspconfig').sourcekit.setup { capabilities = capabilities }
  end,
}
