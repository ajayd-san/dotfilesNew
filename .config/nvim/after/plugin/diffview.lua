vim.keymap.set('n', '<leader>dv', function()
    if next(require('diffview.lib').views) == nil then
        vim.cmd('DiffviewOpen')
    else
        vim.cmd('DiffviewClose')
    end
end)

vim.keymap.set('n', '<leader>df', function()
    if next(require('diffview.lib').views) == nil then
        vim.cmd('DiffviewFileHistory')
    else
        vim.cmd('DiffviewClose')
    end
end)

