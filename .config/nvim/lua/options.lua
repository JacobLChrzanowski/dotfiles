local g = vim.g
local o = vim.o
local opt = vim.opt
local fn = vim.fn

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- vim.g.FloatBorders = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
vim.g.FloatBorders = "rounded"

opt.clipboard:append("unnamedplus")
-- Set tab size to 4 spaces
opt.tabstop = 4
-- Set indentation width to 4 spaces
opt.shiftwidth = 4
-- Use spaces for indentation
opt.expandtab = true
-- Enable auto-indentation
opt.autoindent = true
-- Enable smart indentation
opt.smartindent = true
-- Disable compatibility with vi
opt.compatible = false

-- Enable line numbers
vim.opt.number = true
-- Show the mode in the status line
vim.opt.showmode = true
-- Highlight matching parenthesis
vim.opt.showmatch = true
-- Enable auto-completion menu after pressing TAB
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

vim.opt.termguicolors = true

-- Mouse
-- -- Scroll Speed
opt.mousescroll = "ver:1,hor:1"

--[[
vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {}
}
--]]

--[[
vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste  = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}
--]]
