vim.pack.add {
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/mfussenegger/nvim-jdtls',
  'https://github.com/stevearc/dressing.nvim',
  'https://github.com/j-hui/fidget.nvim',

  'https://github.com/folke/lazydev.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}

require('fidget').setup { notification = { window = { winblend = 0 } } }
require('lazydev').setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[C]ode: [R]ename' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode: [A]ctions (LSP)' })
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
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = '[T]oggle Inlay [H]ints' })
    end
  end,
})

local server_configs = {
  lua_ls = { cmd = { 'lua-language-server' }, settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
  omnisharp = { cmd = { vim.fn.stdpath 'data' .. '/mason/bin/omnisharp' } },
  phpactor = { init_options = { ['language_server_phpstan.enabled'] = true } },
  clangd = {},
  marksman = { env = { DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = '1' } },
  -- hls = { cmd = { 'haskell-language-server-wrapper', '--lsp' } },
}

for server_name, server_config in pairs(server_configs) do
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

vim.lsp.enable 'tinymist'

require('mason').setup()
require('mason-lspconfig').setup { automatic_enable = true }
-- require('mason-nvim-dap').setup()
