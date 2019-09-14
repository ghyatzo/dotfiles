set autochdir

" Wrap commands
set wrap
set linebreak
set breakindent
set nolist

set wrapmargin=0
set textwidth=0

" Jump to next placeholder <++>
inoremap <tab><tab> <Esc>/<++><CR>ca<

" Goyo remove line numbers
autocmd User GoyoEnter nested set nonumber
autocmd User GoyoEnter nested set norelativenumber


" formatting options
set formatoptions+=2

" Map to allow for forward tex to pdf syncronization on skim
noremap <leader>r    :w<CR>:!/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR><CR>

" Preview current file in skim
noremap <leader>p    :w<CR>
  \:silent exe "! vim_open_skim.sh " . shellescape(expand("%:p:r")) . ".pdf"<CR>

" Compile the document
noremap <leader>b    :! vim_build_tex.sh %<CR>
