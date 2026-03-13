return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "php",
        "blade",
        "html",
        "html_tags",
        "javascript",
        "css",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          enabled = true,
          settings = {
            intelephense = {
              files = {
                exclude = { "**/.git/**", "**/vendor/**", "**/node_modules/**" },
              },
            },
          },
        },
        laravel_ls = { enabled = true },
        stimulus_ls = { enabled = true },
        html = { enabled = true },
        ts_ls = { enabled = true },
        cssls = { enabled = true },
      },
      diagnostics = {
        update_in_insert = false,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
        args = {},
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = { "mago" }

      opts.linters = opts.linters or {}
      opts.linters.mago = {
        condition = function(ctx)
          return vim.fs.find({ "mago.toml" }, { path = ctx.dirname, upward = true })[1] ~= nil
        end,
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "mago" }
    end,
  },
}
