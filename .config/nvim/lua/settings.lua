local utils = require("utils")
local set = vim.opt
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local nmap = utils.nmap
local tmap = utils.tmap
local nnoremap = utils.nnoremap
local tnoremap = utils.tnoremap


g.gruvbox_contrast_dark = "medium"
g.gruvbox_bold = 0
g.gruvbox_italic = 0

vim.cmd("let g:test#neovim#start_normal = 1")

require('colorbuddy').colorscheme("gruvbox")

-- vim.cmd("let g:zenbones_italic_comments = v:false")
-- vim.cmd("let g:zenbones_italic = v:false")
-- require('colorbuddy').colorscheme("zenbones")
--
-- Set barbar's options
require'bufferline'.setup {
  animation = false,
  auto_hide = false,
  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = false,

  -- Enable/disable close button
  closable = false,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = false,
  -- Show every buffer
  hide = {current = false, inactive = false, visible = false},


  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = false,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 0.5,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 0.3,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- settings
set.number = true

-- cosmetics
set.termguicolors = true
cmd [[syntax on]]

opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

set.undofile = true
set.mouse = "nv"

set.list = true
set.listchars = {
  eol = '¬',
  trail = "⋅",
  tab = "→ ",
  extends = "❯",
  precedes = "❮"
  -- tab = '▸\',
  -- extends = '❯\',
  -- precedes = '❮\',
}


set.smartindent = true
opt.autoindent = true -- automatically set indent of new line
opt.ttyfast = true -- faster redrawing

set.ignorecase = true -- case insensitive searching
set.smartcase = true --  case-sensitive if expresson contains a capital letter
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- set incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.cursorline = true

opt.laststatus = 3 -- show the global statusline all the time
opt.scrolloff = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion

set.termguicolors = true


opt.cmdheight = 1 -- command bar height
-- opt.title = true -- set terminal title
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.updatetime = 300
opt.signcolumn = "yes"

opt.wrap = true -- turn on line wrapping
opt.wrapmargin = 8 -- wrap lines when coming within n characters from side
opt.linebreak = true -- set soft wrapping

opt.errorbells = false

set.tabstop= 2 --  number of visual spaces per tab
set.softtabstop = 2 -- number of spaces in tab when editing
set.shiftwidth = 2 -- number of spaces when shift indenting
set.showtabline = 2

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})
  augroup END
]]


--Remap space as leader key
g.mapleader = " "
g.maplocalleader = " "


-- Global keybinds go here (any other that belong to specific plugins would go into their modules respectively)
nmap("<leader>io", ":UndotreeToggle<cr>")
nmap("<leader>s", ":w<CR>") -- sensible save functionality
nmap ("<leader>w", ":bd<CR>") --Buffer close with W

nmap("0", "^") --Better movement to the front of the line

nmap("<C-6>", "<C-^>") --for tmux last file toggle

--Terminal escape remaps
-- tnoremap("<leader>","<C-\\><C-N>")
tmap("<C-o>","<C-\\><C-n>")

nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")

-- TODO: Write -> custom plugin with utils like these, then invoke lesser used invocations as commands, eg. :copypath, etc.
nnoremap("<leader>cpf", "<cmd>:let @+ = expand(\"%\")<cr>")


