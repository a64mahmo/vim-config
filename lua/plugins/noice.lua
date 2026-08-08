return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        stages = 'fade',
        timeout = 3000,
        render = 'compact',
        -- Explicit colour: notify cannot infer one while the buffer bg is transparent
        background_colour = '#1C1B1A', -- flexoki moon "surface"
        max_width = 60,
        fps = 60,
      },
    },
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
      -- fidget.nvim already renders LSP progress (see lsp.lua); avoid doubling up
      progress = { enabled = false },
    },
    presets = {
      bottom_search = true, -- classic bottom cmdline for / and ?
      command_palette = true, -- cmdline and popupmenu together, centered
      long_message_to_split = true,
      lsp_doc_border = true, -- bordered hover and signature help
    },
    routes = {
      -- Route routine "written"/"lines yanked" noise to the mini view
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d+ lines yanked' },
          },
        },
        view = 'mini',
      },
      -- written-file messages are pure noise
      { filter = { event = 'msg_show', kind = '', find = 'written' }, opts = { skip = true } },
    },
  },
}
