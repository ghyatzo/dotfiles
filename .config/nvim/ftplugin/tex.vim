set autochdir

" Wrap commands
set wrap
set linebreak
let &showbreak=""
set breakindent
set nolist

set wrapmargin=0
set textwidth=0

" Goyo remove line numbers
autocmd User GoyoEnter nested set relativenumber

" formatting options
set formatoptions=atcq1jpw
" a: enables auto-format: texwidth, if 0 use 79, or width of window.
" t: enable auto format for text
" c: enable auto format for comments
" 2: when formatting use indent of second line of paragraph for rest of the paragraph, need
" 'autoindent'
" 1: Don't break a line after a one-letter word, broken before if possible.
" j: removes comment leader on line join.
" p: don't break lines at single spaces after periods.
" w: if a line ends by a whitespace it indicates that the paragraph continues in the next line.



" label cycling if \label{fig:something} then on the ref
" \ref{fig: <C-n> will cycle through all the figures labels yay
set iskeyword+=:

" vimtex stuff
autocmd VimLeave *.tex :VimtexClean

" Map to allow for forward tex to pdf syncronization on skim
noremap <leader>r    :w<CR>:!/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR><CR>

" Preview current file in skim
noremap <leader>p    :w<CR> :silent exe "! vim_open_skim.sh " . shellescape(expand("%:p:r")) . ".pdf"<CR>

" Compile the document
noremap <leader>b    :! vim_build_tex.sh %<CR>

" Snippets
