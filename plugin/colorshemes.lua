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
      ['@property'] = { fg = colors.sky },
      ['@markup.italic'] = { fg = colors.flamingo },
      ['yamlBlockString'] = { fg = colors.green },
      ['@tag'] = { fg = colors.maroon },
      -- ['@markup.heading'] = { fg = colors.text },
      ['@markup.link.label'] = { fg = colors.text },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin-macchiato'
