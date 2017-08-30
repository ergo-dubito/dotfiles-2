"*********************************************************************
" General
"*********************************************************************

" Make Vim more useful
set nocompatible

" Optimize for fast terminal connections
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Ignore case of searches
set ignorecase

" When searching try to be smart about cases
set smartcase

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Don’t add empty newlines at the end of files
" set binary
" set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
  set undofile
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Change mapleader
let mapleader=" "

"*********************************************************************
" Appearance
"*********************************************************************

set background=dark
syntax enable

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Enable line numbers
set number

" Show the cursor position
set ruler

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around
set nostartofline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch

" Make tabs as wide as two spaces
set tabstop=2

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

"*********************************************************************
" Plugins
"*********************************************************************

let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
  echo "Installing vim-plug..."
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'chiel92/vim-autoformat'
Plug 'crusoexia/vim-javascript-lib'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'gorodinskiy/vim-coloresque'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
Plug 'houtsnip/vim-emacscommandline'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --tern-completer'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'

" junegunn/fzf
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" scrooloose/nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMapJumpNextSibling = '<C-n>'
let NERDTreeMapJumpPrevSibling = '<C-p>'

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" Valloric/YouCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" vim-airline/vim-airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" w0rp/ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'html': ['htmlhint'],
\ }

"*********************************************************************
" Keymap
"*********************************************************************

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-k> <C-r>=<SID>kill_line()<CR>

autocmd BufNewFile,BufRead *.js nmap <silent> <C-l> <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.py nmap <silent> <C-l> <Plug>(pydocstring)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Save a file as root
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>gc :BCommits<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>f :Files<space>
nnoremap <leader>gg :GGrep<space>
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>= :Autoformat<CR>

"*********************************************************************
" Overrides
"*********************************************************************

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
