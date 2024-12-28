-- packer.nvim を安全にロード
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- packer.nvim 自体を管理
  use 'wbthomason/packer.nvim'

  -- Treesitter (構文ハイライト強化)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP クライアント設定
  use 'neovim/nvim-lspconfig'

  -- 自動補完
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    }
  }

  -- 自動で括弧を閉じる
  use 'windwp/nvim-autopairs'

  -- null-ls (コードフォーマットやLinting)
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- nvim-dap (デバッグサポート)
  use 'mfussenegger/nvim-dap'

  -- plenary.nvim を追加
  use 'nvim-lua/plenary.nvim'
end)

-- LSPの設定
local lspconfig = require('lspconfig')

-- gopls の設定
lspconfig.gopls.setup {
  cmd = {"gopls"}, -- gopls のパス
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        nilness = true,
        unusedwrite = true,
      },
      staticcheck = true,
    },
  },
}

-- null-ls の設定
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.diagnostics.golangci_lint,
  },
})

-- nvim-dap の設定
local dap = require('dap')
dap.adapters.go = {
  type = 'executable',
  command = 'node',
  args = {'/path/to/vscode-go/dist/debugAdapter.js'},
}
dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
}

-- 自動補完の設定
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- nvim-autopairs の設定
require('nvim-autopairs').setup{}

-- 保存時に自動フォーマット
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.go lua vim.lsp.buf.format()
  augroup END
]])

-- Treesitterの設定
require('nvim-treesitter.configs').setup {
  ensure_installed = { "go", "gomod" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- タブやスペースを表示する設定
vim.o.list = true
vim.o.listchars = 'tab:>-,trail:-'

-- タブのサイズを4に設定
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
