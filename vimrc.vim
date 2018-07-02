




" ================= PLUGIN INSTALLATION ================ "




call plug#begin('~/vim/plugged')

" Standard vim defaults
Plug 'https://github.com/tpope/vim-sensible'

" surround.vim
Plug 'tpope/vim-surround'

" vim git stuff
Plug 'tpope/vim-fugitive'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" the 'ranger' file browser integration
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" tmux and vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Auto-completion (haven't figured out yet)
" Plug 'Valloric/YouCompleteMe'

" Syntax support for lots of languages
Plug 'sheerun/vim-polyglot'

" detect indents automatically
Plug 'https://github.com/tpope/vim-sleuth'

" indentation
Plug 'Yggdroot/indentLine'

" Color schemes
Plug 'neutaaaaan/iosvkem'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'kaicataldo/material.vim'

" commenting
Plug 'scrooloose/nerdcommenter'

call plug#end()


" ============ PLUGIN FIXES =========== "



"----- fuzzy finder--------

" reveal dotfiles
let g:ctrlp_show_hidden = 1

" ignore directories where I expect lots of junk
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git'

"------ hybrid material -------

" font fixes
let g:enable_bold_font = 1
"let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1

" ----- material ------
"
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 <
	"https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
"  https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
"  >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) <
"  https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
"  >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
"  >
if (has("termguicolors"))
	set termguicolors
endif
" themes are default, dark, & palenight
let g:material_theme_style = 'default' 
let g:material_terminal_italics = 0

"---- Vim Sleuth ----"
autocmd BufEnter * :Sleuth

"----- Vim Tmux Navigator -----"

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

"----- Vim Fugitive -----"
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>w :Gw<CR>
nnoremap <Leader>a :Gwrite .<CR>

" ----- Nerd Commenter -----"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" ============== GENERAL SETTINGS ============== "




" keybinds
inoremap jk <ESC>
nmap ; :

" coloring
syntax enable
set background=dark
colorscheme material

" Fixing indentation
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" numbering
:set number

" wildmenu options
set wildchar=<Tab> wildmenu wildmode=full

" navigate to current dire
let @+="cd \"" . escape(getcwd(), "\"") . "\""

" search ignore case" 
set ignorecase

" directory netrw browser
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

let g:netrw_browse_split = 4

" change directory
nmap <leader>cd :cd %:p:h<CR>:pwd<CR>

" open Ranger in new window and change dirs to the new directory
nnoremap <silent> <C-o> :tabe .<CR> <bar> :Ranger<CR>
