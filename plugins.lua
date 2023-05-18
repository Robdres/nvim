vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'rstacruz/vim-closer'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "rafamadriz/friendly-snippets"
  use 'neoclide/coc.nvim'
  use 'altercation/vim-colors-solarized'
  use 'morhetz/gruvbox'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'
  use 'scrooloose/nerdcommenter'
  use 'christoomey/vim-tmux-navigator'
  use 'sheerun/vim-polyglot'
  use 'hail2u/vim-css3-syntax'
end)

