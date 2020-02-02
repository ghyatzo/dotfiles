" Convience - configs & mappings to smooth out rough edges and make vim feel like home

" Move between wrapped lines, rather than jumping over wrapped segments
nnoremap j gj
nnoremap k gk

" Change Escape key
inoremap jk <Esc>
inoremap jj <Esc>
inoremap kj <Esc>
inoremap kk <Esc>

" shortcuts to navigate between split windows easily
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Save file
nnoremap <C-s> :w<CR>

" copy and paste shortcuts
vnoremap <C-y> "+y
map <C-v> "+p

" Q for Ex mode is useless. This will run the macro in q register
nnoremap Q @q

" Swap 0 and ^. I tend to want to jump to the first non-whitespace character
" so make that the easier one to do.
nnoremap 0 ^
nnoremap ^ 0

" correct the spelling with <C-L>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" toggle syntax on or off
map <F2> :if exists("g:syntax_on") <Bar>
        \   syntax off <Bar>
        \ else <Bar>
        \   syntax enable <Bar>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" ---- PLUGINS

" Toggle goyo
nnoremap <leader>f :Goyo<CR>
nnoremap <leader>F :Goyo \| Limelight!!<CR>
autocmd! User GoyoLeave Limelight!
    \ | highlight Conceal guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
let g:limelight_default_coefficient = 0.8

" Nerdtree specific
map <leader>\ :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lf File manager plugin
let g:lf_map_keys=0
let g:NERDTreeHijackNetrw = 0 "use lf instead of NERDTREE for when opening a directory
let g:lf_replace_netrw = 1
map <leader>l :Lf<CR>
map <leader>t :LfNewTab<CR>






" ---- MISC

" automatically deletes all trailing whitespace on save
let ftToIgnore = ['snippets']
autocmd BufWritePost * if index(ftToIgnore, &ft) < 0 | %s/\s\+$//e

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

"vim:ft=vim
