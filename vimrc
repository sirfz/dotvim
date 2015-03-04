set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
" Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'tmhedberg/SimpylFold'

" All Plugins must be added before the following line
call vundle#end()            

syntax on
filetype plugin indent on
set number
set title

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
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql " Setting text and comment formatting to auto
set textwidth=120 " Lines are automatically wrapped after 80 columns

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

" NERDTree
" ctrl+n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>
" close vim if NERD is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
    " let g:airline_theme = "powerlineish"

    " powerline statusline
    " set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" }

" 256/16 colours (Use what's supported by your terminal)
set t_Co=16

" colorscheme
set background=dark
colorscheme solarized

" fancy (for gvim)
" let g:Powerline_symbols='fancy'
" set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
set guifont=Source\ Code\ Pro\ for\ Powerline\ 12

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

" jedi-vim {
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_on_dot = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_enabled = 0
    let g:jedi#completions_command = ""
    let g:jedi#show_call_signatures = "1"
    let g:jedi#goto_assignments_command = ""
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>pu"
    let g:jedi#rename_command = "<leader>pr"
    " jedi mappings
    let g:jedi#rename_command = "<leader>m"
" }

" syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    " Better :sign interface symbols
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '!'

    " Use flake8
    let g:syntastic_python_checkers = ['flake8']

    " pep8 max line length
    let g:syntastic_python_flake8_args="--max-line-length=120"

" } 

" ycm {
    " maps
    nnoremap <leader>g :YcmCompleter GoTo<CR>
    let g:ycm_goto_buffer_command = 'new-tab'
    let g:ycm_autoclose_preview_window_after_completion = 1
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
set diffopt=filler,vertical

" python folding
" set foldmethod=indent
" set foldlevel=99

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>
