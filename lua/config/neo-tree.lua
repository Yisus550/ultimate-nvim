local keymap = vim.keymap

require("neo-tree").setup {
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = false,
  sources = { "filesystem", "buffers", "git_status" },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
    follow_current_file = {
      enabled = false,
    },
    use_libuv_file_watcher = true,
  },
}

keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal position=left<cr>", {
  silent = true,
  desc = "toggle neo-tree",
})
