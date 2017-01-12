
let s:i = 0
let s:t = 0
let s:x = 0

function! ByonByon(t)
  let &cmdheight = abs(float2nr(sin(3.14 * s:i / 360) * &lines / 2))  + 1

  let l:winpos = {'x': getwinposx(), 'y': getwinposy()}
  let l:dx = s:x ? 1 : -1

  execute 'winpos' (l:winpos.x + l:dx) l:winpos.y

  if l:dx
    set background=dark
  else
    set background=light
  endif

  let s:i += 10
  let s:x = !s:x
endfunction

function! s:stop_byonbyon()
  call timer_stop(s:t)
endfunction

function! s:start_byonbyon()
  call timer_start(10, 'ByonByon', {'repeat': -1})
  command! StopByonByon call s:stop_byonbyon()
endfunction

command! StartByonByon call s:start_byonbyon()
