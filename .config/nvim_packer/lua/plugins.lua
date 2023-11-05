-- 插件管理：packer.nvim --

-- This file can be loaded by calling `lua require('plugins')` from your init.vim -- 已经转init.lua
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Package manager

  -- LSP 语言服务插件 补全
  use {
    "williamboman/mason.nvim", -- LSP服务安装和管理
    --"williamboman/mason-lspconfig.nvim", -- 依赖nvim-lspconfig??? 感觉没啥用啊...
    "neovim/nvim-lspconfig", -- Configurations for Nvim LSP
  }
  -- 自动补全,片段 插件
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin -- 推荐的自动补全插件
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source(源) for nvim-cmp -- nvim内置补全
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- java 补全插件 -- 比mason的jdtls功能更全,主要是mason下载jdtls慢到地球爆炸...
  --use 'mfussenegger/nvim-jdtls' -- 有点麻烦,暂时不安装了
  -- nvimp-autopairs 自动补全插件
  use {	"windwp/nvim-autopairs" }

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
       run = function()
           local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
           ts_update()
       end,
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- alpha-nvim
  --use 'goolord/alpha-nvim'

  -- dashboard-nvim
  use { 'glepnir/dashboard-nvim',}

  -- symbols-outline 
  use 'simrat39/symbols-outline.nvim'

  -- nvim-telescopt
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- 顶部标签 管理nvim的buffer
  --
  --use 'nvim-tree/nvim-web-devicons' -- 安装nvim-tree时已安装过
  --use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
  --
  -- bufferline.nvim
  use {'akinsho/bufferline.nvim', tag = "v3.*"}

  -- lualine.nvim 底部状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- colorscheme
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }

  -- 终端
  -- 官方文档
  --use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --  require("toggleterm").setup()
  --end}
  -- 自己改的
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- nvim-notify
  use 'rcarriga/nvim-notify'

end)

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]













