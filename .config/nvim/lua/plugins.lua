local disabled_rtp_plugins = {
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    "gzip",
    "tutor",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}
-- nvimide.log(vim.fn.stdpath("data"))

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ----------------
    --  Required  --
    ----------------
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { "farmergreg/vim-lastplace" },
    { "rcarriga/nvim-notify",
      enabled = true;
      config = function()
        require('notify').setup({render = 'compact'})
      end,
    },
    { "rebelot/kanagawa.nvim",
      enabled = true;
      config = function()
        require('kanagawa').setup({
          compile = false,             -- enable compiling the colorscheme
          undercurl = true,            -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true},
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = false,         -- do not set background color
          dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
          terminalColors = true,       -- define vim.g.terminal_color_{0,17}
          colors = {                   -- add/modify theme and palette colors
              palette = {},
              theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
          },
          overrides = function(colors) -- add/modify highlights
              return {}
          end,
          theme = "wave",              -- Load "wave" theme when 'background' option is not set
          background = {               -- map the value of 'background' option to a theme
              dark = "wave",           -- try "dragon" !
              light = "lotus"
          },
        })

        vim.cmd("colorscheme kanagawa-wave")
      end,
    }
})