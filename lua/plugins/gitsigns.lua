return {
  'lewis6991/gitsigns.nvim',
  opts = {
    keymaps = {
      ['<leader>gh'] = '<cmd> Gitsigns preview_hunk <cr>',
    },
  },
  config = function()
    local gitsigns = require 'gitsigns'
    gitsigns.setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      numhl = false,
    }
    vim.keymap.set('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<cr>', { desc = '[G]it: [H]unk [P]review' })
  end,
}
