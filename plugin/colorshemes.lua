vim.pack.add {
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catpuccin',
  },
}

require('catppuccin').setup {
  transparent_background = true,
  show_end_of_buffer = true,
  float = {
    transparent = true,
    solid = true, -- use solid styling for floating windows, see |winborder|
  },
  auto_integrations = true,
  custom_highlights = function(colors)
    return {
      -- Comment = { fg = colors.flamingo },
      -- TabLineSel = { bg = colors.pink },
      -- CmpBorder = { fg = colors.surface2 },
      -- Pmenu = { bg = colors.none },
      ['@property'] = { fg = colors.sky },
      ['@markup.italic'] = { fg = colors.flamingo },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin-macchiato'
