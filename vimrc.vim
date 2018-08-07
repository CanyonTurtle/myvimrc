

" ================= PLUGIN INSTALLATION ================ "


call plug#begin('~/vim/plugged')

Plug 'https://github.com/tpope/vim-sensible' " Standard vim defaults
Plug 'xolox/vim-misc' " library of vimscripts
Plug 'xolox/vim-easytags' " ctags generation
Plug 'majutsushi/tagbar' " F8 for ctags preview of a file
Plug 'tpope/vim-surround' " surround.vim
Plug 'tpope/vim-fugitive' " git control in vim
Plug 'airblade/vim-gitgutter' " git in side.
Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'christoomey/vim-tmux-navigator' " tmux and vim navigation
Plug 'sheerun/vim-polyglot' " Syntax support for lots of languages
Plug 'https://github.com/tpope/vim-sleuth' " detect indents automatically
Plug 'Yggdroot/indentLine' " indentation
Plug 'hzchirs/vim-material' " Color scheme
Plug 'scrooloose/nerdtree' " NERD tree
Plug 'luochen1990/rainbow' " rainbow parenthesis
Plug 'junegunn/goyo.vim' " minimal mode
Plug 'vim-airline/vim-airline-themes' " airline
Plug 'vim-airline/vim-airline'

" Deoplete
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'zchee/deoplete-clang' " Delplete C-family support
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' } " Deoplete for javascript
" Plug 'bling/vim-bufferline' " buffers in lines
" Plug 'edkolev/tmuxline.vim' " tmux shares airline theme

call plug#end()





" ============ PLUGIN SETTINGS AND MAPPINGS =========== "




"----- Deoplete -----
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

"----- fuzzy finder--------

" reveal dotfiles
let g:ctrlp_show_hidden = 1

" ignore directories where I expect lots of junk
let g:ctrlp_custom_ignore = '.exe\|bin\|node_modules\|DS_Store\|\.git'

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

"---- Vim Sleuth ----"
autocmd BufEnter * :Sleuth

"----- Vim Tmux Navigator -----"

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

"----- Vim Fugitive -----"
nnoremap <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
nnoremap <Leader>w :Gw<CR>
nnoremap <Leader>a :Gwrite .<CR>

" ----- NERDTree ------ "

" opening hotkey
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw=1

" open a nerdtree buffer intended as the folder opener.
noremap <leader>o :e ./<CR>/Bookmarks<CR>j:noh<CR>^
command! Ctrlo :norm <leader>o

" nerdtree on start
" autocmd vimenter * NERDTree

" close if only one remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ----- Rainbow Parenthesis -----"

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ----- clang deoplete ----- "
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" ----- Airline ------ "
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
"
" let g:airline_theme='material'
"
" let g:airline_section_z="%l:%c"
" let g:airline#extensions#tmuxline#enabled = 1
" let g:airline_section_y='--%1p%%-- %#__accent_bold#%l%#__restore__#:%c'
" let g:airline_section_z='sup'
" let g:airline_section_a='%q'
" let g:airline_section_x='%y'
" let g:airline_section_y='%l:%c'
let g:airline_section_z='%p%% %l:%c'
" let g:airline_section_z='%q'


" ----- Material ----- "
let g:material_style='default'

" ----- Tagbar ----- "
noremap <F8> :TagbarToggle<CR>

" ----- Goyo ----- "
noremap <leader>z :Goyo<CR>




" ============== GENERAL SETTINGS AND MAPPINGS ============== "




" favorite mappings
inoremap jk <ESC>
inoremap jl <ESC>:w<CR>
noremap ; :
noremap : ;

" coloring
" set t_Co=256
syntax enable
set background=dark
colorscheme vim-material

" Fixing indentation
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" numbering
set number relativenumber

" wildmenu options
set wildchar=<Tab> wildmenu wildmode=full

" search ignore case
set ignorecase

set hidden

" change directory to the current file
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" prepare buffers to easily switch to one
nnoremap <Leader>b :ls<CR>:b<Space>

" faster reaction time to commands, but harder to enter
set timeoutlen=350

" statusline
hi StatusLine cterm=bold gui=bold
hi StatusLineNC cterm=bold gui=bold

" scriptencoding utf-8

" cycle through buffers
noremap gb :bnext<CR>

" faster make
noremap <leader>m :make<CR>

" cycle through tabs with alt-h and alt-l
noremap <M-l> :tabnext<CR>
noremap <M-h> :tabprevious<CR>

" fast vimrc reload"
noremap <F5> :w<CR> :so ~/.dotfiles/vimrc.vim<CR>

