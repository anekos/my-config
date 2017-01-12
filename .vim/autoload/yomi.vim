
function! s:Mark(line)
  if a:line < 1
    let a:line = 1
  endif
  silent! execute 'sign unplace 1 buffer=' . winbufnr(0)
  execute 'sign place 1 line=' . a:line . ' name=SignSymbol buffer=' . winbufnr(0)
endfunction

function! s:NextPage()
  let l:current = line('.')
  let l:height = winheight('%') - 1
  " call s:Mark(l:current + l:height)
  execute 'normal zt' . string(l:height) . 'gjzt0'
  call s:Mark(line('.'))
endfunction

function! s:PreviousPage()
  let l:current = line('.')
  let l:height = winheight('%') - 1
  " call s:Mark(l:current - l:height)
  execute 'normal zt' . string(l:height) . 'gkzt0'
  call s:Mark(line('.'))
endfunction

function! s:Initialize()
  " setlocal scrolloff=666

  highlight Cursor guifg=NONE guibg=NONE

  let &guifont="VL Gothic 16"

  sign define SignSymbol linehl=SignColor texthl=SignColor
  highlight SignColor ctermfg=white ctermbg=blue guifg=white guibg=RoyalBlue3

  setlocal norelativenumber

  let b:initialized = 1

  " autocmd VimResized * call s:InitializeWindow()
  XMonadRefreshWindow
endfunction

function! s:InitializeWindow()
  if winnr('$') > 1
    return
  endif

  vsplit
  vsplit
  wincmd l
  vertical resize
  wincmd h
  enew
  wincmd l
  wincmd l
  enew
  wincmd h
endfunction

function! yomi#start()
  if exists('b:initialized') && b:initialized
    call s:InitializeWindow()
  else
    call s:Initialize()
  endif

endfunction

nnoremap <buffer> j :<C-u>call <SID>NextPage()<CR>
nnoremap <buffer> k :<C-u>call <SID>PreviousPage()<CR>
