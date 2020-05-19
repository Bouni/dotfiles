" decide wether we use vim or neovim
if has('nvim')
    let $VIMHOME = '~/.config/nvim'
els
    let $VIMHOME = '~/.vim'
endif

" set the plugvim path
let $PLUGVIM = expand($VIMHOME . '/autoload/plug.vim')

" If vim-plug is not installed, do so and install all listed plugins
" That allows us to deploy this .vimrc on a target system and have vim setup
" automagicaly within seconds
if empty(glob($PLUGVIM))
  silent !curl -fLo $PLUGVIM --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" List of Plugins
call plug#begin($VIMHOME . '/plugged')
" VIM which key
Plug 'liuchengxu/vim-which-key'
" VIM wiki                                                                                         
Plug 'vimwiki/vimwiki'  
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Color scheme
Plug 'sheerun/vim-wombat-scheme'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
" A collection of themes for vim-airline 
Plug 'vim-airline/vim-airline-themes'
" Vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-eunuch'
" Text alignment
Plug 'godlygeek/tabular'
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'plasticboy/vim-markdown'
" The uncompromising Python code formatter
Plug 'psf/black', { 'tag': '19.10b0' }
" Vim plugin to sort python imports
Plug 'fisadev/vim-isort'
" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" map leader to space                                                                              
let mapleader=" "                                                                                  

" which key config
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" configure vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',                                                       
                      \ 'syntax': 'markdown', 'ext': '.md'}]    

" coc config
let $COC = expand($VIMHOME . '/coc.vim')
source $COC

" set my default printer for hardcopy
set pdev=Samsung_M2070

" set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=0 " 4
set smarttab
set expandtab
set number
set nowrap
set nobackup
set nowritebackup
set noswapfile
set nofoldenable
set matchpairs=(:),[:],{:},<:>,":",':'
set mouse=r

syntax on
silent! colorscheme wombat " srcery

let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'

" Linters for ale plugin
let b:ale_linters = ['pyflakes', 'flake8', 'pylint']

" Clear search highlite with ESC
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Map Black to F1
map <f1> :Black<CR>

" Map Isort to F2
map <f2> :Isort<CR>

" Toggle line numbers with F4
map <f4> :set invnumber<CR>

" Enable Paste mode with F5
set pastetoggle=<f5>

" indent Yaml items correctly
let g:yaml_formatter_indent_collection=1

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

