return {
  "williamboman/mason.nvim",
  config = function()
    -- mason.nvim Lsp服务安装和管理插件
    require("mason").setup()
  end,
  -- mason快捷键
  vim.api.nvim_set_keymap('n', '<F12>', ':Mason<CR>', {noremap = true, silent = true})
}
