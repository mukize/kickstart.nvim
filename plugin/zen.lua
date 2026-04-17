vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }

require('zen-mode').setup {
  window = {
    width = 0.85,
    height = 0.95,
    options = {
      number = false,
      relativenumber = false,
      signcolumn = 'no',
    },
  },
}

vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<cr>')
