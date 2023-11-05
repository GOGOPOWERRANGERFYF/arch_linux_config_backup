-- toggleterm.nvim
-- 设置参考文档,参数还没设置,不能直接用
--require("toggleterm").setup{
--  -- size can be a number or function which is passed the current terminal
--  size = 20 | function(term)
--    if term.direction == "horizontal" then
--      return 15
--    elseif term.direction == "vertical" then
--      return vim.o.columns * 0.4
--    end
--  end,
--  open_mapping = [[<c-\>]],
--  on_create = fun(t: Terminal), -- function to run when the terminal is first created
--  on_open = fun(t: Terminal), -- function to run when the terminal opens
--  on_close = fun(t: Terminal), -- function to run when the terminal closes
--  on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
--  on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
--  on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
--  hide_numbers = true, -- hide the number column in toggleterm buffers
--  shade_filetypes = {},
--  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
--  highlights = {
--    -- highlights which map to a highlight group name and a table of it's values
--    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
--    Normal = {
--      guibg = "<VALUE-HERE>",
--    },
--    NormalFloat = {
--      link = 'Normal'
--    },
--    FloatBorder = {
--      guifg = "<VALUE-HERE>",
--      guibg = "<VALUE-HERE>",
--    },
--  },
--  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
--  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
--  start_in_insert = true,
--  insert_mappings = true, -- whether or not the open mapping applies in insert mode
--  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
--  persist_size = true,
--  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
--  direction = 'vertical' | 'horizontal' | 'tab' | 'float',
--  close_on_exit = true, -- close the terminal window when the process exits
--  shell = vim.o.shell, -- change the default shell
--  auto_scroll = true, -- automatically scroll to the bottom on terminal output
--  -- This field is only relevant if direction is set to 'float'
--  float_opts = {
--    -- The border key is *almost* the same as 'nvim_open_win'
--    -- see :h nvim_open_win for details on borders however
--    -- the 'curved' border is a custom border type
--    -- not natively supported but implemented in this plugin.
--    border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
--    -- like `size`, width and height can be a number or function which is passed the current terminal
--    width = <value>,
--    height = <value>,
--    winblend = 3,
--  },
--  winbar = {
--    enabled = false,
--    name_formatter = function(term) --  term: Terminal
--      return term.name
--    end
--  },
--}
--

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





