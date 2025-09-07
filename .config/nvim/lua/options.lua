local g = vim.g
local o = vim.o
local opt = vim.opt
local fn = vim.fn

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- vim.g.FloatBorders = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
vim.g.FloatBorders = "rounded"

opt.clipboard:append("unnamedplus")
-- Tabstops and Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
---- Use spaces for indentation
opt.expandtab = true
---- Disable compatibility with vi
opt.compatible = false

-- UI Changes
----Line numbers
vim.opt.number = true
---- Show the mode in the status line
vim.opt.showmode = true
---- Highlight matching parenthesis
vim.opt.showmatch = true
---- Enable auto-completion menu after pressing TAB
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
---- 24-bit RGB color
vim.opt.termguicolors = true

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
