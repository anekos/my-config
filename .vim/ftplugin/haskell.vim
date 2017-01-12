
setlocal iskeyword+='
setlocal omnifunc=necoghc#omnifunc

nmap <buffer> K <Plug>(ref-keyword)

nnoremap <buffer> <Leader>ui :<C-u>Unite haskellimport<CR>
nnoremap <buffer> <Leader>I :<C-u>:UniteWithCursorWord haskellimport<CR>
nnoremap <buffer> <Leader>H :<C-u>:UniteWithCursorWord hoogle<CR>
nnoremap <buffer> <Leader>h :<C-u>:Unite hoogle -default-action=browse_remote<CR>

nnoremap <buffer> <silent> <Leader>T :<C-u>call <SID>unite_hoogle_type()<CR>
function! s:unite_hoogle_type()
  let [_, l:type] = ghcmod#type()
  call ghcmod#type_clear()
  call unite#start(['hoogle'], { 'input': l:type })
endfunction


" ref: https://github.com/eagletmt/ghcmod-vim/wiki/Customize
" let &l:statusline = '%{empty(getqflist()) ? "[No Errors]" : "[Errors Found]"}'
