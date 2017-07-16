set nocompatible              " be iMproved, required
filetype off                  " required

if $TMUX == ''
set clipboard=unnamed
endif

set nu
set nowrap
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

call vundle#begin()
set backspace=2
set laststatus=2
set updatetime=250

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Command to move among tabs in Konsole-style
map <A-Right> gt
map <A-Left> gT
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" My plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-projectionist'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-rhubarb'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular.git'
Plugin 'airblade/vim-gitgutter' 
Plugin 'leafgarland/typescript-vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required " To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
syntax on

set runtimepath^=~/.vim/bundle/ctrlp.vim
colorscheme onedark 
map <C-n> :NERDTreeToggle<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
