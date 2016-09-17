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


" Reloadablerrr
augroup Meowrc
  autocmd!
augroup END
command! -bang -nargs=* MeowtoCmd autocmd<bang> Meowrc <args>


" Encoding
set encoding=utf8
let &termencoding = &encoding
scriptencoding utf8
set fileencodings=utf8


" 起動時間を計測 (from .thincarc)
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  MeowtoCmd VimEnter * let g:startuptime = reltime(g:startuptime)
  \                  | redraw
  \                  | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

let g:plugins_installed = 0

let g:my_rc_files = map([
\   '~/.vim/part/env.vim',
\   '~/.vim/part/plug.vim',
\   '~/.vim/part/utils.vim',
\   '~/.vim/part/options.vim',
\   '~/.vim/part/mappings.vim',
\   '~/.vim/part/commands.vim',
\   '~/.vim/part/autocommands.vim',
\   '~/.vim/part/term.vim',
\   '~/.vim/part/plugins.vim',
\   '~/.vim/part/plugin/unite.vim',
\   '~/.vim/part/plugin/quickrun.vim',
\   '~/.vim/part/after.vim',
\ ], 'expand(v:val)')

let g:my_plugins = [
\   {'name': 'nox',      'path': 'nox/res/vim'},
\   {'name': 'hledger',  'path': 'hledger-vim'},
\   {'name': 'fancy',    'path': 'vim-fancy'},
\   {'name': 'colocolo', 'path': 'colocolo.vim'},
\ ]


for s:file in g:my_rc_files
  execute 'source' s:file
endfor
unlet s:file

" source /usr/share/gtags/gtags.vim
source /usr/share/vim/vimfiles/plugin/gtags.vim

if $PWD == expand('~') && isdirectory('/tmp/xmosh')
  cd /tmp/xmosh
endif
