-- Default options --
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    --styles = {              -- Style to be applied to different syntax groups
    --  comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
    --  conditionals = "NONE",
    --  constants = "NONE",
    --  functions = "NONE",
    --  keywords = "NONE",
    --  numbers = "NONE",
    --  operators = "NONE",
    --  strings = "NONE",
    --  types = "NONE",
    --  variables = "NONE",
    --},
    inverse = {             -- Inverse highlight for different types
      --match_paren = false,
      --visual = false,
      --search = false,
      match_paren = true,
      visual = true,
      search = true,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},

  styles = {
    --comments = "italic",
    keywords = "bold",
    --types = "italic,bold",
  },
})

-- 切换主题
-- setup must be called before loading
--vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme dayfox")
--vim.cmd("colorscheme dawnfox")
--vim.cmd("colorscheme duskfox")
--vim.cmd("colorscheme nordfox")
--vim.cmd("colorscheme terafox")
--vim.cmd("colorscheme carbonfox")

