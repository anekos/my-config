"==================
"  \    / |\__   |
"    \/   |   \  |
"   /  \  |    | |
" /     \ |    | |
"==================

scriptencoding utf8

if !has('gui_running')
  finish
endif

" Options {{{

set guioptions=gitc

"  1 hoge.vim
set guitablabel=%N:\ %f

" }}}

" フォント {{{

let s:fonts = {
\   'nerd': {
\     'font': 'Droid Sans Mono for Powerline Plus Nerd File Types 10',
\     'wide': 'Ricty 10'
\   },
\   'source code pro': {
\     'font': 'Source Code Pro SemiBold 12'
\   },
\   'ricty': {
\     'font': 'Ricty 12'
\   },
\   'runez': {
\     'font': 'RUNEZ 12',
\     'wide': 'Ricty 12'
\   },
\   'vl gothic': {
\     'font': 'VL Gothic 12'
\   }
\ }

function! s:set_font (setting)
  let &guifont = a:setting.font
  if has('gui_gtk')
    let &guifontwide = get(a:setting, 'wide', '')
  endif
endfunction

function! s:complete_font (...)
  return join(keys(s:fonts), "\n")
endfunction

command! -nargs=* -complete=custom,s:complete_font Font call s:set_font(s:fonts[<q-args>])

" Defaont
Font nerd

" }}}
