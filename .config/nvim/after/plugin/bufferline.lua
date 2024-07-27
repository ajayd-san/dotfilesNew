local status, buffline = pcall(require, "bufferline")

if not status then
    return
end

buffline.setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },

    }
}
