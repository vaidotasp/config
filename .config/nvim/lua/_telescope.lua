local telescope = require("telescope")
local actions = require("telescope.actions")
local nnoremap = require("utils").nnoremap

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<Esc>"] = actions.close, -- don't go into normal mode, just close
        ["<C-j>"] = actions.move_selection_next, -- scroll the list with <c-j>
        ["<C-k>"] = actions.move_selection_previous, -- scroll the list with <c-k>
        -- ["<C-\\->"] = actions.select_horizontal, -- open selection in new horizantal split
        -- ["<C-\\|>"] = actions.select_vertical, -- open selection in new vertical split
        ["<C-t>"] = actions.select_tab, -- open selection in new tab
        ["<C-y>"] = actions.preview_scrolling_up,
        ["<C-e>"] = actions.preview_scrolling_down,
        -- ["<C-m>"] = actions.smart_send_to_qflist + actions.open_qflist,
        --   -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8
      },
      vertical = {
        mirror = false
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {"node_modules"},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {"truncate"},
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
  },
  pickers = {
    find_files = {
      find_command = {"fd", "--type", "f", "--strip-cwd-prefix"}
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

telescope.load_extension("fzf")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
-- nnoremap("<leader>fa", "<cmd>Telescope find_files hidden=true<cr>")
nnoremap("<leader>fo", "<cmd>Telescope oldfiles<cr>")
nnoremap("<leader>fn", "<cmd>Telescope node_modules list<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fw", "<cmd>Telescope grep_string<cr>")
nnoremap("<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
nnoremap("<leader>q", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

