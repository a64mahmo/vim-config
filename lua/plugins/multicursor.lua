return {
  'mg979/vim-visual-multi',
  branch = 'master',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '<C-n>',
      ['Find Subword Under'] = '<C-n>',
      ['Add Cursor Down'] = '<C-Down>',
      ['Add Cursor Up'] = '<C-Up>',
      ['Select All'] = '<leader>ma',
      ['Start Regex Search'] = '<leader>mr',
      ['Visual All'] = '<leader>mA',
      ['Visual Regex'] = '<leader>mR',
      ['Visual Add'] = '\\',
      ['Switch Mode'] = 'v',
      ['Exit'] = '<Esc>',
      ['Select Cursor Down'] = '<M-Down>',
      ['Select Cursor Up'] = '<M-Up>',
      ['Remove Region'] = 'q',
      ['Remove All Regions'] = 'Q',
      ['Toggle Region'] = '<C-p>',
    }
  end,
}
