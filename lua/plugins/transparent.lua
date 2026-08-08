return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  priority = 1001, -- must register its ColorScheme autocmd before the theme applies
  config = function()
    require('transparent').setup {
      -- Groups cleared to let the terminal background through.
      -- Deliberately omits CursorLine/StatusLine/floats so those stay visible.
      groups = {
        'Normal',
        'NormalNC',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        'EndOfBuffer',
      },
      extra_groups = {
        'NeoTreeNormal',
        'NeoTreeNormalNC',
        'NeoTreeEndOfBuffer',
        'BufferLineFill',
      },
      -- Never strip these: popups must stay opaque to be readable
      exclude_groups = {
        'NormalFloat',
        'FloatBorder',
        'FloatTitle',
        'CursorLine',
        'CursorLineNr',
        'StatusLine',
        'StatusLineNC',
        'Pmenu',
        'PmenuSel',
        'TelescopeNormal',
        'TelescopeBorder',
        'TelescopePromptNormal',
        'TelescopePromptBorder',
        'NotifyBackground',
      },
    }
  end,
}
