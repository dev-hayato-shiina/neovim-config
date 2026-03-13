return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = {
      "lua-language-server",
      "stylua",
    }
  end,
}
