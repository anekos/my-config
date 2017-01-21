let s:save_cpo = &cpo
set cpo&vim

let s:hook = {
\   'name': 'lightline',
\   'kind': 'hook',
\   'is_empty_data': 1
\ }

let s:quickrun_status = ''

function! s:update_status(status)
  let s:quickrun_status = a:status
endfunction

function! s:hook.on_ready(...)
  call s:update_status('ready')
  call lightline#update()
endfunction

function! s:hook.on_hook_loaded(...)
  call s:update_status('hook_loaded')
  call lightline#update()
endfunction

function! s:hook.on_normalized(...)
  call s:update_status('')
  call lightline#update()
endfunction

function! s:hook.on_module_loaded(...)
  call s:update_status('module_loaded')
  call lightline#update()
endfunction

function! s:hook.on_output(...)
  call s:update_status('output')
  call lightline#update()
endfunction

function! s:hook.on_success(...)
  call s:update_status('success')
  call lightline#update()
endfunction

function! s:hook.on_failure(...)
  call s:update_status('failure')
  call lightline#update()
endfunction

function! s:hook.on_finish(...)
  call s:update_status('finish')
  call lightline#update()
endfunction

function! s:hook.on_exit(...)
  call s:update_status('')
  call lightline#update()
endfunction

function! quickrun#hook#lightline_quickrun_status#current()
  return s:quickrun_status
endfunction

function! quickrun#hook#lightline_quickrun_status#new()
  return deepcopy(s:hook)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

