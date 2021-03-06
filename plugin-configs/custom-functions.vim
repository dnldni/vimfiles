function! RightAlignVisual() range
    let lim = [virtcol("'<"), virtcol("'>")]
    let [l, r] = [min(lim), max(lim)]
    exe "'<,'>" 's/\%'.l.'v.*\%<'.(r+1).'v./\=StrPadLeft(submatch(0),r-l+1)'
endfunction

function! StrPadLeft(s, w)
    let s = substitute(a:s, '^\s\+\|\s\+$', '', 'g')
    return repeat(' ', a:w - strwidth(s)) . s
endfunction

function! s:light_mode()
  set background=light
endfunction

function! s:dark_mode()
  set background=dark
endfunction

command! LightMode call s:light_mode()
command! DarkMode call s:dark_mode()

command! -range RightAlign <line1>,<line2>call RightAlignVisual()
