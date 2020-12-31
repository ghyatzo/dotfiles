
" Vimrc
"
" This file contains the minimal settings to set the foundation, with the
" majority of the configuration and settings living in files spread between
" vim/rcfiles and vim/rcplugins

" Need to set the leader before defining any leader mappings
let mapleader = ","

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-repeat' "'dot' repeat to other plugins
Plug 'tpope/vim-surround' "surrounding characters recognition
" syntax: <cmd>s<old>[<new>] reference the surrounding <old> char, <cmd>: d, c (others ?)
"         ys<txt_obj><char> surround <txt_obj> with <char>

Plug 'tpope/vim-commentary' "multiple line comment
" syntax: gcc comment current line
"         gc<txt_obj> comment txt_obj
"         [Visual]gc  comment selection
Plug 'christoomey/vim-system-copy' "copy to and from system clipboard
" syntax: cp<txt_obj> copy <text_obj>
"         cP          copy entire line
"         cv          paste syst-clipb to the next line
"         otherwise cmd-c and cmd-v still works
Plug 'kana/vim-textobj-user' " Adds support to various text_objects
  " line: al (w/ whitespaces) il (w/o whitespaces)
  " indent: i  (same intentation or more) I  (only same indentation)
  "         ai (doesn't skip empty lines) ii (stops at first empty line)
  " entire: ae (whole buffer) ie (whole buffer without leading and trailing empty
  "             lines)
Plug 'kana/vim-textobj-indent'
Plug 'scrooloose/nerdtree'

"LF file manager vim plugin
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

" Goyo (soft-wrap substitute)
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'lervag/vimtex'
Plug 'lifepillar/vim-mucomplete'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'

" Julia-vim, syntax and more!
Plug 'JuliaLang/julia-vim'


" --- !!! COLOR SCHEMES !!! ---
Plug 'rudrab/vim-coogle'
Plug 'aradunovic/perun.vim'
Plug 'kadekillary/subtle_solo'
Plug 'lifepillar/vim-solarized8'
Plug 'AlessandroYorba/despacio'
Plug 'ayu-theme/ayu-vim'
call plug#end()


" ----- BASIC ----
filetype plugin indent on
syntax on

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set history=1000
set undolevels=500
set shell=/usr/local/bin/zsh
set clipboard=unnamedplus
set mouse=a
set updatetime=100

set showcmd       "display incomplete commands
set laststatus=2  "always display the statusline
set autowrite
set autoread

" ---- FORMATTING ----
set tabstop=4   " how many spaces is the tab character worth
set softtabstop=4 " ask how many spaces pressing tab adds and how many pressing backspace removes
set expandtab
set smarttab
set shiftwidth=4  " how manu spaces is a level of indentation
set shiftround
set autoindent
set nojoinspaces " dont insert two spaces after dots after a join

set number
set ruler
set numberwidth=5
set relativenumber

let g:is_posix=1

set list listchars=tab:»·,trail:·,nbsp:·
autocmd FileType * setlocal formatoptions-=ro
autocmd FileType * setlocal formatoptions+=j
" r: dont automatically insert current comment leader after hitting o or O
" o: dont automatically insert the current comment leader after hitting ,Enter> in insert mode
" j: remove comment leader when joining two comment lines
" beware, c format option is still active
" that mean that even with soft wrap
" comments still get hard wrapped to new lines
" after 80 chars.

" ---- WRAPPING -----
" wrapping: soft wrap (using Goyo)
set wrap  " make vim wrap the text
set linebreak " wrap only at line bounduaries
let &showbreak="\ "
set breakindent

set textwidth=0

" ----- SEARCH ----
set incsearch   " enables incremental search, showing matches while still typing
set nohlsearch
set ignorecase
set smartcase
set noshowmode

" ---- SPELLING ----
setlocal spell
set spelllang=it,en_gb

" ---- VISUALS ---
"set colorcolumn=90
set sidescroll=5      " when scrolling horizzontally move 5 columns at a time
set sidescrolloff=5   " when scrolling horizzontally always show 5 columns after the current cursor position

set splitbelow
set splitright
set diffopt=filler,vertical,iwhite "ignore whitespace only changes and always use vertical diffs

set termguicolors

let ayucolor="mirage"  " options: light, mirage, dark(default)
colorscheme ayu


" colorscheme despacio
" let g:despacio_sunset = 1

" fix concealment
highlight Conceal guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE

"look on your left
highlight CursorLineNr guifg=Orange

" automatically rebalance windows on resize
autocmd VimResized * :wincmd =

" ---- COMPLETION ----
" tab completion:
"   will insert tab at beginning of line
"   will use completion if not at beginning
set wildmode=list:longest,list:full

" search down into subfolders (max depth n) otherwise lags so fucking much
" tab-completion for file related stuff
set path+=**3
set path-=/usr/include "fix

" set where to look when completing
"( let this be handled by mucomplete)
set complete-=i,kspell,t


" ---- PLUGIN SPECIFIG ----

" vim-mucomplete settings ------------------------------------
set completeopt+=menuone,noinsert,noselect
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#tab_when_no_results = 1
let g:mucomplete#completion_delay = 0

let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni', 'incl', 'line'],
    \ 'vim' : ['path', 'cmd', 'incl'],
    \ 'tex' : ['vsnip','path', 'line']
    \ }

" Vsnip ---------------------------------------------------
let g:vsnip_snippet_dir = expand('~/.config/nvim/ftplugin')
let g:vsnip_choice_delay = 500
let g:vsnip_namespace = ''

" Lf file manager ---------------------------------------
let g:lf_map_keys=0
let g:NERDTreeHijackNetrw=0 "use lf instead of nerd tree when opening a directory
let g:lf_replace_netrw=1

" Goyo and limelight ------------------------------------------
" let g:goyo_width = '80%'
let g:limelight_default_coefficient = 0.8

autocmd! User GoyoEnter set nu rnu
autocmd! User GoyoLeave Limelight!
    \ | highlight Conceal guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE

" vimtex ---------------------------------------------------------
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_complete_enabled=1

autocmd BufRead,BufNewFile *.tex set filetype=tex

" Loads all the rcfiles ---------------------------------------------------------------
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('rcfiles')

