call plug#begin('~/.local/share/nvim/plugged')

"Color schemes
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'

"Actual Plugins
Plug 'jiangmiao/auto-pairs' "Automatically adds [,{, etc and lets you navigate them like in an IDE
Plug 'airblade/vim-gitgutter' "Shows you lines that will be changed in commit and navigate them
Plug 'tpope/vim-fugitive' "Git plugin that lets you do more Git commands easily in NVim
Plug 'ms-jpq/coq_nvim' "Auto-completion, preview man pages, and lots of other things
Plug 'dense-analysis/ale' "Linting (checks for errors) w/o having to save first
Plug 'ms-jpq/chadtree' "File Manager

call plug#end()

"Commands to execute on set up
":CHADopen

"Vim preferences
set number "sets line numbers on the side of the screen
syntax on "can set color scheme also with 'colorscheme'
colorscheme edge
"best to have tabstop, shiftwidth, and softtabstop all set to same value for consistency. otherwise, may not act as intended
set tabstop=3 "sets tabs to be 3 spaces
set shiftwidth=3 "number of spaces used for when indenting in normal mode with < or >
set softtabstop=3 "number of spaces that backspace will delete
set expandtab "set tab to be spaces
set autoindent "auto indent every line

"Vim Preferences

"overrides Auto-Pairs default toggling                                                                            
let g:AutoPairsShortcutToggle='zp'                                                                                
"remove highlighting until next search                                                                            
nnoremap <F4> :nohl<CR>                                                                                           
"Eman's window navigation mappings                                                                                
nnoremap <C-h> <C-w>h                                                                                             
nnoremap <C-j> <C-w>j                                                                                             
nnoremap <C-k> <C-w>k                                                                                             
nnoremap <C-l> <C-w>l   