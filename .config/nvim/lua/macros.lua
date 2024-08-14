-- Whitespace macro
vim.opt.listchars = {
    tab = '>-',
    trail = '.',
    extends = '#',
    nbsp = '.',
    space = '_'
}

-- Map Ctrl-y to copy to system clipboard in visual mode
vim.keymap.set('x', '<C-y>', '"+y', { noremap = true })

-- Map Alt-Backspace to Backward Kill Word
vim.keymap.set('i', '<A-BS>', '<C-w>', { noremap = true })

-- Map Ctrl-Backspace to delete previous word
-- vim.api.nvim_set_keymap('', '<C-?>', '<C-W>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

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
vim.keymap.set('i', '<F6>', '<C-o>:lua toggle_expandtab()<CR>', { noremap = true, silent = false })

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
vim.keymap.set('n', '<F5>', ':set list!<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<F5>', '<C-o>:set list!<CR>', { noremap = true, silent = true })
vim.keymap.set('c', '<F5>', '<C-c>:set list!<CR>', { noremap = true, silent = true })

-- Toggle Comments
vim.keymap.set('n', '<C-_>', ':CommentToggle<CR>', { noremap = true, silent = true})
vim.keymap.set('v', '<C-_>', ':\'<,\'>CommentToggle<CR>', { noremap = true, silent = true})


