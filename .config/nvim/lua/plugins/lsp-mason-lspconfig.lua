return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  config = function()
    -- languages
    local lsp_servers = { 
      "lua_ls",
      "pyright",
      "ruff",
      "ts_ls",
      "html",
      "yamlls",
      "jsonls",
      "dockerls",
      "docker_compose_language_service",
      -- toml
      "taplo",
      -- PHP
      "intelephense",
      -- typst
      "tinymist"
    }
    -- utilities
    local diagnostics = { "typos_lsp" }
    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
    }
    require("mason-lspconfig").setup_handlers {
      function (server_name)
        local nvim_lsp = require("lspconfig")
        require("lspconfig").typos_lsp.setup {}
        require('lspconfig').lua_ls.setup({})

        -- TypeScript
        nvim_lsp.ts_ls.setup {
          root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json"),
        }
        -- Python
        require("lspconfig").pyright.setup {
          root_dir = nvim_lsp.util.root_pattern(".venv"),
          -- cmd = { "bash", "-c", "source ./.venv/bin/activate"},
          settings = {
            python = {
              -- 仮想環境のルートパス
              venvPath = ".",
              -- 仮想環境のフォルダ名
              -- venv = ".venv",
              pythonPath = "./.venv/bin/python",
              -- analysis = {
              --   extraPaths = {"."},
              --   autoSearchPaths = true,
              --   useLibraryCodeForTypes = true
              -- }
            }
          }
        }
        nvim_lsp.dockerls.setup({
          root_dir = nvim_lsp.util.root_pattern("Dockerfile"),
        })
        nvim_lsp.docker_compose_language_service.setup({
          root_dir = nvim_lsp.util.root_pattern("docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml"),
        })
        -- PHP
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        nvim_lsp.intelephense.setup({
          capabilities = capabilities,
          root_dir = nvim_lsp.util.root_pattern("composer.json"),
          settings = {
            intelephense = {
              -- Composerの設定を有効化
              composer = {
                enabled = true
              },
              -- VendorディレクトリのPSR-4オートロード対応
              phpdoc = {
                useFullyQualifiedNames = true
              },
              -- ファイル関連
              files = {
                maxSize = 5000000,
                associations = {"*.php", "*.phtml"},
                -- Vendorディレクトリ内のファイルも解析対象に含める
                exclude = {
                  "**/.git/**",
                  "**/.svn/**",
                  "**/.hg/**",
                  "**/CVS/**",
                  "**/.DS_Store/**",
                  "**/node_modules/**",
                  "**/bower_components/**",
                  "**/var/cache/**"
                }
              },
              -- コンポーザーのオートロードをサポート
              completion = {
                insertUseDeclaration = true,
                fullyQualifyGlobalConstantsAndFunctions = false
              }
            }
          }
        })
      end,
    }
    -- カーソル下の変数の情報
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    -- 定義ジャンプ
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    -- 定義ジャンプ後に下のファイルに戻る
    vim.keymap.set('n', 'gt', '<C-t>')
    -- 改行やインデントなどのフォーマット
    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    -- カーソル下の変数をコード内で参照している箇所
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- 変数名のリネーム
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  end,
}
