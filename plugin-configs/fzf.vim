call plug#begin('$LOCALAPPDATA\nvim\plugged')
      " Always enable preview window on the right with 60% width
      let g:fzf_preview_window = 'right:30%'

      if executable("rg")
      :let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!node_modules/*" --glob "!.git/*"'
      endif

      ":let $FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard'
      ":let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!node_modules/*" --glob "!.git/*"'

      if executable("bat")
         let s:bind_opts = '--bind=ctrl-d:preview-page-down,ctrl-u:preview-page-up,alt-j:preview-down,alt-k:preview-up'
         let s:preview_opts =  '--preview=bat --theme "1337" --style plain,numbers  --color always '

         command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--color=border:#404040',
                                                                                                \ '--layout=reverse',
                                                                                                \ '--info=inline',
                                                                                                \ '--color=fg:252,hl:67,fg+:252,bg+:235,hl+:81',
                                                                                                \ '--color=info:144,prompt:161,spinner:135,pointer:135,marker:118',
                                                                                                \ s:bind_opts,
                                                                                                \ s:preview_opts . '{}'], 'down':'50%'}, <bang>0)

         command! -bang -nargs=? Buffers call fzf#vim#buffers({'options': ['--color=border:#404040',
                                                                              \ '--layout=reverse',
                                                                              \ '--color=fg:252,hl:67,fg+:252,bg+:235,hl+:81',
                                                                              \ '--color=info:144,prompt:161,spinner:135,pointer:135,marker:118',
                                                                              \ '--info=inline',
                                                                              \ '--preview-window=50%',
                                                                              \ s:bind_opts,
                                                                              \ s:preview_opts . "{4}" ], 'down': '50%'}, <bang>0)

         command! -bang -nargs=? -complete=dir Rg call fzf#vim#grep('rg --max-columns 100 --glob !public/** --line-number --no-heading --smart-case '.shellescape(<q-args>), 1, {
                                                                                                \ 'options': ['--color=border:#404040',
                                                                                                \ '--color=fg:252,hl:67,fg+:252,bg+:235,hl+:81',
                                                                                                \ '--color=info:144,prompt:161,spinner:135,pointer:135,marker:118',
                                                                                                \ '--layout=reverse',
                                                                                                \ '--info=inline',
                                                                                                \ '--delimiter=:','--nth=2..',
                                                                                                \ s:bind_opts,
                                                                                                \ s:preview_opts . '{1}'], 'down':'50%'}, <bang>0)

      endif

      """" Fuzzy finder
      "" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)

      """ FZF function for delete buffers
      function! s:list_buffers()
        redir => list
        silent ls
        redir END
        return split(list, "\n")
      endfunction

      function! s:delete_buffers(lines)
         if (len(a:lines) == 0)
            return
         endif
         execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
      endfunction

      command! -bang BDS call fzf#run(fzf#wrap({
        \ 'source': s:list_buffers(),
        \ 'sink*': { lines -> s:delete_buffers(lines) },
        \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
        \ }))

call plug#end()
