" Statusline settings

" enable statusbar and customize it
set statusline=%!MyStatusLine()

function! MyStatusLine()
  let statusline = ""
  let statusline .= "%#SpellCap#%{(mode()=='n')?'\ \ NORMAL\ ':''}"
  let statusline .= "%#DiffDelete#%{(mode()=='i')?'\ \ INSERT\ ':''}"
  let statusline .= "%#DiffChange#%{(mode()=='r')?'\ \ RPLACE\ ':''}"
  let statusline .= "%#Folded#%{(mode()=='v')?'\ \ VISUAL\ ':''}"
  let statusline .= "%#Visual#"
  let statusline .= " %n "                        " show buffer info
  let statusline .= "%#Cursor#"
  let statusline .= "%{&paste?'\ PASTE\ ':''}"
  let statusline .= "%{&spell?'\ SPELL\ ':''}"
  let statusline .= "%#StatusLine#"
  let statusline .= " %f "                        " filename $f relative $F full
  let statusline .= "%#CursorLine#"
  let statusline .= "%( %h%M%R%w%) "              " buffer flags 
  let statusline .= "%="                          " right align
  let statusline .= "%#LineNr#"
  let statusline .= "(%{&ff}%(\/%Y%))"            " file format and type
  let statusline .= "%#Cursor#"             
  let statusline .= "[%l:%c%V] "                  " line & Column
  let statusline .= "%03.3b "                     " character under cursor (decimal)
  let statusline .= "0x%02.2B "                   " character under cursor (hexa)
  let statusline .= "| %P/%L "                    " file progress
  return statusline
endfunction
