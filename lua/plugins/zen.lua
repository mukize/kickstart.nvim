return {
  "folke/zen-mode.nvim",
  init = function()
    vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>")
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      width = .85,
      height = .95,
      options = {
        number = false,
        relativenumber = false,
        signcolumn = 'no'
      }
    },
  }
}
