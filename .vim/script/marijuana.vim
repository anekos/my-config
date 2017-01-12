
" Big Sky :: vimでスクリプト内関数を書き換える http://mattn.kaoriya.net/software/vim/20090826003359.htm

let g:timers = {}


function! s:get_script_id(filename)
  let l:scriptnames = ''

  redir => l:scriptnames
  silent! scriptnames
  redir END

  let l:script_table = {}
  let l:head = '^\s*\(\d\+\):\s*\(.*\)$'
  for l:line in split(l:scriptnames, "\n")
    let l:script_table[tolower(substitute(l:line, l:head, '\2', ''))] = substitute(l:line, l:head, '\1', '')
  endfor

  return l:script_table[tolower(a:filename)]
endfunction


function! s:get_function(filename, function_name)
  let l:sid = s:get_script_id(a:filename)
  return function('<SNR>' . l:sid . '_' . a:function_name)
endfunction


function! s:on_timer (handle)
  let l:context = g:timers[a:handle]
  call call(l:context.function, l:context.arguments)
endfunction


function! s:timerize(opts)
  let l:events = get(a:opts, 'events', 'CursorHold,CursorHoldI')
  let l:interval = get(a:opts, 'interval', 1000)
  let l:arguments = get(a:opts, 'arguments', [])

  let l:context = {
  \   'function': s:get_function(a:opts.filename, a:opts.function_name),
  \   'arguments': l:arguments
  \ }

  execute 'autocmd!' a:opts.group_name l:events

  let l:timer = timer_start(l:interval, function('s:on_timer'), {'repeat': -1})

  let g:timers[l:timer] = l:context
endfunction


call s:timerize({
\   'filename': '~/.cache/dein/.dein/autoload/vimshell/interactive.vim',
\   'function_name': 'check_all_output',
\   'group_name': 'vimshell',
\   'arguments': [1]
\ })
