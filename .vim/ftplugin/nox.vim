
setlocal foldlevel=99

nmap              <buffer> <Leader>o    <Plug>(nox-open-reference)
nnoremap <silent> <buffer> t            :<C-u>Unite nox_tag -default-action=add<CR>
nnoremap <silent> <buffer> <Leader>cc   :keeppattern '<,'>s/^/- /<CR>
