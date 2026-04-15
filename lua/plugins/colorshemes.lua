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
      styles = {
        sidebars = "transparent",
        -- floats = 'normal',
        floats = "transparent",
      },
      cache = false,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
      -- vim.cmd.colorscheme 'tokyonight-storm'
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
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
          ["@property"] = { fg = colors.sky },
          ["@markup.italic"] = { fg = colors.flamingo }
        }
      end
    }
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    }
  }
}
