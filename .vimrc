" sporeball's vimrc

" plugins used here:
" - vim-airline
" - vim-airline-themes
" - vim-commentary
" - vim-javascript
" - typescript-vim
" - coc.nvim, with coc-tsserver installed

" basic stuff
set number
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set noeb vb t_vb=
set noshowmode
set encoding=utf-8
set hidden
set t_Co=256
au GUIEnter * set vb t_vb=

" no backups
set nobackup
set nowb
set noswapfile

set cmdheight=2
set updatetime=300

" auto read when file is changed from the outside
set autoread

" remove scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" fillchars
set fillchars+=vert:\ 
set fillchars+=eob:\ 

" syntax and background
syntax enable
set background=dark

" highlight rules
highlight Number ctermfg=213
highlight String ctermfg=156
highlight jsTemplateString ctermfg=228
highlight Comment cterm=italic gui=italic
highlight Type cterm=italic gui=italic
highlight MatchParen cterm=italic gui=italic ctermbg=black ctermfg=cyan
highlight Pmenu ctermfg=magenta ctermbg=black
highlight PmenuSel ctermfg=magenta ctermbg=black
highlight CocErrorSign guibg=black guifg=red
highlight CocInfoSign guibg=black
highlight CocWarningSign guibg=black

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
inoremap <esc>[1;3A <nop>
inoremap <esc>[1;3B <nop>
inoremap <esc>[1;3C <nop>
inoremap <esc>[1;3D <nop>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <esc><esc> :noh<cr>:<backspace>
noremap <silent> <C-n> <C-w>w
noremap <silent> <C-_> :Commentary<cr>

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
