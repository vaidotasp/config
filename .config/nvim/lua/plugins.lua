require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'gruvbox-community/gruvbox'
  use 'tjdevries/colorbuddy.nvim'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'findango/vim-mdx' -- mdx syntax highlight
  use 'sbdchd/neoformat' --universal formatter
  use 'christoomey/vim-system-copy'
  use 'christoomey/vim-tmux-navigator'
  use 'nathom/filetype.nvim' --Replacement for built-in filetype parser
  use 'mbbill/undotree'
  use 'stsewd/gx-extended.vim'
  use 'romainl/vim-cool'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  -- use 'junegunn/fzf'
  -- use 'junegunn/fzf.vim'
  use 'lewis6991/gitsigns.nvim'
  use 'alvarosevilla95/luatab.nvim'
  use 'vim-test/vim-test'
  use 'simrat39/rust-tools.nvim'
  use 'romgrk/barbar.nvim'
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use'shumphrey/fugitive-gitlab.vim'
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use {
  'nvim-telescope/telescope.nvim',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use 'nvim-telescope/telescope-rg.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
end)
