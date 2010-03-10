" for terminal colors
set t_Co=256

" Use Vim settings, rather then Vi settings (much better!).

" This must be first, because it changes other options as a side effect.
set nocompatible

" Search basics
set incsearch
set ignorecase
set smartcase

" UI / Experience
set hidden    " don't need to save buffers before switching


set showmatch
set matchtime=5
set backspace=indent,eol,start " make backspace a more flexible
syntax on 

set scrolloff=7
set wildmenu
set wildmode=longest,list
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set lines=40
set columns=100

set autoread        " watch for file changes

set cursorline

set ttyfast         " fast terminal

" remember 1000 marks, including globals
set viminfo='1000,f1

" Spaces, indentation, tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab
set smartindent

" display trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" no annoying messages
set shortmess=atI

" Buffers

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

" ctrl-a for increment... only use hex, not octal
set nrformats=hex

set showcmd " show the command being typed
" colorscheme ps_color "ir_black zenburn darkblue
" colorscheme wombat3
"colorscheme desert256

colorscheme wombat3

if has("gui_running")
  set autochdir       " change to buffer's directory (only for gui vim I guess?)
  colorscheme wombat3 
else
   colorscheme wombat256 
endif

" New Keyboard Mappings

" space / shift-space scroll in normal mode
" noremap <space> <C-f>
" noremap <S-space> <C-b>
noremap <space> 5j<RETURN> 
noremap <S-space> 5k<RETURN>

noremap <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
noremap <Enter> o<ESC>

" H and L not useful... but jump to end/start of line
map H ^
map L $

" After shifting a visual block, select it again
vnoremap < <gv
vnoremap > >gv

let mapleader = ","

"nicer window navigation
set mouse=a       " mouse can resize windows
set splitright
set splitbelow

map <C-j> <C-W>j 
map <C-k> <C-W>k 
map <C-h> <C-W>h 
map <C-l> <C-W>l
map - <C-W>- 
map + <C-W>+

" vim pasting is annoying by default... set and toggle paste before pasting it in
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>

" fuzzyfinder_textmate ********************************************************
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>

" Stupid shift key fixes
map :W :w            
map :WQ :wq
map :wQ :wq
map :Q :q

" tap F5 to toggle highlighting the search terms on and off
nnoremap <silent><F6> :set hlsearch!<CR>

" tap F3 to toggle line numbers
nnoremap <silent><F3> :set number!<CR>

" show spelling mistakes by pressing F10. Move over a word and press tap z= (not in insert mode) to get a list of suggestions 
noremap <silent><F5> :set spell!<CR>

" TODO: find a better mapping for end-of-line than '$'
" nnoremap <C-0> $

" backtick is a pain to reach
nnoremap ' `
nnoremap ` '

" in interactive mode, press ii or jj for escape 

:inoremap jj <esc>
:inoremap ii <esc>

" Make Arrow Keys Useful Again {
   map <down> <ESC>:bn<RETURN>
   map <left> <ESC>:NERDTreeToggle<RETURN>
   map <right> <ESC>:Tlist<RETURN>
   map <up> <ESC>:bp<RETURN>
" }

" scroll by virtual lines
map k gk
map j gj

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>



" neat -- tab autocomlpete (word or tab)
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" Make ',e' (in normal mode) give a prompt for opening files
" in the same dir as the current buffer's file.
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif


"Set backup dir, other options
set nobackup
set noswapfile

" Make vimrc easy to update
",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)

map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" custom filetypes
au BufNewFile,BufRead *.texshop set filetype=tex



