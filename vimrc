execute pathogen#infect()

syntax on
filetype plugin indent on

set guifont=Hack-Regular\ 11
set background=dark
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set number
set hidden
set history=100
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set laststatus=2

let mapleader=" "

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\DS_Store', '\~$', '\.swp']

let g:gitgutter_sign_column_always=1

map <Leader>s :source ~/.vimrc<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
nnoremap <Leader><Leader> :e#<CR>
noremap <Leader>r :CommandTFlush<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>j :NERDTreeFind<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

colorscheme solarized
