" unite.vim の候補を動的にソートする - C++でゲームプログラミング
"     http://d.hatena.ne.jp/osyo-manga/20130913/1379077733
"
" 2015-10-13T16:10:58 - unite の変更に対応した

function! s:sort(sorters)
    call unite#mappings#set_current_sorters(a:sorters)
    execute "normal \<Plug>(unite_redraw)"
endfunction

let s:source = {
\    "name" : "sort",
\    "action_table" : {
\        "set_current_filters" : {
\            "is_selectable" : 0,
\            "is_quit" : 0,
\        },
\    },
\    "default_action" : "set_current_filters",
\ }

function! s:source.action_table.set_current_filters.func(candidate)
    execute "normal \<Plug>(unite_exit)"
    call s:sort(a:candidate.action__sorters)
endfunction

function! s:source.gather_candidates(...)
    let l:sorters = filter(values(map(unite#variables#filters(), 'v:val.name')), 'v:val =~ "^sorter"')
    return map(copy(l:sorters), '{
\         "word" : v:val,
\         "action__sorters"     : [v:val],
\     }')
\     + map(copy(sorters), '{
\         "word" : "reverse " . v:val,
\         "action__sorters"     : [v:val, "sorter_reverse"],
\     }')
endfunction

call unite#define_source(s:source)
unlet s:source

function! s:start_sort()
  let l:context = {}
  let l:context.input = ''
  let l:context.auto_preview = 0
  let l:context.unite__is_vimfiler = 0
  let l:context.default_action = 'default'
  call unite#start_temporary([["sort", ""]], l:context)
endfunction

augroup MyOsyo
  autocmd!
  autocmd FileType unite nnoremap <buffer><silent> S :call <SID>start_sort()<CR>
augroup END
