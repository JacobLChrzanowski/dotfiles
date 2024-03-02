-- Whitespace macro
vim.opt.listchars = {
    tab = '>-',
    trail = '.',
    extends = '#',
    nbsp = '.',
    space = '_'
}

-- Map Ctrl-y to copy to system clipboard in visual mode
vim.api.nvim_set_keymap('x', '<C-y>', '"+y', { noremap = true })

-- Map Ctrl-Backspace to delete previous word
-- vim.api.nvim_set_keymap('', '<C-?>', '<C-W>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Something else to do with expanding tabbing
function toggle_expandtab()
    if vim.bo.expandtab then
        vim.bo.expandtab = false
        vim.notify("expandtab: OFF")
    else
        vim.bo.expandtab = true
        vim.notify("expandtab: ON")
    end
    print(vim.bo.expandtab)
end

vim.bo.expandtab = true
vim.api.nvim_set_keymap('i', '<F6>', '<C-o>:lua toggle_expandtab()<CR>', { noremap = true, silent = false })

-- Show diff from original file
function show_diff()
    vim.cmd("w !diff % -")
end
-- Define command to call ShowDiff function
vim.cmd("command! -nargs=0 Showdiff lua show_diff()")

-- Set listchars to display special characters
vim.opt.listchars = {
    eol = "$",
    tab = ">-",
    trail = "~",
    extends = ">",
    precedes = "<",
    space = "_",
}
-- Toggle list mode with F5 key
vim.api.nvim_set_keymap('n', '<F5>', ':set list!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F5>', '<C-o>:set list!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<F5>', '<C-c>:set list!<CR>', { noremap = true, silent = true })

