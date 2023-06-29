:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set autoindent

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Statusbar
Plug 'https://github.com/preservim/nerdtree' " Directory tree
Plug 'https://github.com/tpope/vim-commentary' " gcc and gc commentary
Plug 'https://github.com/ap/vim-css-color' " Retro css color
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color Schemes
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer icons
Plug 'https://github.com/tc50cal/vim-terminal' " Terminal inside vim
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple cursor
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/alvan/vim-closetag' " Auto close tag
Plug 'https://github.com/tpope/vim-surround' " Change tags easily
Plug 'https://github.com/jiangmiao/auto-pairs' " Auto pairs
Plug 'turbio/bracey.vim' " Live server (Test)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc autocompletion
Plug 'https://github.com/Pocco81/auto-save.nvim' " Auto Save

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" NERDTree icons
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowExpandable='~'

" Autosave
" au BufRead,BufNewFile * let b:save_time = localtime()
" au CursorHold * call UpdateFile()
let g:autosave_time = 0.1
" 	if((localtime() - b:save_time) >= g:autosave_time)
" 		update
" 		let b:save_time = localtime()
" 	else
" 		" just debugging info
" 		echo "[+] ". (localtime() - b:save_time) ." seconds have elapsed so far."
" 	endif
" endfunction


" Refresh bracey
let g:bracey_refresh_on_save = 1

" coc <tab> autocompletion
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
