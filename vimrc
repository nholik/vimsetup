" install Plug if it's not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""

""""""Plugins
call plug#begin('~/.vim/plugged')

"terminal and file mgmt
Plug 'wincent/terminus'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
""""""

"asthetics
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""""""
"editor
Plug 'editorconfig/editorconfig-vim'

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' 
Plug 'Xuyuanp/nerdtree-git-plugin'
""""""

"development
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale' 
" Plug 'steelsojka/deoplete-flow'
Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ryanoasis/vim-devicons'

"languages
"javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
""""""

call plug#end()
""""""Plugins

let g:deoplete#enable_at_startup = 1

"general setup
colorscheme badwolf 
syntax enable
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set ruler
set visualbell
set ttyfast
let mapleader = ","
set laststatus=2
set noswapfile

" clipboard shortcuts
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"NERDTree setup
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeToggle<CR>

"air-line
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

"javascript setup
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
" code folding
"augroup javascript_folding
"    au!
"    au FileType javascript setlocal foldmethod=syntax
"augroup END

" prettier
"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG

" autocomplete
if has('nvim')
"    call deoplete#enable()
"    let g:deoplete#enable_at_startup = 1
 
    "let g:deoplete#omni#functions = {}
    "let g:deoplete#omni#functions.javascript = [
    "        \ 'tern#Complete',
    "        \ 'jspc#omni'
    "        \]

    set completeopt=longest,menuone,preview
    "let g:deoplete#sources = {}
    "let g:deoplete#sources['javascript.jsx'] = ['file','ultisnips', 'ternjs']

    "let g:deoplete#sources#ternjs#types = 1
    "let g:tern#command = ['tern']
    "let g:tern#arguments = ['--persistent']
    let g:python_host_prog = '/home/max/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = '/home/max/.pyenv/versions/neovim3/bin/python'

endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
