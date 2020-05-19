" Plugins 
call plug#begin('~/.config/share/nvim/plugged')

" General plugins
Plug 'tpope/vim-sensible' " standards
Plug 'sheerun/vim-polyglot' " language pack
Plug 'valloric/youcompleteme' " probably best completition engine for vim 
Plug 'vim-airline/vim-airline' " airline (status bar :P)
Plug 'vim-airline/vim-airline-themes' " status bar themes
Plug 'vim-syntastic/syntastic' " syntax checker note that it require syntax checker like flake8 or pylint
Plug 'raimondi/delimitmate' " auto closing quotes/brackets etc
Plug 'joshdick/onedark.vim' " color theme
Plug 'scrooloose/nerdcommenter' " NERDCommenter :)
Plug 'scrooloose/nerdtree' " NERDTree
Plug 'aliou/bats.vim' " bats bash automated testing system

" Python plugins
Plug 'davidhalter/jedi-vim' " problem with youcompleteme so completitions are disabled


call plug#end()

" General config
" set tab as 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" set clipboard to system global clipboard
set clipboard=unnamedplus

" Backgrounds and truecolor
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme onedark

" Set airline theme
let g:airline_theme='cool'

" go to different screen with ctrl JKLH
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Python plugins config
let g:jedi#completions_enabled = 0 " See plugin section


" Go plugin config
" TODO after learning go :))
