return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    -- Append current file to the list
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon: Add File',
    },

    -- Toggle the visual menu
    {
      '<C-e>',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Harpoon: Toggle Menu',
    },

    -- Quick nav to slots 1-4 (matches home row directions or positions)
    {
      '<C-h>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon: File 1',
      {
        '<C-j>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Harpoon: File 2',
      },
      {
        '<C-k>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Harpoon: File 3',
      },
      {
        '<C-l>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Harpoon: File 4',
      },

      -- Toggle previous and next buffers from the list
      {
        '<C-S-P>',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'Harpoon: Prev File',
      },
      {
        '<C-S-N>',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'Harpoon: Next File',
      },
    },
  },
}
