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

require('luatab').setup{}

require'bufferline'.setup {
  animation = false,
  icons = false,
  clickable = false,
  closable = false,
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


