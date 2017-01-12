
setlocal foldlevel=99

nmap <buffer> <Leader>o <Plug>(nox-open-reference)
nnoremap <silent> <buffer> t :Unite nox_tag -default-action=add<CR>
