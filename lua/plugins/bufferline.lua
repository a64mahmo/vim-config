return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'ordinal',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, _, _, _)
          return '(' .. count .. ')'
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    }
  end,
}
