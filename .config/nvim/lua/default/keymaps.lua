local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
            
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "



-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Functions

-- common binding for <C-l>, :nohl if highlights exist, else :BufferLineCycleNext
local function nohl_or_bufferCycleNext()
    if vim.v.hlsearch == 1 then
        vim.cmd("nohl")
    else
        vim.cmd("BufferLineCycleNext")
    end
end

local function smart_nvim_tree_toggle()
    local view = require("nvim-tree.view")
    if view.is_visible() then
        vim.cmd("NvimTreeFocus")
    else
        vim.cmd("NvimTreeToggle")
    end
end

-- Normal --
-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

---- Resize with arrows
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

---- Navigate buffers
vim.keymap.set("n", "<C-l>", nohl_or_bufferCycleNext) -- not working
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

--Open new dashboard
vim.keymap.set("n", "<leader>bh", ":enew <Bar> :Dashboard<CR>")


---- Insert --
---- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

vim.keymap.set("i", "<C-ENTER>", "<C-o>o")
vim.keymap.set("i", "<C-;>", "<C-o>A")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
---- Move text up and down
keymap("v", "p", '"_dP', opts)

--CMD
-- FIX: not working
vim.api.nvim_create_user_command("Soc", "source ~/.config/nvim/init.lua", {})


-- Coding
-- tagbar

vim.keymap.set({"n", "i"}, "<F8>", "<cmd>TagbarToggle<CR>")

--undo tree

vim.keymap.set('n', '<F9>', vim.cmd.UndotreeToggle)

