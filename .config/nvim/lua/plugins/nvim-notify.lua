return {
  'rcarriga/nvim-notify',
  lazy = true,
  event = "VeryLazy",
  config = function ()
    -- nvim-notify
    --插件设置成nvim默认notify功能
    vim.notify = require("notify") -- 移到init.lua(20231104注意,在lazy管理下,移到inti.lua会出错.)

    require('notify')('🎉: nvim-notify已加载.')
    require('notify').setup({
      -- "fade", "slide", "fade_in_slide_out", "static"
      stages = "fade",
      render = "default",
      background_colour = "Normal",
    })

    -- keymap -- noremap 不递归映射
    -- \ + n + h 按键
    vim.api.nvim_set_keymap('n', '<leader>tn', ':Telescope notify<CR>', {noremap = true, silent = true})
  end
}
