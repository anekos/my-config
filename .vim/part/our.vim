
function! s:load_my_plugin(name, ...)
  for l:base in ['', '~/project/', '~/repos/', '~/project/vim-plugins/']
    let l:dir = expand(l:base . a:name)
    if isdirectory(l:dir)
      let &runtimepath .= ',' . l:dir
      return
    endif
  endfor
endfunction

if has('vim_starting')
  call s:load_my_plugin('~/.xmonad/res/vim')
  call s:load_my_plugin('nox/res/vim')
  call s:load_my_plugin('hledger-vim')
endif

