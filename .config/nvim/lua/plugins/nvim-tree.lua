return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- nvim-tree --

    -- examples for your init.lua
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups -- init.lua已设置
    --vim.opt.termguicolors = true

    ---- empty setup using defaults
    --require("nvim-tree").setup()

    ---- OR setup with some options
    --传入setup省略的参数会加载默认参数
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        --mappings = {},
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        --过滤隐藏文件
        dotfiles = true,
      },
    })
    vim.keymap.set("n", "<F2>", "<cmd>NvimTreeToggle<CR>")
    ---- 快捷键 --
    ----     vim.api.nvim_set_keymap('模式', '按键', '映射为..', option)
    ---- 按键:
    ----     <CR> 回车换行；<sapce> 空格键；<F2> F2键；
    ---- 选项:
    ----     silent 表示执行命令时不回显内容?;
    ----     noremap 禁止递归;
    ---- 模式:
    ----     '' 所有模式；'n' 普通模式；'v' 可视模式；'i' 插入模式；'s' 选择模式；'c' 命令模式.
    --vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
  end,
}
-- 非完整版配置,可:help nvim-tree帮助文档完善 20231103,对我来说目前的配置已经够用了...
-- 默认快捷键:
--   shift+h 显示隐藏文件
