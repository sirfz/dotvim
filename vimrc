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
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

" All Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on

syntax on
set nocompatible
set backspace=indent,eol,start
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

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

" Always show statusline
set laststatus=2

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

" pymode lint error sort
let g:pymode_lint_sort = ['E', 'C', 'I']

" disable rope in favor of jedi
" let g:pymode_rope = 0
" disable rope completion
let g:pymode_rope_completion = 0

" disable pymode documentation
let g:pymode_doc = 0

" pymode rope offer import after complete
" let g:pymode_rope_autoimport_import_after_complete = 1

" jedi mappings
let g:jedi#rename_command = "<leader>m"

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
