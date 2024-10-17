return {
  'xiyaowong/transparent.nvim',
  enabled = true,
  opt = {
    exclude_groups = { 'Pmenu', 'Underlined' },
  },
  init = function()
    vim.keymap.set('n', '<leader>tt', '<cmd>TransparentToggle<cr>', { desc = '[T]oggle [T]ransparency' })
  end,
}
