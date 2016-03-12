"==========================================================================
"                         /
" |\   |\__   /|\ |\      |     |\    |\  /| |\  /| |\     |   |\  /| |
" |\ \ |   \   |  |\ \/  /\     |\ \/ | /\ | | /\ | |\ \  _|_| | \/ | | /|
" |  \ |    |  |  | \/  |   \   | \/  |/  \| |/  \| |  \ | |   | /\ | |/ |
" |    |    |  |  |     /     \ |     |    | |    | |      |   |/  \|    |
"==========================================================================

scriptencoding utf8

" quickfix
MeowtoCmd QuickFixCmdPost * cwin

" 折りたたみの保存 - http://vim-users.jp/2009/10/hack84/
MeowtoCmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
MeowtoCmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif

" セッションロード後に、XMonad 的なリフレッシュ
MeowtoCmd SessionLoadPost * XMonadRefreshWindow

" md as markdown, instead of modula2
MeowtoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
MeowtoCmd BufNewFile,BufRead *.nox set filetype=nox

" ファイルが他で更新されていないかチェックする
MeowtoCmd WinEnter,FocusGained * checktime

" 自動でプロジェクトのルートを作業ディレクトリにする
MeowtoCmd BufReadPost * silent CdProjectRoot

MeowtoCmd FileType c,cpp,rust,haskell,python nmap <buffer>K <Plug>(devdocs-under-cursor)

" ヘルプ以外の空バッファウィンドウを閉じる
MeowtoCmd BufNewFile,WinEnter,BufEnter,BufWinEnter * KillMeBaby

" FileType
MeowtoCmd FileType html,xhtml,xml,xslt source ~/.vim/part/filetype/xml.vim

" 可愛いフォーマッタ殺害 {{{

let s:formatoptions = substitute(&formatoptions, '[tcq]', '', 'g') . 'Mjr'

function! s:KillTheFuckingFormatters()
  setlocal textwidth=0
  let &formatoptions = s:formatoptions
endfunction

autocmd Meowrc FileType * call s:KillTheFuckingFormatters()

call s:KillTheFuckingFormatters()

" }}}

" 地蔵でディレクトリ作る {{{
" http://vim-users.jp/2011/02/hack202/

autocmd Meowrc BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
function! s:auto_mkdir(dir, force)
  if isdirectory(a:dir)
    return
  endif

  if a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$'
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" }}}
