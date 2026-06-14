-- .NET Development: Roslyn LSP (C#) + Razor/Blazor support

-- Register Razor filetypes before the plugin loads
vim.filetype.add {
  extension = {
    razor = 'razor',
    cshtml = 'razor',
  },
}

return {
  -- Roslyn LSP (same C# engine as Visual Studio / VS Code)
  -- Native Razor/CSHTML support via cohosting (no rzls.nvim needed)
  {
    'seblyng/roslyn.nvim',
    ft = { 'cs', 'razor' },
    opts = {
      filewatching = true,
    },
    config = function(_, opts)
      require('roslyn').setup(opts)

      vim.lsp.config('roslyn', {
        settings = {
          ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ['csharp|completion'] = {
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
        },
      })
    end,
  },

  -- Easy .NET: build, run, test, NuGet, Entity Framework, user secrets
  {
    'GustavEikaas/easy-dotnet.nvim',
    ft = { 'cs', 'razor', 'fsharp', 'vb' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      { '<leader>nr', '<cmd>lua require("easy-dotnet").run_default()<cr>', desc = '.NET [R]un' },
      { '<leader>nb', '<cmd>lua require("easy-dotnet").build_default()<cr>', desc = '.NET [B]uild' },
      { '<leader>nt', '<cmd>lua require("easy-dotnet").test_default()<cr>', desc = '.NET [T]est' },
      { '<leader>nc', '<cmd>lua require("easy-dotnet").clean()<cr>', desc = '.NET [C]lean' },
      { '<leader>np', '<cmd>lua require("easy-dotnet").restore()<cr>', desc = '.NET Restore [P]ackages' },
      { '<leader>nn', '<cmd>lua require("easy-dotnet").nuget()<cr>', desc = '.NET [N]uGet' },
    },
  },
}
