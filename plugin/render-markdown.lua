vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/vim-mini/mini.nvim',

  'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/yousefhadder/markdown-plus.nvim',
}

require('markdown-plus').setup {}

require('render-markdown').setup {
  win_options = { conceallevel = { rendered = 3 } },
  render_modes = true,
  link = {
    enabled = true,
    render_modes = false,
  },
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
  code = {
    style = 'none',
    sign = false,
  },
}
