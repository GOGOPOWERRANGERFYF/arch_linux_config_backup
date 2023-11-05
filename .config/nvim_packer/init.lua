--- + 目前使用Packer.nvim插件管理器 --
require('plugins') -- 加载Packer.nvim配置模块

-- nvim notify插件设置成nvim默认notify功能
vim.notify = require("notify")

          -- + nvim配置(lua版本) --
-- vim.o vim.opt (全局配置option)
vim.o.encoding = 'UTF-8'
--vim.o.number = true
vim.o.relativenumber = true
vim.o.foldenable = true -- 折叠
--vim.o.syntax = on -- 开启文件类型侦测 会覆盖你的高亮设置?
vim.o.syntax = "enable" -- 开启文件类型侦测 不会覆盖你的高亮设置?
-- :nohl 关闭搜索高亮命令
vim.o.filetype = "on"
vim.o.termguicolors = true
--vim.o.background = "light"
vim.o.background = "dark"

-- eol:end of line \n; 
-- trail:跟踪,貌似是跟踪行尾多余的""空格""?
-- extends,precedes暂时不知道是啥...
--vim.opt.listchars= "tab:<▸>,space:⋅,eol:¬,trail:+,extends:❯,precedes:❮"
--提示,可通过:h listchars查看文档
vim.opt.listchars= "tab:<->,space:⋅,eol:¬,trail:+,extends:❯,precedes:❮"
vim.opt.wrap = true -- 设置折叠 折叠快捷键:z+c,z+o
vim.opt.showbreak= "↪" -- 貌似是代码行太长显示单句代码换行

-- + 缩进 --
-- 设置不可见字符显示
-- tab符:\t, 空格符:\s, 换行符:\n
-- tabstop: TAB符(\t)的宽度
-- shiftwidth：在一般模式(normal mode)和可视模式(visual mode)下的一个缩进的长度
-- softtabstop: 在插入模式(insert mode)下一个缩进的长度
-- expandtab：将TAB符(\t)转换成空格\s
-- 不同模式下的缩进操作:
-- 一般模式(normal mode): >>增加缩进，<<删除缩进，==自动对齐缩进
-- 可视模式(visual mode):  >增加缩进，< 删除缩进，= 自动对齐缩进
-- 插入模式(insert mode): <TAB>键增加缩进， 退格键<Backspace>删除缩进;还有Ctrl-t和Ctrl-d
--vim.opt.listchars = "tab:<->,space:⋅,eol:¬" -- 设置不可见字符要显示成为的字符
vim.opt.list = true
-- :set list    显示命令
-- :set nolist  关闭显示命令
vim.o.tabstop = 8 -- 设置\t长度(默认8,不要设置超过,否则会出现排版错误)
vim.o.softtabstop = 4 --设置插入模式时插入的\t长度
vim.o.shiftwidth = 4 --设置正常模式和可见模式时的\t长度
-- expandtab为true,\t被替换为\t长度的\s空格数
-- 该设置下,要输入<TAB>,在插入模式下ctrl+v,使用"可见"识别<tab>
vim.o.expandtab = true
-- noexpandtab为true,\t不扩展为\t长度相应个数的\s
--vim.o.noexpandtab = true

-- 这个先别管...
--vim.o.smarttab = true

-- + 缩进[代码规范] --
-- 不同语言的规范并不一致.
-- C语言在Linux Kernel中：
--  tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
--
-- 新一行复制前一行缩进量
--vim.o.autoindent = true
--
-- 每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出花括号，当遇到右花括号}，
-- 则取消缩进形式。此外还增加了识别C语言关键字的功能。如果一行是以#开头的，
-- 那么这种格式将会被特殊对待而不采用缩进格式。
--vim.o.smartindent = true
--
-- 可以很好的识别C和Java等结构化程序设计语言,并且能用C语言的缩进格式来
-- 处理程序的缩进结构
vim.o.cindent = true


-- == + 加载lua配置模块 == --
--require('alpha-nvim-config')
require('dashboard-nvim-config')
require('colorscheme-gruvbox-config')
--require('colorscheme-nightfox-config')
--require('colorscheme-nvim-config')
require('lsp-nvim-lspconfig-config')
require('lsp-nvim-cmp-config')
require('nvim-treesitter-config')
require('nvim-tree-config')
require('nvim-telescope-config')
require('lualine-nvim-config')
require('symbols-outline-config')
require('bufferline-nvim-config')
--require('barbar-nvim-config')
require('toggleterm-config')
require('nvim-autopairs-config')
require('nvim-notify-config')
require('lsp-mason-config')

--- + 备忘录 ---
-- archlinux版本
-- pacman安装:
--  clang包为debian的clangd包
-- sudo npm -g 安装:
--  pyright 
-- mason自动安装:
--  lua-language-server
--  typescript-language-server (js也支持)
--
-- notify history window close:
--  命令 :q
--
-- + 备忘录 ---

--- + 备忘录 ---
-- wsl2 kali 版本
--语言服务安装方式:
--  1. apt安装
--  2. npm -g intall 安装
--  3. mason插件安装
--    sudo apt install clangd
--    剩下的除了mason安装的-->都是npm安装的
--    sudo npm -g install xxx
--    sudo npm -g list
--
--vim按键标识符:
--  <leader> 表示按键 \
--  <CR> 回车键
--  'a-z' A-Z按键
--- + 备忘录 ---

--- + 常用vim/nvim快捷键 ---
--  正常模式(normal mode)
--  插入模式(insert mode)
--  可视模式(visual mode)
--  命令模式(command mode)
--  <Esc>返回正常模式(有时需要按两下)
--  
--  可视模式:
--    v 字符选择
--    shift + v 行选择
--    ctrl + v 块选择
--
--  插入模式:
--    ctrl + v 
--    仅为个人理解:插入模式下可见,用于识别正常模式下不能识别的字符,
--    例如用于输入unicode编码,正常模式下是无法把输入的unicode识别成
--    映射的字符的;
--
--  缩进知识:
--    插入模式:
--      <Tab>键增加缩进,退格键<Backspace>删除缩进
--      
--  调整字体大小:ctrl + +,ctrl + -
--
--   常用:
--      ctrl + f 向前翻页
--      ctrl + b 向后翻页
--
--- + 常用vim/nvim快捷键 ---





