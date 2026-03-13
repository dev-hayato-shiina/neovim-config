return {
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
}
