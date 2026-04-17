vim.pack.add {
  'https://github.com/folke/which-key.nvim',
}

require('which-key').setup {}
require('which-key').add {
  { '<leader>c', group = 'Code' },
  { '<leader>g', group = 'Git' },
  { '<leader>h', group = 'Harpoon' },
  { '<leader>s', group = 'Search' },
  { '<leader>t', group = 'Toggle' },
  { '<leader>w', group = 'Workspaces' },
}
