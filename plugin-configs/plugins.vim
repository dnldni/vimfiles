" Setup plugin manager
if has('linux')
   echo 'Running on linux'
   if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
endif

if has('win32')
   echo 'Running on windows'
   if empty(glob('$LOCALAPPDATA\nvim\autoload\plug.vim'))
      silent ! powershell (md "$env:LOCALAPPDATA\nvim\autoload")
      silent ! powershell curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -Outfile ("$env:LOCALAPPDATA" + '\nvim\autoload\plug.vim')
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
endif

call plug#begin('$LOCALAPPDATA/nvim/plugged')

       Plug 'tpope/vim-commentary' 

      " function! UnmapCommentary()
      "   unmap gc
      "   nunmap gcc
      "   nunmap cgc
      "   nunmap gcu
      " endfunction

      xmap <leader>c  <Plug>Commentary
      nmap <leader>c  <Plug>Commentary
      omap <leader>c  <Plug>Commentary
      nmap <leader>cc <Plug>CommentaryLine
      nmap <leader>c <Plug>ChangeCommentary
      nmap <leader>cu <Plug>Commentary<Plug>Commentary

      autocmd FileType typescript.tsx setlocal commentstring={/*\ %s\ */}

      " augroup bepo_clash
      "   autocmd!
      "   autocmd VimEnter * call UnmapCommentary()
      " augroup END "Powershell syntax highlighting

      " Plug 'zigford/vim-powershell'
      Plug 'PProvost/vim-ps1'

      Plug 'mattn/emmet-vim'

      Plug 'neoclide/coc.nvim', {'branch': 'release'}

      Plug 'breuckelen/vim-resize'
      let g:resize_count = 4

      "" Multiple cursors
      Plug 'mg979/vim-visual-multi', {'branch': 'master'}

      "" Git support
      Plug 'tpope/vim-fugitive'

      if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
      else
        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
      endif

      """Surround stuff in params and other chars.
      Plug 'tpope/vim-surround'

      let g:EasyMotion_do_mapping = 0 " Disable default mappings
      let g:EasyMotion_smartcase = 1
      Plug 'easymotion/vim-easymotion'

      " Jump to anywhere you want with minimal keystrokes, with just one key binding.
      map <leader>b <Plug>(easymotion-overwin-f2)

      " JK motions: Line motions
      map <Leader>l <Plug>(easymotion-lineforward)
      map <Leader>j <Plug>(easymotion-j)
      map <Leader>k <Plug>(easymotion-k)
      map <Leader>h <Plug>(easymotion-linebackward)

      noremap <silent><F12> :call quickmenu#toggle(0)<cr>

      map  / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)
      " map  n <Plug>(easymotion-next)
      " map  N <Plug>(easymotion-prev)

"      Plug 'ryanoasis/vim-devicons'
      set encoding=UTF-8

      """ Unix like operations
      Plug 'tpope/vim-eunuch'

      """ Move codeblocks around
      Plug 'matze/vim-move'

      """ Theming plugins
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'

      Plug 'triglav/vim-visual-increment'

      " let g:airline_theme = 'bubblegum'
      let g:airline_theme = 'deus'
      let g:airline_powerline_fonts = 1

      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#formatter = 'default'
      let g:airline#extensions#tabline#formatter = 'jsformatter'

      let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'

      " let g:airline#extensions#tabline#show_splits = 1  " enable/disable displaying open splits per tab (only when tabs are opened). >
      " let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab let g:airline#extensions#tabline#tab_nr_type = 1  " tab number

      let g:airline#extensions#tabline#buffers_label = ''

      let g:airline#extensions#tabline#show_tab_nr = 1
      let g:airline#extensions#tabline#show_tab_type = 1
      "let g:airline#extensions#tabline#tab_min_count = 2

      let g:airline#extensions#tabline#fnamemod = ':p:.'

      nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"

      Plug 'tomasr/molokai'
      Plug 'morhetz/gruvbox'
      Plug 'crusoexia/vim-monokai'


      """" Fuzzy finder
      "Plug 'junegunn/fzf', { 'do': './install --bin' }
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'

      Plug 'junegunn/limelight.vim'
      let g:limelight_paragraph_span = 1

      "Commands BD and BDS
      Plug 'qpkorr/vim-bufkill'

      Plug 'styled-components/vim-styled-components'

      Plug 'altercation/vim-colors-solarized'

     " Plug 'lambdalisue/fern-renderer-nerdfont.vim'
     " Plug 'lambdalisue/fern.vim'
     " Plug 'lambdalisue/nerdfont.vim'
     " Plug 'lambdalisue/glyph-palette.vim'

     " augroup my-glyph-palette
     "   autocmd! *
     "   autocmd FileType fern call glyph_palette#apply()
     " augroup END

     " let g:fern#renderer = "nerdfont"

     " function! s:init_fern() abort

     "   nmap <buffer><expr>
     "       \ <Plug>(fern-my-expand-or-collapse)
     "       \ fern#smart#leaf(
     "       \   "\<Plug>(fern-action-collapse)",
     "       \   "\<Plug>(fern-action-expand)",
     "       \   "\<Plug>(fern-action-collapse)",
     "       \ )

     "   nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)

     "   " nmap <buffer> <CR> <Plug>(fern-my-expand-or-collapse)
     "   nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
     "   nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
     "   nmap <buffer> o <Plug>(fern-action-open)

     "   nmap <buffer> cd <Plug>(fern-action-cd)
     "   nmap <buffer> CD <Plug>(fern-action-enter)

     "   nmap <buffer> u <Plug>(fern-action-leave)
     "   nmap <buffer> ma <Plug>(fern-action-new-path)
     "   nmap <buffer> md <Plug>(fern-action-remove)
     "   nmap <buffer> mm <Plug>(fern-action-move)

     "   nmap <buffer> r <Plug>(fern-action-reload)

     "   nmap <buffer> <Tab> <Plug>(fern-action-mark)j

     "   nmap <buffer> - /

     "   colorscheme gruvbox

     " endfunction

     " augroup fern-custom
     "   autocmd! *
     "   autocmd FileType fern call s:init_fern()
     " augroup END


     " Explorer
     let g:coc_explorer_global_presets = {
     \   '.vim': {
     \     'root-uri': '~/.vim',
     \   },
     \   'tab': {
     \     'position': 'tab',
     \     'quit-on-open': v:true,
     \   },
     \   'floating': {
     \     'position': 'floating',
     \     'open-action-strategy': 'sourceWindow',
     \   },
     \   'floatingTop': {
     \     'position': 'floating',
     \     'floating-position': 'center-top',
     \     'open-action-strategy': 'sourceWindow',
     \   },
     \   'floatingLeftside': {
     \     'position': 'floating',
     \     'floating-position': 'left-center',
     \     'floating-width': 50,
     \     'open-action-strategy': 'sourceWindow',
     \   },
     \   'floatingRightside': {
     \     'position': 'floating',
     \     'floating-position': 'right-center',
     \     'floating-width': 50,
     \     'open-action-strategy': 'sourceWindow',
     \   },
     \   'simplify': {
     \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
     \   }
     \ }

     nmap <C-b> :CocCommand explorer --toggle --focus<CR>
     nmap <space>f :CocCommand explorer --preset floating<CR>
     autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

     " nnoremap <M-L> :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0',], [['relative', 0, 'file']])<CR>
     " nnoremap <M-L> :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0',], [['relative', 0, 'file']])<CR>
     nmap <M-L> <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

     nnoremap <C-A-l> :CocCommand explorer --no-toggle --focus --reveal='package.json' %<CR>

call plug#end()
