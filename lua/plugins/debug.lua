return {
  -- DAP core
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'NicholasMata/nvim-dap-cs', -- C# DAP helper
    },
    keys = {
      { '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>', desc = 'Debug: Toggle [B]reakpoint' },
      { '<leader>dc', '<cmd>lua require("dap").continue()<cr>', desc = 'Debug: [C]ontinue' },
      { '<leader>di', '<cmd>lua require("dap").step_into()<cr>', desc = 'Debug: Step [I]nto' },
      { '<leader>do', '<cmd>lua require("dap").step_over()<cr>', desc = 'Debug: Step [O]ver' },
      { '<leader>dO', '<cmd>lua require("dap").step_out()<cr>', desc = 'Debug: Step Out' },
      { '<leader>dr', '<cmd>lua require("dap").restart()<cr>', desc = 'Debug: [R]estart' },
      { '<leader>dt', '<cmd>lua require("dap").terminate()<cr>', desc = 'Debug: [T]erminate' },
      { '<leader>du', '<cmd>lua require("dapui").toggle()<cr>', desc = 'Debug: Toggle [U]I' },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- C# / .NET debugging via netcoredbg
      require('dap-cs').setup()

      -- Breakpoint icons
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStopped', numhl = '' })
    end,
  },
}
