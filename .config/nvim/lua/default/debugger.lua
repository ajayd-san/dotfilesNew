local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dap.repl.close()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

local ui_config = {
  icons = { expanded = "🞃", collapsed = "🞂", current_frame = "→" },
  controls = {
    icons = {
      pause = "⏸",
      play = "⯈",
      step_into = "↴",
      step_over = "↷",
      step_out = "↑",
      step_back = "↶",
      run_last = "🗘",
      terminate = "🕱",
      disconnect = "⏻"
    }
  }
}

dapui.setup(ui_config)

require("nvim-dap-virtual-text").setup()
require('dap.ext.vscode').load_launchjs()

local dap_python = require('dap-python')
dap_python.setup('~/.virtualenv/debugpy/bin/python')

require('dap-go').setup()

vim.fn.sign_define('DapBreakpoint', { text = '👺', texthl = '', linehl = '', numhl = '' })

vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<M-k>", "<Cmd>lua require(\"dapui\").eval()<CR>", { noremap = true })
