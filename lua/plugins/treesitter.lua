return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter').setup({
      auto_install = true,
      ensure_installed = {
        'bash', -- noice uses these two to highlight the cmdline
        'regex',
        'c',
        'c_sharp',
        'css',
        'html',
        'javascript',
        'lua',
        'markdown',
        'markdown_inline',
        'query',
        'razor',
        'vim',
        'vimdoc',
      },
      install_dir = vim.fn.stdpath('data') .. '/site',
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['as'] = '@statement.outer',
            ['is'] = '@statement.inner',
            ['a/'] = '@comment.outer',
            ['i/'] = '@comment.inner',
            ['am'] = '@call.outer',
            ['im'] = '@call.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.outer',
          },
        },
      },
    })
  end,
}
