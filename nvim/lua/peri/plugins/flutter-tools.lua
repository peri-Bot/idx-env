return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require('flutter-tools').setup {
      flutter_path = '/home/peribot/Downloads/flutter/bin/flutter',
      debugger = {
        -- make these two params true to enable debug mode
        enabled = false,
        run_via_dap = false,
        register_configurations = function(_)
          require('dap').adapters.dart = {
            type = 'executable',
            command = vim.fn.stdpath 'data' .. '/mason/bin/dart-debug-adapter',
            args = { 'flutter' },
          }

          require('dap').configurations.dart = {
            {
              type = 'dart',
              request = 'launch',
              name = 'Launch flutter',
              dartSdkPath = 'home/Downloads/flutter/bin/cache/dart-sdk/',
              flutterSdkPath = 'home/Downloads/flutter',
              program = '${workspaceFolder}/lib/main.dart',
              cwd = '${workspaceFolder}',
            },
          }
          -- uncomment below line if you've launch.json file already in your vscode setup
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
    }
  end,
}
