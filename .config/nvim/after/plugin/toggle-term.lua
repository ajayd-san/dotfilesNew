local status, terminal = pcall(require, 'toggleterm')

if not status then
    return
end

terminal.setup {
    open_mapping = [[<c-\>]]
}

local terminal = require("toggleterm.terminal").Terminal
local cargo_check = terminal:new({ cmd = "cargo check", direction = "float", close_on_exit = false,
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })

    end })

function _CARGO_CHECK_TERM_TOGGLE()
    vim.cmd("w")
    cargo_check:toggle()
end

local cargo_run = terminal:new({ cmd = "cargo run", direction = "float", close_on_exit = false,
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })

    end })

function _CARGO_RUN_TERM_TOGGLE()
    vim.cmd("w")
    cargo_run:toggle()
end

local cargo_test = terminal:new({ cmd = "cargo test", direction = "float", close_on_exit = false,
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })

    end })

function _CARGO_TEST_TERM_TOGGLE()
    vim.cmd("w")
    cargo_test:toggle()
end
