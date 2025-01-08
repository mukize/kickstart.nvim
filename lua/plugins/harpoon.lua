return {
  'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  commit = 'e76cb03',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    ---@diagnostic disable-next-line: missing-parameter, missing-fields
    harpoon.setup({ settings = { sync_on_ui_close = true } })

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
      print("Added file to harpoon.")
    end, { desc = '[H]arpoon: [A]dd' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon: [L]ist' })

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(4)
    end)
  end,
}
