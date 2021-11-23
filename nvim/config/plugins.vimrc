" Thanks to autoloader functionality, there is no need to work on any kind of
" installation process. All plug-ins will be download the first time Neovim is
" opened. https://web.archive.org/web/20200509161852/https://learnvimscriptthehardway.stevelosh.com/chapters/53.html
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" CODE NAVIGATION
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'github/copilot.vim'
Plug 'elijahmanor/export-to-vscode.nvim'

" RUBY
Plug 'tpope/vim-rails' " , { 'for': ['ruby, erb'] }
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'ngmy/vim-rubocop'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'ck3g/vim-change-hash-syntax'

Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'slim-template/vim-slim'

" JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

" EMBER
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'AndrewRadev/ember_tools.vim'

" GIT
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ruanyl/vim-gh-line'

" CODE STYLING
Plug 'tpope/vim-abolish'
Plug 'ConradIrwin/vim-bracketed-paste'

" UNIX
Plug 'lambdalisue/suda.vim'

" OTHER
Plug 'AndrewRadev/splitjoin.vim'
Plug 'henrik/vim-indexed-search'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'matze/vim-move'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-jdaddy' " JSON manipulation and pretty printing
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'

" THEME
Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'

" UNUSED

" Plug 'w0rp/ale'
" Plug 'mhinz/vim-startify'
" Plug 'terryma/vim-multiple-cursors'

call plug#end()

source $HOME/.config/nvim/config/coc.vimrc
source $HOME/.config/nvim/config/ctrlsf.vimrc
source $HOME/.config/nvim/config/dash.vimrc
source $HOME/.config/nvim/config/easy-align.vimrc
source $HOME/.config/nvim/config/fzf.vimrc
source $HOME/.config/nvim/config/lightline.vimrc
source $HOME/.config/nvim/config/theme.vimrc
source $HOME/.config/nvim/config/nerdtree.vimrc
source $HOME/.config/nvim/config/vim-commentary.vimrc
source $HOME/.config/nvim/config/vim-indent.vimrc
source $HOME/.config/nvim/config/vim-move.vimrc
source $HOME/.config/nvim/config/vim-slim.vimrc
source $HOME/.config/nvim/config/vim-test.vimrc
source $HOME/.config/nvim/config/export-to-vscode.lua
