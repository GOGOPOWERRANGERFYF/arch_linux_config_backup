-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "python", "javascript", "typescript", "html", "css", "java", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --        return true
    --    end
    --end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- 增量选择(按下面设置的快捷键测试了一下,暂时没有打算用这个东西...)
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  -- 实验性质特性,启用代码格式化
  indent = {
    enable = true
  }
}

-- 折叠设置 --
-- 折叠快捷键 <Z-C>折叠 <Z-O>打开折叠
-- z当作折叠的象形文字或拼音折叠开头字母都能很好记忆,c为close,o为open
--vim.o.nofoldenable =   -- Disable folding at startup. 这设置没用???
vim.o.foldlevel = 99 --这个不知道啥玩意能实现默认不折叠...
vim.o.foldmethod= 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Highlight the @foo.bar capture group with the "Identifier" highlight group 不知道有啥用
--vim.api.nvim_set_hl(0, "@foo.bar", { link = "Identifier" })

-- 设置nvim-treesitter高亮切换快捷键(没啥用,注销了)
--vim.api.nvim_set_keymap('n', '<F4>', ':TSBufToggle highlight<CR>', {noremap = true, silent = true})



