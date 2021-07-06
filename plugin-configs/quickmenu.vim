
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()

call g:quickmenu#append('# Directories', '')

call g:quickmenu#append('wayne', ':e \users\danie\dev\wayne\src', 'goto wayne dir')
call g:quickmenu#append('spiderads', ':e \users\danie\dev\spiderads\src', 'goto spiderads dir')
