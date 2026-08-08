return {
  {
    'nuvic/flexoki-nvim',
    name = 'flexoki',
    lazy = false,
    priority = 1000,
    opts = {
      variant = 'moon', -- "moon" is flexoki's dark variant ("dawn" is light)
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
      styles = {
        bold = true,
        italic = true,
        transparency = false, -- transparent.nvim handles this, see transparent.lua
      },
      -- This theme is a rose-pine fork and its `surface`/`_nc` are still
      -- rose-pine's purple-tinted values. Snap them to the real flexoki
      -- warm-neutral dark scale (900 / 850).
      palette = {
        moon = {
          surface = '#1C1B1A',
          overlay = '#282726',
          _nc = '#1C1B1A',
        },
      },
      highlight_groups = {
        -- Floats stay opaque so popups read as panels against the terminal
        NormalFloat = { bg = 'surface' },
        FloatBorder = { fg = 'muted', bg = 'surface' },
        FloatTitle = { fg = 'text', bg = 'surface', bold = true },

        -- Keep these readable while the buffer background is transparent
        CursorLine = { bg = 'highlight_low' },
        CursorLineNr = { fg = 'orange_two', bold = true },
        LineNr = { fg = 'muted' },
        Visual = { bg = 'highlight_med' },
        ColorColumn = { bg = 'surface' },
        WinSeparator = { fg = 'overlay' },

        Comment = { fg = 'subtle', italic = true },
        -- styles.italic is the master switch; keywords stay upright by choice
        Keyword = { italic = false },
        ['@keyword'] = { italic = false },
        Statement = { italic = false },
        Conditional = { italic = false },
        Repeat = { italic = false },

        -- Telescope: opaque panels with a distinct prompt row
        TelescopeNormal = { bg = 'surface' },
        TelescopeBorder = { fg = 'overlay', bg = 'surface' },
        TelescopeTitle = { fg = 'text', bg = 'overlay', bold = true },
        TelescopePromptNormal = { bg = 'overlay' },
        TelescopePromptBorder = { fg = 'overlay', bg = 'overlay' },
        TelescopePromptTitle = { fg = '#100F0F', bg = 'purple_two', bold = true },
        TelescopeSelection = { bg = 'highlight_med' },

        -- Popup menu (blink.cmp / native)
        Pmenu = { bg = 'surface' },
        PmenuSel = { bg = 'highlight_med', bold = true },
        PmenuSbar = { bg = 'surface' },
        PmenuThumb = { bg = 'overlay' },
      },
    },
    config = function(_, opts)
      require('flexoki').setup(opts)
      vim.cmd.colorscheme 'flexoki'
    end,
  },
}
