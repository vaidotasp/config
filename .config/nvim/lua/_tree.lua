local utils = require("utils")
local nnoremap = utils.nnoremap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = false,
  hijack_netrw = true,
  view = {
    side = "left",
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false
},
})

require'treesitter-context'.setup{}


nnoremap("<leader>ge", ":NvimTreeToggle<cr>")
nnoremap("<leader>gf", ":NvimTreeFindFile<cr>")

