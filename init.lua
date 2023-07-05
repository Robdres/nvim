vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.textwidth = 80

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

vim.cmd [[colorscheme habamax]]
-- use spaces for tabs and whatnot  
--
vim.wo.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set clipboard=unnamedplus]]

vim.wo.number = true
vim.wo.relativenumber = true

-- Keybind
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
local keyset = vim.keymap.set

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'rstacruz/vim-closer'
  use 'tpope/vim-fugitive'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'lervag/vimtex'
  use 'GCBallesteros/jupytext.vim'

  use { "kiyoon/jupynium.nvim", run = "pip3 install --user ." }

  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  use 'honza/vim-snippets'

  use{ 'anuvyklack/pretty-fold.nvim',
    config = function()
        require('pretty-fold').setup()
    end
  }
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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

  use {'romgrk/barbar.nvim', requires = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  }}

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
  use 'hail2u/vim-css3-syntax'
  use 'preservim/nerdtree'
  use 'ckunte/latex-snippets-vim'

end)


vim.cmd [[ inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>" ]] 
vim.cmd [[ inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]]
--
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Buffer/Tabs control
vim.cmd [[nnoremap <silent>    H <Cmd>BufferPrevious<CR>]]
vim.cmd [[nnoremap <silent>    L <Cmd>BufferNext<CR>]]
vim.cmd [[nnoremap <silent>    <leader>d <Cmd>BufferClose<CR>]]

-- Nerd tree
vim.cmd [[nnoremap <silent>    <leader>f  <Cmd>NERDTreeToggle<CR>]]
vim.cmd [[nnoremap <silent>    <leader>t <Cmd>terminal<CR>]]

vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
vim.cmd [[let g:airline#extensions#tabline#formatter = '']]
vim.cmd [[set scrolloff=10]]

vim.cmd [[let g:jupytext_fmt = 'py']]
vim.cmd [[let g:jupytext_style = 'hydrogen']]

vim.cmd [[
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"
]]
