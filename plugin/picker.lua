vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }

require('mini.pick').setup {}
require('mini.extra').setup {}

local epick = require 'mini.extra'
local pick = require 'mini.pick'

vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = '[S]earch: [G]rep' })
vim.keymap.set('n', '<leader>sb', pick.builtin.buffers, { desc = '[S]earch: [B]uffers' })
vim.keymap.set('n', '<leader><leader>', pick.builtin.files, { desc = 'Find Files' })

local epick_lsp = function(scope)
  return function()
    epick.pickers.lsp { scope = scope }
  end
end
vim.keymap.set('n', 'gd', function()
  epick.pickers.lsp { scope = 'definition' }
end, { desc = '[G]oto [D]efinition' })
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
vim.keymap.set('n', 'gr', epick_lsp 'references', { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', 'gI', epick_lsp 'implementation', { desc = '[G]oto [I]mplementation' })
vim.keymap.set('n', '<leader>D', epick_lsp 'type_definition', { desc = 'Type [D]efinition' })
vim.keymap.set('n', '<leader>ss', epick_lsp 'document_symbol', { desc = '[S]earch: [S]ymbols' })
vim.keymap.set('n', '<leader>sw', epick_lsp 'workspace_symbol', { desc = '[S]earch: [W]orkspace Symbols' })
vim.keymap.set('n', 'gD', epick_lsp 'declaration', { desc = '[G]oto [D]eclaration' })
