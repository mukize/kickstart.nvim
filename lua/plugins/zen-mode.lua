return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        options = {
          signcolumn = "no",      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false,     -- disable cursorline
        }
      },
    })
    vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "[T]oggle [Z]enmode" })
  end
}
