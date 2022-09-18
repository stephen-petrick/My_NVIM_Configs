"Install vim-plug if it's not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.local/share/nvim/plugged')

"Color schemes
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'bluz71/vim-nightfly-guicolors'

"Actual Plugins
Plug 'jiangmiao/auto-pairs' "Automatically adds [,{, etc and lets you navigate them like in an IDE
Plug 'airblade/vim-gitgutter' "Shows you lines that will be changed in commit and navigate them
Plug 'tpope/vim-fugitive' "Git plugin that lets you do more Git commands easily in NVim
"Plug 'ms-jpq/coq_nvim' "Auto-completion, preview man pages, and lots of other things. Need to research this one more, got confused with COC
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Main COC plugin
"Plug 'dense-analysis/ale' "Linting (checks for errors) w/o having to save first
"Plug 'ms-jpq/chadtree' "File Manager
Plug 'vim-airline/vim-airline' "Status line bar, amongst other file statuses
Plug 'pangloss/vim-javascript' "Javascript syntax highlighter (to have proper highlighting for React)

call plug#end()

"coc plugins
"   \'coc-rome', "potentially good LSP for HTML, JS, CSS, and others combined
"   into one, but still in development currently
let g:coc_global_extensions = [
   \'coc-marketplace',
   \'coc-explorer',
   \'coc-jedi',
   \'coc-tsserver',
   \'coc-html',
   \'coc-css',
   \'coc-java',
   \'coc-xml']
"marketplace - view and install other plugins
"explorer - file explorer and manager
"jedi - Python LSP. Not sure of difference between it and Pyright
"TSServer - JS and Typescript LSP. Switch to coc-rome when Rome is more
"developed, as Rome covers more languages (HTML, CSS)
"html - HTML LSP
"css - CSS LSP


"Commands to execute on set up
":CHADopen
"autocmd VimEnter * <Cmd>CocCommand explorer "launches coc-explorer on startup. not
"working as of 3/21/22. get an error for explorer on startup

"Vim preferences
set number "sets line numbers on the side of the screen
syntax on "can set color scheme also with 'colorscheme'
colorscheme edge
set background=dark "hopefully makes colorschemes better
"best to have tabstop, shiftwidth, and softtabstop all set to same value for consistency. otherwise, may not act as intended
set tabstop=3 "sets tabs to be 3 spaces
set shiftwidth=3 "number of spaces used for when indenting in normal mode with < or >
set softtabstop=3 "number of spaces that backspace will delete
set expandtab "set tab to be spaces
set autoindent "auto indent every line

"Vim Preferences

"overrides Auto-Pairs default
let g:AutoPairsShortcutToggle='zp'                                                                                
"remove highlighting until next search                                                                            
nnoremap <F4> :nohl<CR>                                                                                           
"Eman's window navigation mappings                                                                                
nnoremap <C-h> <C-w>h                                                                                             
nnoremap <C-j> <C-w>j                                                                                             
nnoremap <C-k> <C-w>k                                                                                             
nnoremap <C-l> <C-w>l   

nnoremap <C-s> <C-u>


"Airline preferences
let g:airline#extensions#tabline#enabled = 1 "displays all tabs
let g:airline#extensions#tabline#buffer_nr_show = 1

"Sub Config Files
"other files used for vim config but stored in separate directories and files
"for organizational purposes

"seems to be Linux only. changing to support multiple OS
"source $HOME/.config/nvim/plug-config/coc.vim "potentially incorrect pathing;
execute printf('source %s/plug-config/coc.vim',stdpath('config'))
