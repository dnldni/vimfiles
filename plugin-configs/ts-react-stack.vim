"------------------------ COC ----------------------- 
set cmdheight=1
set nobackup
set nowritebackup
set signcolumn=yes

" Smaller updatetime for CursorHold & CursorHoldI old value 1500
set updatetime=80
"
" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes " coc for tslinting, auto complete and prettier

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions 
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-explorer'] 
nnoremap <leader>a :CocAction<CR>
nnoremap <silent><C-k><C-d> :CocCommand prettier.formatFile<CR>
nmap <leader>af <Plug>(coc-fix-current)


augroup tsgroup
   autocmd!

   " Remap keys for gotos and set correct filetype
   au BufNewFile,BufRead *.tsx,*.ts,*.js,*.jsx
            \ nmap <silent> gd <Plug>(coc-definition) |
            \ nmap <silent> gy <Plug>(coc-type-definition) |
            \ nmap <silent> gi <Plug>(coc-implementation) |
            \ nmap <silent> gr <Plug>(coc-references) |
            \ nmap <leader>rr <Plug>(coc-rename)

   au BufNewFile,BufRead *.ts setlocal filetype=typescript
   au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
   " au BufNewFile,BufRead *jsx,*.tsx setlocal filetype=typescriptreact

   autocmd FileType typescript,typescript.tsx,typescriptreact
               \ :iabbrev <buffer> imr import React from "react" |
               \ :iabbrev <buffer> cmp interface ComponentProps{}<CR>const Component = (props:ComponentProps)  => {} |
               \ :iabbrev <buffer> ust const [state, setState] = useState() |
               \ :iabbrev <buffer> ucb const callBack = useCallback(() =>  {}, []) |
               \ :iabbrev <buffer> mks const useStyles = makeStyles((theme:Theme) => createStyles({})) |
               \ :iabbrev <buffer> ufe useEffect(() => {}, [])
  
   "autocmd FileType typescript.tsx :iabbrev <buffer> imr import React from "react"

augroup END

""" Show documentation on button K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
   else
      call CocAction('doHover')
   endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Add syntax higlightning for comments inside json files
autocmd FileType json syntax match Comment +\/\/.\+$+

"
"" Syntax highlight for typescript
Plug 'peitalin/vim-jsx-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'



" Plug 'jparise/vim-graphql'        " GraphQL syntax
" Plug 'ianks/vim-tsx'

" nmap <silent> <Leader>j <Plug>(coc-diagnostic-next-error)
" nmap <silent> <Leader>J <Plug>(coc-diagnostic-prev-error)
nmap <silent> <F8> <Plug>(coc-diagnostic-next)
nmap <silent> <S-F8> <Plug>(coc-diagnostic-prev)
