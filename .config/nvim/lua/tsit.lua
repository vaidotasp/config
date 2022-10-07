require("nvim-treesitter.configs").setup {
 ensure_installed = {"bash", "c", "css", "html", "javascript", "lua", "python", "rust", "typescript", "vim", "elixir"},
  highlight = {
    enable = true,
    use_languagetree = true
  },
  context_commentstring = {
    enable = true
  },
  indent = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  },
}
