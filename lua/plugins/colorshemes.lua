return {
  'folke/tokyonight.nvim',
  priority = 1000,
  opts = {
    transparent = true,
    floats = 'normal',
    on_highlights = function(hl, c)
      local prompt = '#2d3149'
      hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
      hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
      hl.TelescopePromptNormal = { bg = prompt }
      hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
      hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
      hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
      hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      hl.SpellBad = { fg = c.red, underline = true }
    end,
    plugins = { markdown = true },
  },
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
  end,
}
