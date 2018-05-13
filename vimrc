execute pathogen#infect()
colorscheme badwolf 
syntax enable
set tabstop=4
set softtabstop=4
set expandtab
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

"Markdown setup
"let vim_markdown_preview_github=1
"let vim_markdown_preview_browser='/usr/bin/google-chrome-stable %U'

"NERDTree setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
    call deoplete#enable()
    let g:deoplete#enable_at_startup = 1

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


"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
