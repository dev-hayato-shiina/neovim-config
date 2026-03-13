return {
  "folke/noice.nvim",
  dependencies = {
    {
      "MunifTanjim/nui.nvim",
      config = function()
        local Popup = require("nui.popup")
        local command_list = [[
q - コマンドリストを閉じる

<leader>  - <space>

<プラグイン>
normal, f - HopWordを実行

normal, 中クリック    - カーソル追加
normal, ctrl+alt+up   - 上にカーソル追加
normal, ctrl+alt+down - 下にカーソル追加
normal, <esc><esc>    - マルチカーソル解除
]]
        local function show_commands()
          local popup = Popup({
            enter = true,
            focusable = true,
            border = {
              style = "rounded",
              text = {
                top = " コマンドリスト ",
                top_align = "center",
              },
            },
            position = "50%",
            size = {
              width = 80,
              height = 30,
            },
            buf_options = {
              modifiable = false,
              readonly = true,
            },
          })
          vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, vim.split(command_list, "\n"))
          popup:map("n", "q", function()
            popup:unmount()
          end, { noremap = true })
          popup:mount()
        end
        vim.keymap.set("n", "<leader>h", show_commands, { noremap = true, desc = "コマンドリストを表示" })
      end,
    },
  },
  opts = {},
}
