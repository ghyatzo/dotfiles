set autochdir

" Wrap commands
set wrap
set linebreak
let &showbreak=""
set breakindent
set nolist
set spell
let g:tex_comment_nospell=1

set conceallevel=1
let g:tex_conceal='abdmgs'
let g:tex_flavor='latex'


" formatting options
set formatoptions=tq1jpw
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




" Figure out if we are in a mathzone
fun! IsMathZone()
    let l:mathZones = ['texMathZone', 'texMathZoneEnv', 'texMathZoneEnvStarred', 'texMathZoneX', 'texMathZoneXX', 'texMathZoneEnsured', 'texMathDelimZone']
    " let l:ignoreMathZone = ['texMathTextArg']

    let l:mathZonesIds = map(l:mathZones, { _, val -> hlID(val) })
    " let l:ignoreMathZoneId = hlID('texMathTextArg')

    " let l:synstackIDs = synstack(line('.'), col('.') - (col('.') >= 2 ? 1 : 0))

"     echomsg( 'synID (-1) :' . synID(line('.'), col('.') - (col('.') >= 2 ? 1 : 0), 1) . ' - ' .  synIDattr(synID(line('.'), col('.') - (col('.') >= 2 ? 1 : 0), 1), 'name') )
"     echomsg( 'synID :' . synID(line('.'), col('.'), 1) . ' - ' . synIDattr(synID(line('.'), col('.'), 1), 'name') )
"     for i in synstack(line('.'), col('.'))
"         echomsg(i)
"     endfor



    " echomsg('\tIsMathZone :' . index(l:mathZonesIds, synID(line('.'), col('.')-1, 1)) == -1 ? 0 : 1 )
    return ( index(l:mathZonesIds, reverse(synstack(line('.'), col('.')))[0]) == -1  ) ? v:false : v:true
endfun




"reformat lines {{{
fun! TeX_fmt()
    if (getline(".") != "")
        let save_cursor = getpos(".")
        let op_wrapscan = &wrapscan
        set nowrapscan
        let par_begin = '^\(%D\)\=\s*\($\|\\label\|\\begin\|\\end\|\\[\|\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
        let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\[\|\\]\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
        try
            exe '?'.par_begin.'?+'
        catch /E384/
            1
        endtry
        norm V
        try
            exe '/'.par_end.'/-'
        catch /E385/
            $
        endtry
        norm gq
        let &wrapscan = op_wrapscan
        call setpos('.', save_cursor)
    endif
endfun

nmap Q :call TeX_fmt()<CR>


