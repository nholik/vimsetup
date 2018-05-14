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
Plug 'ryanoasis/vim-devicons'

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' 
Plug 'Xuyuanp/nerdtree-git-plugin'
""""""

"development
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale' 
" Plug 'steelsojka/deoplete-flow'
"Plug 'wokalski/autocomplete-flow'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ervandew/supertab'

" LanguageClient plugin
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" Required for operations modifying multiple buffers like rename.
set hidden

    " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }


""languages
"javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }


"html
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"css
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }
"sass
Plug 'cakebaker/scss-syntax.vim'

""""""

call plug#end()
""""""Plugins

set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
inoremap <expr> <C-n>  deoplete#mappings#manual_complete()

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
map <C-e> :NERDTreeToggle<CR>

"air-line
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

"javascript setup
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" autocomplete

let g:python_host_prog = '/home/max/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/max/.pyenv/versions/neovim3/bin/python'


let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"
