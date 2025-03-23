return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    {
      '<leader>st',
      '<cmd>TodoTelescope<cr>',
      mode = 'n',
      desc = '[T]elescope: [T]odos',
    },
  }
}
