-- 加载notify插件 -- 来源:nvim-notify官方文档 --查看notify历史记录
require("telescope").load_extension("notify")

local builtin = require('telescope.builtin')
-- 快捷键设置
-- <leader> '\'按键
-- a 'A'按键；f 'F'按键
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) --文件查询
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) --文字查询
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) --缓存查询(已打开的Buffer)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) --nvim帮助文档查询

-- telescope setup
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
