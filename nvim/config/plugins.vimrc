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
Plug 'junegunn/fzf.vim' | Plug '/usr/local/opt/fzf'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dyng/ctrlsf.vim'

" RUBY
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'ngmy/vim-rubocop'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'ck3g/vim-change-hash-syntax'

Plug 'nelstrom/vim-textobj-rubyblock'

" JAVASCRIPT
Plug 'pangloss/vim-javascript'

" CSHARP & DOTNET
Plug 'OmniSharp/omnisharp-vim'
Plug 'adamclerk/vim-razor'

" GIT
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" OTHER
Plug 'AndrewRadev/splitjoin.vim'
Plug 'henrik/vim-indexed-search'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'matze/vim-move'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'

" Code Styling
Plug 'tpope/vim-abolish'
Plug 'ConradIrwin/vim-bracketed-paste'

" Other
Plug 'janko-m/vim-test'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-jdaddy' " JSON manipulation and pretty printing
Plug 'tpope/vim-speeddating'
Plug 'schickling/vim-bufonly'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-obsession'
Plug 'inkarkat/vim-SyntaxRange'

" Plug 'w0rp/ale'
" Plug 'mhinz/vim-startify'
" Plug 'terryma/vim-multiple-cursors'

Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'

call plug#end()

source $HOME/.config/nvim/config/coc.vimrc
source $HOME/.config/nvim/config/ctrlsf.vimrc
source $HOME/.config/nvim/config/easy-align.vimrc
source $HOME/.config/nvim/config/fzf.vimrc
source $HOME/.config/nvim/config/lightline.vimrc
source $HOME/.config/nvim/config/nerdtree.vimrc
source $HOME/.config/nvim/config/omnisharp.vimrc
source $HOME/.config/nvim/config/vim-indent.vimrc
source $HOME/.config/nvim/config/vim-move.vimrc
source $HOME/.config/nvim/config/vim-test.vimrc
source $HOME/.config/nvim/config/neo-solarized.vimrc