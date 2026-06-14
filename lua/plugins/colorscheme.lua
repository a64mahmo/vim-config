return {
  'folke/tokyonight.nvim',
  priority = 1000,
  opts = {
    style = 'night',
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = 'transparent',
      floats = 'transparent',
    },
    on_highlights = function(hl, c)
      hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
      hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
      hl.TelescopePromptNormal = { bg = c.bg_dark }
      hl.TelescopePromptBorder = { bg = c.bg_dark, fg = c.bg_dark }
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
