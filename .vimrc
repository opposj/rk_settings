set number
set showcmd
set t_Co=256
color desert
syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4

set wildmenu
set wildoptions=pum
set wildignore=*.exe,*.dll,*.pdb
set hidden

set cursorline
set is
set ignorecase
set smartcase
set ruler
set gp=git\ grep\ -n
set backupcopy=yes

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

packadd! jedi-vim

noremap <leader>bda :w<CR>:%bd!\|e#\|bd!#<CR>
