" Commands from https://github.com/nir9/welcome/blob/master/.vimrc
set number
color desert
syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4

set wildmenu
set wildoptions=pum
set wildignore=*.exe,*.dll,*.pdb,*.swp,*.swo,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set hidden

set cursorline
set is
set ignorecase
set smartcase
set ruler
set backupcopy=yes

" My commands
set encoding=utf-8
set shell=bash
set showcmd
set t_Co=256
set path^=/usr/include/x86_64-linux-gnu

let s:gp = 'rg --vimgrep -g !/tags'
let s:file_gp = 'rg --files -g'

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

packadd! jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = '0'
packadd! cfilter
packadd! vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_presentation_hint_hl = {'deemphasize': 'TitleBarNC', 'subtle': 'TitleBarNC'}

function! s:grep_helper(args) abort
	let args_list = split(a:args, '\s\+')
	let pattern = args_list[0]
	let search_paths = len(args_list) == 1 ? join(filter(split(&path, ','), '!empty(v:val)'), ' ') : join(args_list[1:], ' ')
	return pattern .. ' ' .. search_paths
endfunction

command! -nargs=+ -complete=file_in_path Grep cgetexpr system(s:gp .. ' ' .. s:grep_helper(<q-args>)) | copen
command! -nargs=+ -complete=file_in_path Find cgetexpr system(s:file_gp .. ' ' .. s:grep_helper(<q-args>)) | copen

nnoremap <leader>p `[v`]
nnoremap <leader>gp :<C-u>Grep <C-r><C-w><CR> 
nnoremap <leader>bda :<C-u>w<CR>:<C-u>%bd!\|e#\|bd!#<CR>
nnoremap <expr> <leader>o &buftype == 'quickfix' ? "^3ly$:\<C-u>new \<C-r>0\<CR>" : ''
nnoremap <C-w><leader>d :<C-u>let g:jedi#use_splits_not_buffers = 'winwidth'<CR>:<C-u>call jedi#goto()<CR>:<C-u>let g:jedi#use_splits_not_buffers = ''<CR>
nnoremap <leader>e <plug>VimspectorBalloonEval
xnoremap <leader>e <plug>VimspectorBalloonEval
nnoremap <leader><S-b> <plug>VimspectorBreakpoints
nnoremap <leader>vsr :<C-u>VimspectorReset<CR>
