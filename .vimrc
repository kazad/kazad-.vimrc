" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
 

" Search basics
set incsearch
set ignorecase
set smartcase

" UI / Experience
set showmatch
set matchtime=5
set backspace=indent,eol,start " make backspace a more flexible
syntax on 

set scrolloff=7
set wildmode=longest,list

set lines=40
set columns=100

" remember 1000 marks, including globals
set viminfo='1000,f1

" Spaces, indentation, tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab
set smartindent

" Use spaces instead of tabs
set noerrorbells " don't make noise
set vb " turns off visual bell
set ruler

set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position

set showcmd " show the command being typed
" colorscheme ps_color "ir_black zenburn darkblue
colorscheme wombat3

" New Keyboard Mappings

" space / shift-space scroll in normal mode
" noremap <space> <C-f>
" noremap <S-space> <C-b>
noremap <space> 5j<RETURN> 
noremap <S-space> 5k<RETURN>

noremap <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
noremap <Enter> o<ESC>

" caps should move backwards, don't you think? And b is hard to reach.
map E ge
map W b

" in interactive mode, press ii or jj for escape 

:imap jj <esc>
:imap ii <esc>

" Make Arrow Keys Useful Again {
   map <down> <ESC>:bn<RETURN>
   map <left> <ESC>:NERDTreeToggle<RETURN>
   map <right> <ESC>:Tlist<RETURN>
   map <up> <ESC>:bp<RETURN>
" }

map k gk
map j gj

" Make vimrc easy to update
",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

