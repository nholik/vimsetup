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

"NERDTree setup
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
map <C-e> :NERDTreeToggle<CR>
"""

"asthetics
Plug 'flazz/vim-colorschemes'
"Plug 'edkolev/tmuxline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

Plug 'ryanoasis/vim-devicons'
""""""

"editor
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'


"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' 
Plug 'Xuyuanp/nerdtree-git-plugin'
""""""

" Plug 'tpope/vim-dispatch'

"development
Plug 'junegunn/fzf'
" autocomplete
Plug 'Shougo/neocomplete'
"Plug 'Valloric/YouCompleteMe'
" complete installation like so, see docs
"cd ~/.vim/bundle/YouCompleteMe
"/.install.py --cs-completer --go-completer --rust-completer --ts-completer
"""" youcompleteme options
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" let g:ycm_autoclose_preview_window_after_completion = 1
""""
" syntax checking
"Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
" recommended syntasic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""

"csharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
let g:syntastic_cs_checkers = ['code_checker'] " use syntastic with omnisharp
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
let g:OmniSharp_server_stdio = 1
" based on defaults provided in docs

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
"set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
" let g:ale_linters = { 'cs': ['OmniSharp'] }

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

Plug 'tpope/vim-commentary'

call plug#end()
""""""Plugins

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"general setup
colorscheme molokai 
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
set hidden

" clipboard shortcuts allow yanking/putting text into system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" set cursor for modes
" 1 is the blinky block cursor
" 2 is the default (non-blinky) block cursor
" 3 is blinky underscore
" 4 fixed underscore
" 5 pipe bar (blinking)
" 6 fixed pipe bar
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

let g:python_host_prog = '/home/max/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/max/.pyenv/versions/neovim3/bin/python'
set timeoutlen=1000 ttimeoutlen=0 "get rid of delay when hitting esc to leave insert mode

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

"debugging
" function! MicrosoftDocs()
"   let type = OmniSharp#py#eval('getFullType()')['type']
"   execute "!xdg-open 'https://docs.microsoft.com/en-us/dotnet/api/".type."?view=netcore-2.2'"
" endfunction

" function! SourceLookup()
"   let type = OmniSharp#py#eval('getFullType()')['type']
"   silent execute '!xdg-open "https://source.dot.net/\#q='.type.'"'
" endfunction

" function! DebugTest()
"   call InitDebugger("debugTest", {'name': OmniSharp#py#eval('getFullType()')['type']})
" endfunction

" function! RunTest()
"   let ch = ch_open('localhost:4321', { "mode": "json" })
"   let obj = { "command": "runTest" }
"   let obj["name"] = OmniSharp#py#eval('getFullType()')['type']
"   let obj["filename"] = expand('%:p')

"   call ch_sendexpr(ch, obj)
" endfunction

" function! StartDebugger()
"   call InitDebugger("debugProgram", {})
" endfunction

" function! InitDebugger(command, obj)
"   let g:db_files = []
"   let ch = ch_open('localhost:4321', { "mode": "json", "callback": "DebuggerHandle", "close_cb": "DebuggerCloseHandle" })
"   let obj = a:obj
"   let obj["command"] = a:command
"   let obj["filename"] = fnamemodify(expand("%"), ":p")
"   let breakpoints = sign_getplaced()
"   for i in breakpoints
"     let inner = i['signs']
"     let i['filename'] = fnamemodify(bufname(i['bufnr']), ":p")
"   endfor
"   let obj["breakpoints"] = breakpoints
"   call ch_sendexpr(ch, obj, { "callback": "DebuggerHandle" })
" endfunction

" function! DebuggerHandle(ch, msg)
"   " echo "received"
"   let cmd = a:msg["command"]
"   if cmd == "highlight"
"     call add(g:db_files, a:msg["file"])
"     execute 'e '.a:msg["file"]
"     match
"     execute 'match Search /\%'.a:msg["lineNumber"].'l/'
"     execute 'normal! '.a:msg["lineNumber"].'G'
"     execute 'normal! zz'
"   endif
"   if cmd == "clearHighlights"
"     match
"   endif
" endfunction

" function! DebuggerCloseHandle(ch)
"   " echo "closed"
"   for db_file in g:db_files
"     execute 'e '.db_file
"     execute 'match'
"     match
"   endfor
" endfunction
" nnoremap <F5> :call StartDebugger()

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
