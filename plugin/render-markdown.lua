vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/vim-mini/mini.nvim',

  'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}

require('render-markdown').setup {
  render_modes = true,
  heading = {
    enabled = false,
    -- width = "block",
    -- min_width = 30,
    backgrounds = { 'NONE' },
  },
  bullet = {
    icons = { '●', '○', '◆', '◇' },
    right_pad = 1,
  },
}
