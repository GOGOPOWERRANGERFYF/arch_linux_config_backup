return {
  -- amongst your other plugins
  --{'akinsho/toggleterm.nvim', version = "*", config = true}
  -- or
  --{'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    -- 设置
    require('toggleterm').setup({
        open_mapping = [[<F4>]], --切换终端. (exit shell命令退出终端)
        --open_mapping = [[<F4>]],
        -- 打开新终端后自动进入插入模式
        --start_in_insert = true,

        -- 在当前buffer的下方打开新终端
        --direction = 'horizontal',
        --direction = 'vertical',
        direction = 'float',
        --direction = 'tab',

          -- This field is only relevant if direction is set to 'float'
        float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'single', -- | 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
        --width = 150,
        --height = 50,
        --winblend = 3,
      },
    })

    -- 设置终端快捷键 参考文档
    --function _G.set_terminal_keymaps()
    --  local opts = {buffer = 0}
    --  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    --  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    --  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    --  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    --  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    --  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    --end
    --
    ---- if you only want these mappings for toggle term use term://*toggleterm#* instead
    --vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    --
    
    -- 自定义快捷键设置 't'类型表示nvim内置终端快捷键
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) --退出终端缓存的插入模式,可shift+pageup/down翻页
      -- <Cmd>命令模式等同:键;
      -- <CR>回车键; wincmd h命令窗口的h键(非内置终端)
      --vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) --切换到非终端缓存的h键操作
      --vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts) --同上
      --vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) --同上
      --vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts) --同上
    end
    ---- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
