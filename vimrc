execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
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

