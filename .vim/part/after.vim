"============================
"                      |\
" |\   |\_/ /|\ |\  /| |  \
" |\ \ |\_/  |  | \/ | |  /
" |  \ |     |  |    | |  \
" |    |     |  |    | |   \
"============================


" ENV
let $PATH = $HOME . '/bin:' . $HOME . '/.cabal/bin:' . $PATH

" Set filetype
MeowtoCmd BufNewFile,BufRead buildfile setlocal filetype=ruby

colorscheme iceberg " anekos

if filereadable(expand('~/.vimrc.local')) | source ~/.vimrc.local | endif

" vimrc編集 {{{

"このコマンドで自身を呼ぶと起られるので、あまり問題のないココで定義する

function! s:rc (part)
  let l:filepath = '~/.vimrc'
  if len(a:part) > 0
    let l:filepath = '~/.vim/part/' . a:part . '.vim'
  endif
  execute 'edit' l:filepath
endfunction

function! s:source_rc (part)
  let l:filepath = '~/.vimrc'
  if len(a:part) > 0
    let l:filepath = '~/.vim/part/' . a:part . '.vim'
  endif
  execute 'source' l:filepath
endfunction

function! s:rc_completions (arglead, ...)
  let l:dir = expand('~/.vim/part/')
  let l:ld = len(l:dir)

  let l:filter_cmd = printf('v:val !~ "\.archive" && v:val =~ "^%s"', a:arglead)
  return filter(
    \ map(globpath(l:dir, '*', 1, 1), "substitute(v:val[l:ld : ], '\\.\\(vim\\|toml\\)$', '', '')"),
    \ l:filter_cmd)
endfunction

command! -bar -nargs=? -complete=customlist,s:rc_completions Rc call s:rc(<q-args>)
command! -bar -nargs=? -complete=customlist,s:rc_completions Sorc call s:source_rc(<q-args>)

" }}}
