" sporeball's vimrc

" plugins used here:
" - vim-airline
" - vim-airline-themes
" - vim-commentary
" - vim-javascript

" basic stuff
set number
set ruler
set hlsearch
set ignorecase
set backspace=indent,eol,start
set noeb vb t_vb=
set noshowmode
au GUIEnter * set vb t_vb=

" no backups
set nobackup
set nowb
set noswapfile

" auto read when file is changed from the outside
set autoread

" remove scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" syntax and background
syntax enable
set background=dark

" italics
highlight Comment cterm=italic gui=italic
highlight Type cterm=italic gui=italic

" filetype plugins
filetype plugin on
filetype indent on

" remaps
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <backspace> <nop>
nnoremap <Space> <nop>
nnoremap <cr> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

noremap <silent> <C-_> :Commentary<cr>

nnoremap <esc><esc> :noh<cr>:<backspace>

" autocmds
augroup Startup
  autocmd!
  autocmd VimEnter * :set shortmess=I
augroup END

" force all files to use 2 spaces as the indent
augroup ForceCorrectIndent
  autocmd!
  autocmd BufNewFile,BufReadPost * :set ts=2 sts=2 sw=2 et
augroup END

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" commands
command Q q|q " shorthand for quitting twice

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 13

" opens netrw in a split to the left of anything else opened, then takes focus away from it
augroup ProjectDrawer
  autocmd!
  autocmd BufNewFile,BufReadPost * :execute 'Vexplore' | wincmd p
  autocmd VimEnter * if &ft is 'netrw' | sil! wincmd w | endif
augroup END

" syntax highlighting settings
let g:javascript_plugin_jsdoc = 1

" airline settings
let g:airline_theme = 'base16_snazzy'
function! AirlineInit()
  let g:airline_section_x = airline#section#create([''])
  let g:airline_section_y = airline#section#create(['%y'])
  let g:airline_section_z = airline#section#create_right(['%l/%L : %c', '%p%%'])
endfunction
autocmd BufNewFile,BufReadPost,VimEnter * call AirlineInit()
