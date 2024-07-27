local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- empty setup using defaults
nvim_tree.setup({
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
    filters = { custom = { "^.git$" } }
})
