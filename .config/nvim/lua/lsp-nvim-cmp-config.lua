-- 参照nvim-lspconfig插件的官方文档

-- Add additional capabilities supported by nvim-cmp
-- nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
--来源: nvim-cmp and luasnip 文档条目 (目前用上面的设置)
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
--

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'tsserver', 'html', 'cssls', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'
-- <C-d>片段向上 <C-f>片段向下 来源:luasnip github官方文档默认设置
-- Ctrl + (d)own/(f)orward 想象拨手机屏幕动作...

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  --补全提示开启边框 -- 来源:nvim-cmp官方文档
  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  },
  --
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- 来源:nvim-cmp文档
-- example nvim-cmp setup
---- Set up nvim-cmp. 
--local cmp = require'cmp'
--
--cmp.setup({
--  snippet = {
--    -- REQUIRED - you must specify a snippet engine
--    expand = function(args)
--      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--    end,
--  },
--  window = {
--    -- completion = cmp.config.window.bordered(),
--    -- documentation = cmp.config.window.bordered(),
--  },
--  mapping = cmp.mapping.preset.insert({
--    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.abort(),
--    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--  }),
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = 'vsnip' }, -- For vsnip users.
--    -- { name = 'luasnip' }, -- For luasnip users.
--    -- { name = 'ultisnips' }, -- For ultisnips users.
--    -- { name = 'snippy' }, -- For snippy users.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--  sources = cmp.config.sources({
--    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--  }, {
--    { name = 'buffer' },
--  })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--    { name = 'cmdline' }
--  })
--})
--
---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}

