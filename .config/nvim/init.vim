set clipboard+=unnamedplus
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
inoremap <silent> jj <ESC>
set completeopt=noselect,noinsert


if has('persistent_undo')
	let undo_path = expand('~/.config/nvim/.undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.config/nvim/lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif
" Required:
call dein#begin('~/.dein')

" Let dein manage dein
" Required:
call dein#add('~/.dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Enable to use node on nvm

if has('nvim')
	if system('echo $SHELL') == system('which sh')
		call system('export NVM_DIR=$HOME/.nvm && [-s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"')
	endif
endif
