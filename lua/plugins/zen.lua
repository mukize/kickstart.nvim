return {
  'folke/zen-mode.nvim',
  config = function()
    local zenmode = require 'zen-mode'
    zenmode.setup { window = { options = { number = false } } }
    vim.keymap.set('n', '<leader>tz', zenmode.toggle, { desc = '[T]oggle [Z]en-mode' })
  end,
}
