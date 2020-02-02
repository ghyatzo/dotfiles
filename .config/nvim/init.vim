
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
" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-entire'
Plug 'scrooloose/nerdtree'

"LF file manager vim plugin
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

" Goyo (soft-wrap substitute)
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Vimtex
Plug 'lervag/vimtex'

" UltiSnips
Plug 'SirVer/ultisnips'

" gitGutter
Plug 'airblade/vim-gitgutter'

" Julia-vim, syntax and more!
Plug 'JuliaLang/julia-vim'

" --- !!! COLOR SCHEMES !!! ---
Plug 'rudrab/vim-coogle'
" Plug 'aradunovic/perun.vim'
" Plug 'kadekillary/subtle_solo'
" Plug 'nightsense/cosmic_latte'
" Plug 'lifepillar/vim-solarized8'
Plug 'AlessandroYorba/despacio'
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

set showcmd   " display incomplete commands
set laststatus=2  "always display the statusline
set autowrite
set autoread

" ---- FORMATTING ----
set tabstop=4   " how many spaces is the tab character worth
set softtabstop=4 " ask how many spaces pressing tab adds and how many pressing backspace removes
set shiftwidth=4  " how manu spaces is a level of indentation
set expandtab
set smarttab
set shiftround
set autoindent
set nojoinspaces " dont insert two spaces after dots after a join

set number
set ruler
set numberwidth=5
set relativenumber

let g:is_posix=1

set list listchars=tab:»·,trail:·,nbsp:·
autocmd FileType * setlocal
  \ formatoptions-=r " dont automatically insert the current comment leader after hitting ,Enter> in insert mode
  \ formatoptions-=o  " dont automaticalli insert current comment leader after hitting o or O
  \ formatoptions+=j  " remove comment leader when joining two comment lines
  " beware, c format option is still active
  " that mean that even with soft wrap
  " comments still get hard wrapped to new lines
  " after 80 chars.

" ---- WRAPPING -----
" wrapping: soft wrap (using Goyo)
set wrap  " make vim wrap the text
set linebreak " wrap only at line bounduaries
let &showbreak="\\ "
set breakindent

set textwidth=100 "text width for comment wrapping and goyo width
set wrapmargin=0  " wrap a little bit before the window margin
" autocmd FileType * setlocal
"   \ formatoptions-=t  " enable text autowrap


" ----- SEARCH ----
set incsearch   " enables incremental search, showing matches while still typing
set hlsearch
set ignorecase
set smartcase

" ---- SPELLING ----
setlocal spell
set spelllang=it,en_gb

" ---- VISUALS ---
set colorcolumn=80
set sidescroll=5      " when scrolling horizzontally move 5 columns at a time
set sidescrolloff=5   " when scrolling horizzontally always show 5 columns after the current cursor position

set splitbelow
set splitright
set diffopt=filler,vertical,iwhite "ignore whitespace only changes and always use vertical diffs

set termguicolors
let g:despacio_sunset = 1
colorscheme despacio
" fix concealment
highlight Conceal guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE

" automatically rebalance windows on resize
autocmd VimResized * :wincmd =

" ---- COMPLETION ----
" tab completion:
"   will insert tab at beginning of line
"   will use completion if not at beginning
set wildmode=list:longest,list:full

" search down into subfolders (max depth n) otherwise lags so fucking much
" tab-completion for file related stuff
set path+=**5
set path-=/usr/include "fix

" set where to look when completing
set complete+=i,kspell


" ---- PLUGIN SPECIFIG ----
" Goyo line number enable
autocmd! User GoyoEnter nested set number
autocmd! User GoyoEnter nested set relativenumber
" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
" concealment of redundant syntax unless im on the line.
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "ftplugin"]

autocmd BufRead,BufNewFile *.tex set filetype=tex

" Loads all the rcfiles
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction


call s:SourceConfigFilesIn('rcfiles')

