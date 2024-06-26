return {
  'xiyaowong/transparent.nvim',
  opt = {
    exclude_groups = { 'Pmenu' },
  },
  init = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>TransparentToggle<cr>', { desc = '[T]oggle [T]ransparency' })
  end,
}
