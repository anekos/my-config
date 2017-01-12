

let s:winsize = 3
let s:current_filepath = ''
let s:state_filepath = expand('~/.sumi')
let s:option_names = ['lazyredraw']

function! s:StoreCurrentOptions()
  let s:option = {}
  for l:name in s:option_names
    let s:option[l:name] = eval('&' . l:name)
  endfor
endfunction

function! s:RestoreCurrentOptions()
  for l:name in s:option_names
    execute 'let &' . l:name . ' = ' . string(s:option[l:name])
  endfor
endfunction

" Pakuri from threes.vim
function! s:GetCurrentCursorCommand()
  if !has('gui_running')
    return 'let &t_ve = ' . string(&t_ve)
  endif
  redir => l:cursor
  silent! highlight Cursor
  redir END
  if l:cursor !~# 'xxx'
    return ''
  endif
  return 'highlight Cursor ' .  substitute(matchstr(l:cursor, 'xxx\zs.*'), "\n", ' ', 'g')
endfunction

function! s:HideCursor()
  let s:restore_cursor_command = s:GetCurrentCursorCommand()
  if has('gui_running')
    highlight Cursor ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
  else
    set t_ve=
  endif
endfunction

function! s:RestoreCursor()
  execute s:restore_cursor_command
endfunction

function! s:FixWindowSize()
  execute 'resize ' . s:winsize
endfunction

function! s:Start(filepath)
  if !filereadable(a:filepath)
    echoerr 'Not readable: ' . a:filepath
    return
  end

  call s:StoreCurrentOptions()

  belowright split
  enew
  call s:FixWindowSize()

  let b:text_read_buffer = 1

  call s:LoadText(a:filepath)

  call s:HideCursor()
  setlocal nohidden
  setlocal nomodified
  setlocal filetype=aozora

  set lazyredraw

  normal! zRzt

  highlight SumiText guifg=#006060
  syntax match SumiText ".*"

  setlocal nomodifiable

  for l:char in split('q w e r t y u i o p a s d f h j k l x c v b n Q W E R T Y U I O P A S D F H J K L Z X C V B N M , . /', ' ')
    execute 'nnoremap <buffer>' . l:char . ' :<C-u>SumiClose<CR>'
  endfor

  augroup Sumi
    autocmd BufLeave <buffer> SumiClose
    autocmd VimResized <buffer> call s:FixWindowSize()
  augroup END

  nnoremap <buffer> i :<C-u>SumiClose<CR>

  nnoremap <buffer> j ztLjzt
  nnoremap <buffer> k HzbHk
  nnoremap <buffer> l <C-u>:SumiPage 1<CR>
endfunction

function! s:LoadText(filepath)
  if !exists('b:text_read_buffer')
    echoerr 'This buffer is not TextRead buffer'
    return
  endif

  let s:current_filepath = fnamemodify(a:filepath, ':p')

  setlocal modifiable
  execute 'normal! gg0dG'
  execute 'read ' . a:filepath

  if filereadable(s:state_filepath)
    let l:state = eval(readfile(s:state_filepath)[0])
    if has_key(l:state, s:current_filepath)
      execute 'normal! ' . string(l:state[s:current_filepath]) . 'Gzt'
    else
      normal! 1Gzt
    endif
  endif

  setlocal nomodifiable
endfunction

function! s:Close()
  if exists('s:state_filepath')
    let l:state = filereadable(s:state_filepath) ? eval(readfile(s:state_filepath)[0]) : {}
    let l:state[s:current_filepath] = line('.')
    call writefile([string(l:state)], s:state_filepath)
  endif
  close!
  call s:RestoreCurrentOptions()
  call s:RestoreCursor()
  echo ''
endfunction

function! s:Page(delta)
  let l:directory = fnamemodify(s:current_filepath, ':h')
  let l:files = filter(sort(split(globpath(l:directory, '*.*'), "\n")), 'filereadable(v:val)')
  let l:current_index = -1

  for l:index in range(len(l:files))
    if l:files[l:index] == s:current_filepath
      let l:current_index = l:index
    endif
  endfor

  if l:current_index < 0
    echoerr "Not found current file"
    return
  endif

  let l:next_index = l:current_index - a:delta
  if l:next_index >= len(l:files)
    let l:next_index = 0
  elseif l:next_index < 0
    let l:next_index = len(l:files) - 1
  endif

  let l:next_filepath = l:files[l:next_index]
  call s:LoadText(l:next_filepath)
endfunction

command! -nargs=1 -complete=file Sumi call s:Start(<q-args>)
command! -nargs=1 -complete=file SumiPage call s:Page(<q-args>)
command! -nargs=0 -complete=file SumiClose call s:Close()
