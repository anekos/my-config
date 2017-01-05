"======================================================================================
"
"       ___           ___           ___           ___           ___           ___
"      /\  \         /\  \         /\__\         /|  |         /\  \         /\__\
"     /::\  \        \:\  \       /:/ _/_       |:|  |        /::\  \       /:/ _/_
"    /:/\:\  \        \:\  \     /:/ /\__\      |:|  |       /:/\:\  \     /:/ /\  \
"   /:/ /::\  \   _____\:\  \   /:/ /:/ _/_   __|:|  |      /:/  \:\  \   /:/ /::\  \
"  /:/_/:/\:\__\ /::::::::\__\ /:/_/:/ /\__\ /\ |:|__|____ /:/__/ \:\__\ /:/_/:/\:\__\
"  \:\/:/  \/__/ \:\~~\~~\/__/ \:\/:/ /:/  / \:\/:::::/__/ \:\  \ /:/  / \:\/:/ /:/  /
"   \::/__/       \:\  \        \::/_/:/  /   \::/~~/~      \:\  /:/  /   \::/ /:/  /
"    \:\  \        \:\  \        \:\/:/  /     \:\~~\        \:\/:/  /     \/_/:/  /
"     \:\__\        \:\__\        \::/  /       \:\__\        \::/  /        /:/  /
"      \/__/         \/__/         \/__/         \/__/         \/__/         \/__/
"
"                                                               vim: set ts=2 sw=2 et :
"======================================================================================


" Safety {{{

if !has('unix') && has('macunix')
  echo 'huh?'
  silent! quitall!
endif

" }}}

" Reloadablerrr {{{

augroup Meowrc
  autocmd!
augroup END
command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>

" }}}

" Encoding {{{

set encoding=utf8
let &termencoding = &encoding
scriptencoding utf8
set fileencodings=utf8

" }}}

" 起動時間を計測 (from .thincarc) {{{

if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  MeowtoCmd VimEnter * let g:startuptime = reltime(g:startuptime)
  \                  | redraw
  \                  | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

" }}}

" ショッキカ {{{

if !isdirectory(expand('~/.vim-temp'))
  function s:initialize()
    let l:dirs = split('backup swap undo view info')
    for l:dir in l:dirs
      call mkdir(expand('~/.vim-temp/') . l:dir, 'p')
    endfor

    source ~/.vim/part/plug.vim
    PlugInstall
    quitall!
  endfunction

  call s:initialize()
endif

" }}}

" 自前プラグインとか {{{

let g:my_plugins = [
      \   {'name': 'nox',      'path': 'nox/res/vim'},
      \   {'name': 'hledger',  'path': 'hledger-vim'},
      \   {'name': 'fancy',    'path': 'vim-fancy'},
      \   {'name': 'colocolo', 'path': 'colocolo.vim'},
      \   {'name': 'guruguru', 'path': 'guruguru.vim'},
      \ ]

"}}}

" 分割 rc {{{

let g:my_rc_files = map([
\   '~/.vim/part/plug.vim',
\   '~/.vim/part/env.vim',
\   '~/.vim/part/utils.vim',
\   '~/.vim/part/set.vim',
\   '~/.vim/part/map.vim',
\   '~/.vim/part/command.vim',
\   '~/.vim/part/autocmd.vim',
\   '~/.vim/part/term.vim',
\   '~/.vim/part/let.vim',
\   '~/.vim/part/plugin/lightline.vim',
\   '~/.vim/part/plugin/unite.vim',
\   '~/.vim/part/plugin/quickrun.vim',
\   '~/.vim/part/plugin/lexima.vim',
\   '~/.vim/part/gui.vim',
\   '~/.vim/part/last.vim',
\ ], 'expand(v:val)')

function! s:sources(files)
  for l:file in g:my_rc_files
    execute 'source' l:file
  endfor
endfunction

call s:sources(g:my_rc_files)

MeowtoCmd VimEnter * source ~/.vim/part/after.vim

" }}}

" カレーを零しても大丈夫 {{{

if $PWD == expand('~') && isdirectory('/tmp/xmosh')
  cd /tmp/xmosh
endif

" }}}
