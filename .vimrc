" sporeball's vimrc

" basic stuff
set nocompatible
set number
set ruler
set hlsearch
set ignorecase
set backspace=indent,eol,start
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set cc=80
highlight ColorColumn ctermbg=8 " with hyper and hyper-snazzy, this corresponds to gray

" remove scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" syntax and background
syntax enable
set background=dark

" filetype plugins
filetype plugin on
filetype indent on

" auto read when file is changed from the outside
set autoread

" force all files to use 2 spaces as the indent
augroup ForceCorrectIndent
  autocmd!
  autocmd BufNewFile * :set ts=2 sts=2 sw=2 et
  autocmd BufReadPost * :set ts=2 sts=2 sw=2 et
augroup END

" no backups
set nobackup
set nowb
set noswapfile

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 24

" opens netrw in a split to the left of anything else opened, then takes focus away from netrw
" because of how this works, you should NOT use vim -p on the command line
" instead, just start vim without the p flag, then use :tabnew [file] within vim when you need to open something 
augroup ProjectDrawer
  autocmd!
  autocmd BufNewFile * :execute 'Vexplore' | wincmd p
  autocmd BufReadPost * :execute 'Vexplore' | wincmd p
augroup END

" disable anything that has to do with the mouse, including scrolling
set mouse=c