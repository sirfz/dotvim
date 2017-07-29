" Required:
call plug#begin('~/.vim/bundle')

" Add or remove your Bundles here:
" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'ajh17/spacegray.vim'
" Plug 'roosta/srcery'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'scrooloose/syntastic'
" Plug 'maralla/validator.vim'
Plug 'w0rp/ale'
"""" python completion
" Plug 'davidhalter/jedi-vim'
"""" for asynch autocomplete
" Plug 'Shougo/vimproc.vim', {'do': 'make'}
"""" cached completion
" Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'valloric/MatchTagAlways'

" Required:
call plug#end()

""" Sugar
set number " line numbers
set title " display file title in console
set hidden " hide buffers when switching to preserve history

""" Moving Around/Editing
set cursorline " have a line indicate the cursor location
set ruler " show the cursor position all the time
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set wrap " Wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
" set smartindent " use smart indent if there is no indent file
set cindent
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql " Setting text and comment formatting to auto
set textwidth=120 " Lines are automatically wrapped after 120 columns
set numberwidth=3 " number gutter width

"""" Messages, Info, Status
set ls=2 " allways show status line
set vb t_vb= " Disable all bells. I hate ringing/flashing.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2 " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex

set noshowmode " don't show mode

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif

" color scheme {
    if has("termguicolors") && match($TERM, "screen") == -1
        set termguicolors
    endif
    " 256/16 colours (Use what's supported by your terminal)
    if &term == "screen"
        set t_Co=256
    endif

    " colorscheme
    set background=dark
    " let base16colorspace=256
    " let g:base16_shell_path="~/.config/base16-builder/output/shell/"
    " colorscheme base16-default-dark
    " colorscheme hybrid
    " colorscheme spacegray
    let g:jellybeans_overrides = {
        \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
        \}
    colorscheme jellybeans
" }

set guifont=Hack\ 11

" NERDTree {
    " ctrl+n toggles NERDTree
    noremap <C-n> :NERDTreeToggle<CR>
    " close vim if NERD is last open window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }

" vim-airline {
    " vim-airline powerline symbols
    let g:airline_powerline_fonts = 1

    " airline tabline
    let g:airline#extensions#tabline#enabled = 1

    " display tab number
    let g:airline#extensions#tabline#tab_nr_type = 1

    " bufferline
    let g:airline#extensions#bufferline#enabled = 1

    " display buffer number
    let g:airline#extensions#tabline#buffer_nr_show = 1

    " airline theme
    " let g:airline_theme = "base16_default"
    " let g:airline_theme = "onedark"

    " powerline statusline
    " set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" }

" Gundo
nnoremap <F5> :GundoToggle<CR>

" PYMODE
" pymode lint error sort
" let g:pymode_lint_sort = ['E', 'C', 'I']

" disable rope in favor of jedi
" let g:pymode_rope = 0
" disable rope completion
" let g:pymode_rope_completion = 0

" disable pymode documentation
" let g:pymode_doc = 0

" pymode (lint) max line length
" let g:pymode_options_max_line_length = 120

" pymode rope offer import after complete
" let g:pymode_rope_autoimport_import_after_complete = 1
" PYMODE

" Unite {
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
" let g:unite_data_directory='~/.vim/.cache/unite'
" let g:unite_enable_start_insert=1
" let g:unite_source_history_yank_enable=1
" let g:unite_prompt='» '
" let g:unite_split_rule = 'botright'
" if executable('ack')
" let g:unite_source_grep_command='ack'
" let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
" let g:unite_source_grep_recursive_opt=''
" endif
" nnoremap <silent> <c-p> :Unite -auto-resize file file_mru file_rec/async<cr>
" }

" python-vim {
    let python_highlight_all = 1
" }

" jedi-vim {
    " let g:jedi#auto_vim_configuration = 0
    " let g:jedi#completions_enabled = 0
    " let g:jedi#smart_auto_mappings = 0
    " let g:jedi#show_call_signatures = 2
    " let g:jedi#completions_command = ""
    " let g:jedi#popup_on_dot = 0
    " let g:jedi#popup_select_first = 0
    " let g:jedi#goto_assignments_command = ""
    " let g:jedi#goto_definitions_command = ""
    " let g:jedi#documentation_command = "K"
    " let g:jedi#usages_command = "<leader>pu"
    " let g:jedi#rename_command = "<leader>pr"
    " jedi mappings
    " let g:jedi#rename_command = "<leader>m"
" }

" neocomplete {
    " let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    " let g:neocomplete#enable_smart_case = 1
    " async autocomplete
    " let g:neocomplete#use_vimproc = 1
    " Set minimum syntax keyword length.
    " let g:neocomplete#sources#syntax#min_keyword_length = 3
    " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Define keyword
    " if !exists('g:neocomplete#keyword_patterns')
    "     let g:neocomplete#keyword_patterns = {}
    " endif
    " let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    " Plugin key-mappings.
    " inoremap <expr><C-g>     neocomplete#undo_completion()
    " inoremap <expr><C-l>     neocomplete#complete_common_string()
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    " function! s:my_cr_function()
        " return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " endfunction
    " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><C-y>  neocomplete#close_popup()
    " inoremap <expr><C-e>  neocomplete#cancel_popup()
    " use jedi for python
    " autocmd FileType python setlocal omnifunc=jedi#completions
    " if !exists('g:neocomplete#force_omni_input_patterns')
    "     let g:neocomplete#force_omni_input_patterns = {}
    " endif
    " let g:neocomplete#force_omni_input_patterns.python =
    "         \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'
    " if !exists('g:neocomplete#sources#omni#functions')
    "     let g:neocomplete#sources#omni#functions = {}
    " endif
    " let g:neocomplete#sources#omni#functions.go = 'go#complete#Complete'
" }

" syntastic {
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1
    " let g:syntastic_check_on_open = 0
    " let g:syntastic_check_on_wq = 0
    " let g:syntastic_loc_list_height = 5

    " " Better :sign interface symbols
    " let g:syntastic_error_symbol = '✗'
    " let g:syntastic_warning_symbol = '!'

    " " Use flake8
    " let g:syntastic_python_checkers = ['flake8']

    " " pep8 max line length
    " let g:syntastic_python_flake8_args="--max-line-length=120"

" }

" validator.vim {
    " let g:validator_auto_open_quickfix = 1
    " let g:validator_python_flake8_args = '--max-line-length=120'
" }

" ale {
    " set statusline+=%{ALEGetStatusLine()}
    " let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = 'E:'
    let airline#extensions#ale#warning_symbol = 'W:'
    let g:ale_fixers = {
    \   'python': [
    \       'autopep8',
    \   ],
    \}
    let g:ale_python_flake8_options = '--max-line-length=120'
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '!'
    nmap <silent> ]; <Plug>(ale_next_wrap)
    nmap <silent> [; <Plug>(ale_previous_wrap)
" }

" ycm {
    " maps
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
    nnoremap K :YcmCompleter GetDoc<CR>
" }

" go {
    let g:go_fmt_command = "goimports"
" }

" indent-guides {
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
" }

" SimpylFold {
    let g:SimpylFold_docstring_preview = 1
" }

" split windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" automatically close quickfix if it's the only window left
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" FormatJSON command (usage: :FormatJSON)
com! FormatJSON %!python -m json.tool

" colorcolumn
set cc=120

" vertical diff
set diffopt+=vertical

" python folding
" set foldmethod=indent
" set foldlevel=99

" Reload Vimrc
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nnoremap <leader>c :copen<CR>
nnoremap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cnoremap w!! w !sudo tee % >/dev/null

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
inoremap <C-W> <C-O><C-W>

" select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
