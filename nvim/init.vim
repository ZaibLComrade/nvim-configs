:set listchars=tab:\|\ 
:set list
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set smartindent
:set foldmethod=marker

call plug#begin()
Plug 'andweeb/presence.nvim' " Discord RPC
Plug 'https://github.com/vim-airline/vim-airline' " Statusbar
Plug 'https://github.com/preservim/nerdtree' " Directory tree
Plug 'https://github.com/tpope/vim-commentary' " gcc and gc commentary
Plug 'https://github.com/ap/vim-css-color' " Retro css color
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Color Schemes
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer icons
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple cursor
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/alvan/vim-closetag' " Auto close tag
Plug 'https://github.com/tpope/vim-surround' " Change tags easily
Plug 'https://github.com/jiangmiao/auto-pairs' " Auto pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc autocompletion
Plug 'https://github.com/Pocco81/auto-save.nvim' " Auto Save
Plug 'https://github.com/othree/xml.vim' " Plugin for xml/html
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'} " Git plugin for coc git extension
Plug 'pangloss/vim-javascript' " Javascript syntax highlighting
Plug 'thinca/vim-quickrun' " Code Runner
Plug 'maxmellon/vim-jsx-pretty' " JSX syntax highlighting and indenting
Plug 'w0rp/ale' " ALE for eslint
Plug 'eslint/eslint' " ESLint

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:surround_indent = "2"
let g:surround_auto_indent = 1
let g:surround_auto_pairs = "<:>,*:*,%:%"

" NERDTree icons
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowExpandable='~'

" Refresh bracey
let g:bracey_refresh_on_save = 1

" coc <tab> autocompletion
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

augroup myCommands 
	autocmd!
	" autocmd BufEnter *.js call RunCode()
augroup end

" Funcions
function! RunCode()
	QuickRun	
endfunction


"Code runner shortcut
" nnoremap <C-c><C-c> :QuickRun | :wincmd H<CR>

nnoremap <C-c><C-c> :call RunCode()<CR>

"Learning vimscript
echo "Hello, Zaib!"

" Color group for quickfix output
" quickfix_highlight.vim

if exists('b:quickfix_highlight')
  finish
endif
let b:quickfix_highlight = 1

highlight default link CustomOutput Question
highlight default link SyntaxError ErrorMsg

function! HighlightQuickFix()
  " Clear existing quickfix highlights
  call clearmatches()

  " Loop through each quickfix line
  for i in range(1, getqflist({'nr': 0}).total)
    " Get the text of the quickfix line
    let line_text = getqflist({'idx': i}).text

    " Highlight the word 'syntaxerror' in red
    call matchadd('SyntaxError', '\vsyntaxerror', 0, i)

    " Highlight the rest of the line in green
    call matchadd('CustomOutput', line_text, 0, i)
  endfor
endfunction

" Run the function when entering the quickfix window
autocmd FileType qf call HighlightQuickFix()

" Presence
let g:presence_log_level = "debug"
let g:presence_buttons = 0
let g:presence_enable_line_number = 0

" prettier config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
