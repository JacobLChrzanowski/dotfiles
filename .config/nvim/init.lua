-- NeoVim Initialization
vim.g.mapleader = " "
math.randomseed(os.time())
-- Debug
require("local_debug")
-- general configurations
require("options")
-- load plugins
require ("plugins")
-- Notify
vim.notify = require("notify")
-- load macros
require ("macros")

-- Greeter ('hello, <name>!')
require("greeter")

-- commands
-- vim.cmd("source ~/.config/nvim/viml/commands.vim")

-- Colors
-- vim.cmd("packadd colors/kanagawa.nvim")
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     transparent = false,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     colors = {                   -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     },
--     overrides = function(colors) -- add/modify highlights
--         return {}
--     end,
--     theme = "wave",              -- Load "wave" theme when 'background' option is not set
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })

-- vim.cmd([[
-- " Color
-- colorscheme kanagawa-wave
-- syntax on
-- ]])


-- Debug
nvimide.log("Leave " .. nvimide.script_path())
