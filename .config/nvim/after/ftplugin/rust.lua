-- RUST
-- cargo check
vim.keymap.set({ "n", "i" }, "<F7>", "<CMD>lua _CARGO_CHECK_TERM_TOGGLE()<CR>")
vim.keymap.set({ "n", "i" }, "<F5>", "<CMD>lua _CARGO_RUN_TERM_TOGGLE()<CR>")
vim.keymap.set({ "n", "i" }, "<F6>", "<CMD>lua _CARGO_TEST_TERM_TOGGLE()<CR>")
