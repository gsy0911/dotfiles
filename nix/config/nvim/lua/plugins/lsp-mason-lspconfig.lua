return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local servers = {
      "lua_ls",
      "pyright",
      "ruff",
      "ts_ls",
      "html",
      "yamlls",
      "jsonls",
      "dockerls",
      "docker_compose_language_service",
      "taplo",
      "intelephense",
      "tinymist",
      "typos_lsp",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    local on_attach = function(client, bufnr)
      -- Keymaps
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gt", "<C-t>", bufopts) -- This is not an LSP command, but it's related to jumping back
      vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
      -- 診断情報をquickfixリストで表示
      vim.keymap.set("n", "qq", function()
        vim.diagnostic.setqflist({ open = true })
      end, bufopts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- 診断情報を自動的にquickfixリストに設定（手動で開く）
    local diagnostic_group = vim.api.nvim_create_augroup("LspDiagnostics", { clear = true })
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
      group = diagnostic_group,
      callback = function()
        vim.diagnostic.setqflist({ open = false })
      end,
    })

    local server_configs = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      ts_ls = {
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
      },
      pyright = {
        root_dir = lspconfig.util.root_pattern(".venv", "pyproject.toml", "setup.py", ".git"),
        settings = {
          python = {
            venvPath = ".",
            pythonPath = "./.venv/bin/python",
          },
        },
      },
      dockerls = {
        root_dir = lspconfig.util.root_pattern("Dockerfile"),
      },
      docker_compose_language_service = {
        root_dir = lspconfig.util.root_pattern("docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml"),
      },
      intelephense = {
        root_dir = lspconfig.util.root_pattern("composer.json"),
        settings = {
          intelephense = {
            composer = {
              enabled = true,
            },
            phpdoc = {
              useFullyQualifiedNames = true,
            },
            files = {
              maxSize = 5000000,
              associations = { "*.php", "*.phtml" },
              exclude = {
                "**/.git/**",
                "**/.svn/**",
                "**/.hg/**",
                "**/CVS/**",
                "**/.DS_Store/**",
                "**/node_modules/**",
                "**/bower_components/**",
                "**/var/cache/**",
              },
            },
            completion = {
              insertUseDeclaration = true,
              fullyQualifyGlobalConstantsAndFunctions = false,
            },
          },
        },
      },
    }

    for _, server_name in ipairs(servers) do
      local base_config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local extra_config = server_configs[server_name] or {}
      local final_config = vim.tbl_deep_extend("force", base_config, extra_config)

      lspconfig[server_name].setup(final_config)
    end
  end,
}
