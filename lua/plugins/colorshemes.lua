local function telescopeHightlights(hl, c)
  local prompt = '#2d3149'
  hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
  hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopePromptNormal = { bg = prompt }
  hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
  hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
  hl.SpellBad = { fg = c.red, underline = true }
end

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      transparent = true,
      on_highlights = telescopeHightlights,
      plugins = { markdown = true },
      styles = {
        sidebars = "transparent",
        -- floats = 'normal',
        floats = "transparent",
      },
      cache = false,
    },
    init = function()
      vim.cmd.colorscheme 'tokyonight-storm'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      show_end_of_buffer = true
    }
  }
}
