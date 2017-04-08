"===========================================
"               |\
" |\  |  \    / |  \ /|\ |\  |   |   |\  /|
" | \ |    \/   | /   |  | \ |  _|_| | \/ |
" |   |   /  \  |     |  |   | | |   |    |
" |   | /     \ |     |  |   |   |   |    |
"===========================================

scriptencoding utf8

" シンプルバージョン {{{

if !(has('cryptv') && v:version >= 800)
  let g:lightline = {
  \   'enable': {'tabline': 0},
  \   'mode_map': {'c': 'NORMAL'},
  \   'active': {
  \     'left': [
  \       ['readonly', 'filename', 'modified'],
  \       ['mode', 'paste'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformat', 'fileencoding', 'filetype'],
  \     ]
  \   },
  \   'separator': {'left': '', 'right': ''},
  \   'subseparator': {'left': '', 'right': ''}
  \ }

  finish
endif

" }}}

" にゃっふりバージョン {{{

let g:lightline = {
\   'enable': {'tabline': 0},
\   'mode_map': {'c': 'NORMAL'},
\   'active': {
\     'left': [
\       ['readonly', 'filename', 'modified'],
\       ['errors', 'quickrun'],
\     ],
\     'right': [
\       ['filetype', 'fileformat', 'fileencoding', 'pokemon'],
\       ['charcode', 'percent', 'lineinfo'],
\       ['paste'],
\     ]
\   },
\   'component_function': {
\     'modified': 'g:myline.modified',
\     'readonly': 'g:myline.readonly',
\     'filename': 'g:myline.filename',
\     'fileformat': 'w200 &fileformat',
\     'filetype': "w150 strlen(&filetype) ? &filetype : 'noft'",
\     'fileencoding': 'w150 strlen(&fileencoding) ? &fileencoding : &encoding',
\     'pokemon': 'pokemon#getdaze',
\     'charcode': 'w150 g:myline.charCode',
\     'git': 'w200 g:myline.git',
\   },
\   'component_expand': {
\     'errors': 'g:myline.errors',
\     'quickrun': 'quickrun#hook#lightline_quickrun_status#current',
\   },
\   'component_type': {
\     'errors': 'error',
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

" }}}

" ネコンポコネント関数 {{{

let g:myline = {}

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

function! g:myline.charCode()
  if winwidth(0) < 70
    return ''
  endif

  " https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim

  " Get the output of :ascii
  redir => l:ascii
  silent! ascii
  redir END
  if match(l:ascii, 'NUL') != -1
    return 'NUL 0x----'
  endif

  " Zero pad hex values
  let l:nrformat = '0x%02x'

  let l:encoding = (&fileencoding ==# '' ? &encoding : &fileencoding)

  if l:encoding ==# 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let l:nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [l:str, l:char, l:nr; l:rest] = matchlist(l:ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let l:nr = printf(l:nrformat, l:nr)

  return "'". l:char ."' ". l:nr
endfunction

function! g:myline.errors()
  let l:num = len(filter(getqflist(), 'v:val.bufnr > 0 && v:val.lnum > 0'))
  if l:num > 0
    return printf('%d errors', l:num)
  else
    return ''
  endif
endfunction

function! g:myline.git()
  let l:components = [gina#component#repo#branch(), gina#component#status#preset('fancy'), gina#component#traffic#preset('fancy')]
  let l:text = join(filter(l:components, "v:val !~# '^ *$'"), ' ')
  return l:text
endfunction

" FIXME
function! MyLineTabFileName(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:name = expand('#' . buflist[winnr - 1] . ':t')

  if l:name =~# 'mod.rs'
    let l:name = expand('#' . buflist[winnr - 1] . ':h:t') . '/m'
  endif

  return l:name !=# '' ? l:name : '[No Name]'
endfunction

" }}}

" 幅を考慮したバージョンにすりかえる {{{

function! s:consider_window_width(dict)
  for [l:key, l:value] in items(a:dict)
    let l:matched = matchlist(l:value, '\vw(\d+) (.+)')

    if len(l:matched) > 0
      let [_, l:width, l:name, _, _, _, _, _, _, _] = l:matched
      let l:wrapper_name = printf('g:lightline_wrapped_functions.wrapper_%d', len(keys(g:lightline_wrapped_functions)))

      let l:suffix = (l:name =~? '\v^%(g:)?[._a-z]+$' && exists('*' . l:name)) ? '()' : ''

      execute printf("function! %s()\n", l:wrapper_name)
      \   printf("if winwidth('.') > %d\n", l:width)
      \     printf("return %s%s\n", l:name, l:suffix)
      \   "else\n"
      \     "return ''\n"
      \   "endif\n"
      \ "endfunction\n"

      let a:dict[l:key] = l:wrapper_name
    endif
  endfor
endfunction

let g:lightline_wrapped_functions = {}

call s:consider_window_width(g:lightline.component_function)

" }}}
