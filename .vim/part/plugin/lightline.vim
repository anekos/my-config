"===========================================
"               |\
" |\  |  \    / |  \ /|\ |\  |   |   |\  /|
" | \ |    \/   | /   |  | \ |  _|_| | \/ |
" |   |   /  \  |     |  |   | | |   |    |
" |   | /     \ |     |  |   |   |   |    |
"===========================================

let g:myline = {}


let g:lightline = {
\   'enable': {'tabline': 0},
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [
\       ['readonly', 'filename', 'modified'],
\       ['git_branch', 'git_traffic', 'git_status'],
\       ['mode', 'paste'],
\       ['syntaxcheck']
\     ],
\     'right': [
\       ['lineinfo'],
\       ['percent'],
\       ['fileformat', 'fileencoding', 'filetype'],
\       ['charcode']
\     ]
\   },
\   'component_function': {
\     'modified': 'g:myline.modified',
\     'readonly': 'g:myline.readonly',
\     'fugitive': 'g:myline.fugitive',
\     'filename': 'g:myline.filename',
\     'fileformat': 'g:myline.fileformat',
\     'filetype': 'g:myline.filetype',
\     'fileencoding': 'g:myline.fileencoding',
\     'mode': 'g:myline.mode',
\     'charcode': 'g:myline.charCode',
\     'git_branch': 'g:myline.git_branch',
\     'git_traffic': 'g:myline.git_traffic',
\     'git_status': 'g:myline.git_status',
\     'pokemon': 'g:myline.pokemon'
\   },
\   'component_expand': {
\     'syntaxcheck': 'qfstatusline#Update',
\   },
\   'component_type': {
\     'syntaxcheck': 'error',
\   },
\   'tab_component_function': {
\     'tabfilename': 'MyLineTabFileName'
\   },
\   'separator': {'left': '', 'right': ''},
\   'subseparator': {'left': '', 'right': ''}
\ }

let g:lightline.tab = {'active': ['tabnum', 'tabfilename', 'modified'], }
let g:lightline.tab.inactive = g:lightline.tab.active
let g:lightline.inactive = g:lightline.active


function! g:myline.modified()
  return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! g:myline.readonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! g:myline.filename()
  return (&filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype ==# 'unite' ? unite#get_status_string() :
        \  &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! g:myline.fugitive()
  try
    if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! g:myline.fileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! g:myline.filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! g:myline.fileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! g:myline.charCode()
  return winwidth(0) > 90 ? GetCharCode() : ''
endfunction

" FIXME
function! MyLineTabFileName(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:name = expand('#' . buflist[winnr - 1] . ':t')

  if l:name =~ 'mod.rs'
    let l:name = expand('#' . buflist[winnr - 1] . ':h:t') . '/m'
  endif

  return l:name !=# '' ? l:name : '[No Name]'
endfunction

function! g:myline.git_branch()
  return gita#statusline#preset('branch_fancy')
endfunction

function! g:myline.git_traffic()
  return gita#statusline#preset('traffic_fancy')
endfunction

function! g:myline.git_status()
  return gita#statusline#preset('status')
endfunction

function! g:myline.pokemon()
  return pokemon#getdaze()
endfunction

function! g:myline.pokemode()
  let l:mode = lightline#mode()
  if l:mode ==# 'NORMAL'
    return pokemon#getdaze()
  else
    return l:mode
  endif
endfunction

function! g:myline.mode()
  return winwidth(0) > 60 ? g:myline.pokemode() : ''
endfunction
