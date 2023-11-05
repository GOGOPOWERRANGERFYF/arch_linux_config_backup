return {
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  event = "InsertEnter",
  dependencies = {
    --'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
  },
  config = function ()
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
    -- Ctrl + (d)own/(f)orward 想象拨手机屏幕动作...20231104 已修改为u/d,参考下面的mapping

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
        -- ctrl+u/d (up/down)快捷键
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
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

    -- 说明:
    -- 使用nvim-cmp进行自动补全,nvim-lspconfig统一配置语言服务,解决了使用nvim原生
    -- lsp接口配置语言服务的麻烦.nvim-cmp使用nvim-lspconfig就不用在nvim-cmp的配置
    -- 文件里再单独配置语言服务.(不使用nvim-lspconfig的使用方式参考nvim-cmp文档里
    -- 的示例配置代码).厘清nvim内置LSP,官方提供的lspconfig,补全插件之间的关系很重要.
    ------ nvim-lspconfig 官方文档提供的示例 ------
    --local use = require('packer').use
    --require('packer').startup(function()
    --  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    --  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    --  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    --  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    --  use 'L3MON4D3/LuaSnip' -- Snippets plugin
    --end)
    -- 上面这段要修改为适配lazy插件管理下的配置!参考上面配置好的代码.

    ---- Add additional capabilities supported by nvim-cmp
    --local capabilities = require("cmp_nvim_lsp").default_capabilities()

    --local lspconfig = require('lspconfig')

    ---- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    --local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
    --for _, lsp in ipairs(servers) do
    --  lspconfig[lsp].setup {
    --    -- on_attach = my_custom_on_attach,
    --    capabilities = capabilities,
    --  }
    --end

    ---- luasnip setup
    --local luasnip = require 'luasnip'

    ---- nvim-cmp setup
    --local cmp = require 'cmp'
    --cmp.setup {
    --  snippet = {
    --    expand = function(args)
    --      luasnip.lsp_expand(args.body)
    --    end,
    --  },
    --  mapping = cmp.mapping.preset.insert({
    --    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    --    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    --    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    --    ['<C-Space>'] = cmp.mapping.complete(),
    --    ['<CR>'] = cmp.mapping.confirm {
    --      behavior = cmp.ConfirmBehavior.Replace,
    --      select = true,
    --    },
    --    ['<Tab>'] = cmp.mapping(function(fallback)
    --      if cmp.visible() then
    --        cmp.select_next_item()
    --      elseif luasnip.expand_or_jumpable() then
    --        luasnip.expand_or_jump()
    --      else
    --        fallback()
    --      end
    --    end, { 'i', 's' }),
    --    ['<S-Tab>'] = cmp.mapping(function(fallback)
    --      if cmp.visible() then
    --        cmp.select_prev_item()
    --      elseif luasnip.jumpable(-1) then
    --        luasnip.jump(-1)
    --      else
    --        fallback()
    --      end
    --    end, { 'i', 's' }),
    --  }),
    --  sources = {
    --    { name = 'nvim_lsp' },
    --    { name = 'luasnip' },
    --  },
    --}
  end,
}
