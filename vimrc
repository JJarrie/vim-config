execute pathogen#infect()

" Enable filetype plugin
filetype plugin on

" Enable syntaxic coloration
syntax on
filetype plugin indent on

" Force UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Theme's settings
" color dracula
let g:colors_name = 'dracula'
set t_Co=256
" set guifont=Anonymice\ Powerline:h12
" set background=dark
" set colorcolumn=110
" highlight ColorColumn ctermbg=darkgray

" Generic settings
set number
set hidden
set history=100
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set laststatus=2
set nocompatible
set textwidth=120

" Lightline's configuration
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '▶', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" NERDTree's configuration
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\DS_Store', '\~$', '\.swp']

" GitGutter's configuration
let g:gitgutter_sign_column_always=1

"""""""""""""
" Functions "
"""""""""""""

function! FindTextInFile()
    call inputsave()
    let textToFind = input('Finding text:')
    call inputrestore()
    execute '!find . -type f -exec grep -nH "'.textToFind.'" {} \;'
endfunction

""""""""""""""
" Keybinding "
""""""""""""""

let mapleader=" "

" Save in all mode
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

map <Leader>s :source ~/.vimrc<CR>
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
nnoremap <Leader><Leader> :e#<CR>
noremap <Leader>r :CommandTFlush<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>j :NERDTreeFind<CR>

nnoremap <F3> :call FindTextInFile()<CR>

" Startup's settings
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
