"===============================================
"   /
"   |     |\    |\  /| |\  /| |\     |   |\  /|
"  /\     |\ \/ | /\ | | /\ | |\ \  _|_| | \/ |
" |   \   | \/  |/  \| |/  \| |  \ | |   | /\ |
" /     \ |     |    | |    | |      |   |/  \|
"===============================================

scriptencoding utf8

" 一行コマンド {{{

" 行末の空白をのぞく (space, ideographic-space, tab)
command! -bar RemoveTrailingSpaces %s/[ 　	]\+$//c

" エンコーディング指定オープン
command! -bang -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 ++bad=keep<args>
command! -bang -complete=file -nargs=? Sjis edit<bang> ++enc=cp932 ++bad=keep<args>
command! -bang -complete=file -nargs=? Euc edit<bang> ++enc=eucjp ++bad=keep<args>
command! -bang -complete=file -nargs=? WUtf8 write<bang> ++enc=utf-8 ++bad=keep<args>
command! -bang -complete=file -nargs=? WSjis write<bang> ++enc=cp932 ++bad=keep<args>
command! -bang -complete=file -nargs=? WEuc write<bang> ++enc=eucjp ++bad=keep<args>

" ファイルリネーム - http://vim-users.jp/2009/05/hack17/
command! -nargs=1 -complete=file Rename save <args>|call delete(expand('#'))

"シンタックスの再同期
command! -bar SSF syntax sync fromstart

" }}}

" .*.archive に選択範囲を移動 {{{

function! s:archive(comment) range
  let l:path = expand('%:p')
  if l:path ==# ''
    echoerr 'No filename'
    return
  endif

  execute (a:firstline . ',' . a:lastline) . 'delete'

  if a:comment !=# ''
    let l:prefix = a:comment . ' - '
  else
    let l:prefix = ''
  endif

  let l:content = "\n\n\n[" . l:prefix . system('date | tr --delete "\n"') . "]\n\n" . @"

  let l:basename = printf('.%s.archive', fnamemodify(l:path, ':t'))
  let l:dir = fnamemodify(l:path, ':h')

  let l:file = vimproc#fopen(l:dir . '/' . l:basename, 'O_WRONLY | O_CREAT | O_APPEND')
  call l:file.write(l:content)
  call l:file.close()
endfunction

command! -nargs=* -range Archive <line1>,<line2>call s:archive(<q-args>)

" }}}

" chmod {{{

function! s:chmod(perm)
  let l:perm = len(a:perm) > 0 ? a:perm : '+x'
  let l:res = system('chmod ' . l:perm . ' ' . shellescape(expand('%')))
  write
  edit
endfunction

command! -bar -nargs=* Chmod :call s:chmod(<q-args>)

" }}}

" カレントファイルのパスをクリプボぅ! {{{

command! -nargs=* -bang -bar CopyCurrentFilepath :call s:copy_current_filepath('<bang>', <q-args>)

function! s:copy_current_filepath(bang, modifier)
  let l:path = expand('%' . a:modifier)
  if a:bang ==# '!'
    let l:path = printf('L%d@%s', line('.'), l:path)
  endif
  let @* = l:path
  let @+ = l:path
  echo printf('>> %s', l:path)
endfunction

" }}}

" 選択した行番号をコピペ {{{

function! s:ln(start, end, filename_modifier)
  if a:start == a:end
    let l:ln = printf('L%d', a:start)
  else
    let l:ln = printf('L%d-%d', a:start, a:end)
  endif

  if len(a:filename_modifier) > 0
    let l:ln .= '@' . expand('%' . a:filename_modifier)
  endif

  let @+ = l:ln
  let @* = l:ln
  echo l:ln
endfunction

" e.g)
"   :'<,'>Ln
"   :Ln
"   :Ln :t
command! -bar -range -nargs=? Ln call s:ln(<line1>, <Line2>, <q-args>)

" }}}

" numeronym -> n7m {{{

function! s:get_numeronym(word)
  let l:m = matchlist(a:word, '^\(.\)\(.*\)\(.\)$')
  return l:m[1] . string(len(l:m[2])) . l:m[3]
endfunction

function! s:numeronym(word)
  if len(a:word) > 0
    echo s:get_numeronym(a:word)
  else
    let l:word = s:get_numeronym(expand('<cword>'))
    execute 'normal ' . 'ciw' . l:word
  endif
endfunction

command! -bar -nargs=* Numeronym call s:numeronym(<q-args>)

" }}}

" バルーンで Syntax 情報を得てみる {{{

function! s:balloon_syntax(name)
  set ballooneval
  if a:name ==# 'syntax'
    set balloonexpr=synIDattr(synID(v:beval_lnum,\ v:beval_col,\ 1),\ 'name')
  elseif a:name ==# 'fold'
    set balloonexpr=foldballoon#balloonexpr()
  else
    echoerr 'Unknown type: ' . a:name
  endif
endfunction

function! s:balloon_syntax_compl(...)
  return ['syntax', 'fold']
endfunction

command! -bar -nargs=1 -complete=customlist,s:balloon_syntax_compl BallonSyntax call s:balloon_syntax(<q-args>)

" }}}

" テンキー表記を矢印に変換 {{{

function! s:kakuge_replace()
  " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  silent! keeppatterns '<,'>s/1/↙/g
  silent! keeppatterns '<,'>s/2/↓/g
  silent! keeppatterns '<,'>s/3/↘/g
  silent! keeppatterns '<,'>s/4/←/g
  silent! keeppatterns '<,'>s/5/Ｎ/g
  silent! keeppatterns '<,'>s/6/→/g
  silent! keeppatterns '<,'>s/7/↖/g
  silent! keeppatterns '<,'>s/8/↑/g
  silent! keeppatterns '<,'>s/9/↗/g
  silent! keeppatterns '<,'>s/p/Ｐ/gi
  silent! keeppatterns '<,'>s/k/Ｋ/gi
  silent! keeppatterns '<,'>s/h/Ｈ/gi
  silent! keeppatterns '<,'>s/t/Ｔ/gi
  " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
endfunction

command! -bar -range=% KakugeReplace call s:kakuge_replace()

" }}}

" らんらんコマンド (quickrun) {{{

let s:anekos_fixed_run_command = 'QuickRun'

function! s:fix_run_command(command, for_global)
  let l:command = len(a:command) ? a:command : getreg(':')

  if a:for_global
    let s:anekos_fixed_run_command = l:command
  else
    let b:anekos_fixed_run_command = l:command
  endif
  echo 'fixed: ' . l:command
endfunction

function! s:run_run_command()
  let l:cmd = get(b:, 'anekos_fixed_run_command', s:anekos_fixed_run_command)
  echomsg 'RunRun: ' . l:cmd . "\n"
  execute l:cmd
endfunction

command! -nargs=* -range FixRunCommand call s:fix_run_command(<q-args>, <bang>0)
command! -bar -range RunRunCommand call s:run_run_command()

noremap <Leader>r          :RunRunCommand<CR>
noremap <Leader><Leader>r  :FixRunCommand<CR>
noremap <Leader><Leader>R  :FixRunCommand!<CR>

" }}}

" 価格履歴 (price-watcher) {{{

function! s:extract_amazon_product_id (url)
  let l:patterns = [
    \ '.*/dp/\([^/]\+\).*',
    \ '.*/gp/product/\([^/]\+\).*'
    \ ]
  for l:pattern in l:patterns
    if match(a:url, l:pattern) >= 0
      return substitute(a:url, l:pattern, '\1', '')
    endif
  endfor
  return 0
endfunction

function! s:show_price_log (id)
  let l:id = a:id ==# '' ? s:extract_amazon_product_id(s:url_on_cursor()) : a:id
  echo system('price-watcher log ' . shellescape(l:id))
endfunction

function! s:url_on_cursor ()
  let l:line = getline('.')
  let l:col = col('.')
  let l:left = l:line[0 : l:col - 2]
  let l:right = l:line[l:col - 1 : -1]

  let l:left = substitute(l:left, '^ *', '', '')
  let l:right = matchstr(l:right, '[^() ]\+')
  let l:url = l:left . l:right
  return l:url
endfunction

" Amazon の URL を引数に、価格の履歴を抜きだす
command! -bar -nargs=* PriceLog call s:show_price_log(<q-args>)

" }}}

" ファイル名っぽいのをカーソル周辺から探してジャンプするんだね {{{

let s:jump_code_range = 10

function! s:remove_esc_seq (line)
  return substitute(a:line, '\e\[[^m]*m', '', 'g')
endfunction

function! s:extract_code_path (line)
  let l:line = s:remove_esc_seq(a:line)
  let l:match = matchlist(l:line, '\v(%([-_.a-z0-9]*/)*%([-_.a-z0-9]+))%(:(\d+))%(:(\d+))?')
  if len(l:match) > 0
    let l:filepath = l:match[1]
    let l:line = str2nr(l:match[2])
    let l:col = str2nr(l:match[3])

    if filereadable(l:filepath)
      return [1, l:filepath, l:line, l:col]
    endif
  endif

  return [0, 0, 0, 1]
endfunction

function! s:jump_to_file (filepath, ln, col)
  1wincmd w

  if fnamemodify(bufname(winbufnr(1)), ':p') !=# fnamemodify(a:filepath, ':p')
    execute 'edit' a:filepath
  endif

  if a:ln
    execute a:ln
  endif

  if a:col
    if a:col == 1
      normal! 0
    else
      execute 'normal!' printf('0%dl', a:col - 1)
    endif
  endif

  normal! zz
endfunction

function! s:jump_code ()
  let l:line = line('.')

  for l:i in range(0, s:jump_code_range)

    let l:target_ln = l:line - l:i
    let [l:found, l:filepath, l:ln, l:col] = s:extract_code_path(getline(l:target_ln))

    if !l:found
      let l:target_ln = l:line + l:i
      let [l:found, l:filepath, l:ln, l:col] = s:extract_code_path(getline(l:target_ln))
    endif

    if l:found
      if l:ln == 0
        let l:matched = matchlist(getline(l:target_ln + 1), '\(\d\+\)\(:\(\d\+\)\)\=')
        if len(l:matched) > 0
          let l:ln = str2nr(l:matched[1])
          let l:col = str2nr(l:matched[3])
        endif
      endif

      call s:jump_to_file(l:filepath, l:ln, l:col)
      return
    end
  endfor
endfunction

command! -bar JumpCode call s:jump_code()

" }}}

" chdir to project dirctory (git) {{{

function! s:ch_dir_to_poject_directory ()
  let l:dir = expand('%:hp')

  while 1
    if isdirectory(l:dir . '/.git')
      execute 'lcd' l:dir
      return
    endif

    let l:next = fnamemodify(l:dir, ':h')
    if l:next == l:dir
      return
    endif

    let l:dir = l:next
  endwhile
endfunction

command! -bar CdProjectRoot call s:ch_dir_to_poject_directory()

" }}}

" ヘルプ以外の空バッファウィンドウを閉じる {{{

function! s:kill_me_baby ()
  let l:blanks = 0
  let l:helps = 0
  for l:n in tabpagebuflist()
    if getbufvar(l:n, '&filetype') ==# 'help'
      let l:helps += 1
    elseif bufname(l:n) ==# ''
      let l:blanks += 1
    endif
  endfor

  if l:blanks > 0 && l:helps > 0
    only
  endif
endfunction

command! -bar KillMeBaby call s:kill_me_baby()

" }}}

" cpo の設定を後付け {{{

function! s:insert_cpo()
  call append(0, ['let s:save_cpo = &cpo', 'set cpo&vim', '', ''])
  call append(line('$'), ['', '', 'let &cpo = s:save_cpo', 'unlet s:save_cpo'])
  normal! gg
  redraw
  sleep 1
  normal! G
endfunction

command! -bar InsertCpo call s:insert_cpo()

" }}}

" バッファを grep {{{

function! s:buffer_grep(query)
  execute 'silent!' 'bufdo' 'vimgrepadd' printf('/%s/', escape(a:query, '/\')) '%'
endfunction

command! -bar -nargs=* BGrep call s:buffer_grep(<q-args>)

" }}}

" figlet {{{

" rc ファイルヘッダ用
" http://ultimacodex.com/archive/runic/ 内の http://ultimacodex.com/archive/ftp/misc/fonts/runeflf.zip
command! -nargs=* Figlet .! figlet -d ~/.figlet -f rune -w 1000 <q-args>

" }}}

" panty {{{

function! s:panty_init (dir)
  sleep 100m

  if len(a:dir)
    execute 'cd' a:dir
  endif

  " http://d.hatena.ne.jp/osyo-manga/20131217/1387292034 - vim-startify を unite.vim で代替してみる - C++でゲームプログラミング
  if bufnr('$') <= 6
    let l:max_candidates = (&lines - 10) / 2
    call unite#custom_max_candidates('panty_file_mru', l:max_candidates)
    call unite#custom_max_candidates('panty_directory_mru', l:max_candidates)

    " Unite -select=0 output:echo:"==:directory:mru:===":! file

    Unite
    \ output:echo:"===:directory:mru:===":!
    \ panty_directory_mru
    \ output:echo:":":!
    \ output:echo:"===:file:mru:===":!
    \ panty_file_mru
    \ output:echo:":":!
    \ -hide-source-names
    \ -default-action=open_panty
    \ -no-split
    " \ -quick-match
  endif
endfunction

command! -bar -nargs=* PantyInit call s:panty_init(<q-args>)

" }}}

" 文字ケース変換 {{{

function! s:to_underscore_case ()
  let l:words = substitute(substitute(expand('<cword>'), '^.', '\l\0', ''), '\C\([A-Z]\+\)', '_\l\1', 'g')
  execute 'normal!' 'ciw' . l:words
endfunction

command! -bar CaseUnderScore call s:to_underscore_case()

" }}}

" 空バッファなどを削除  {{{

function! s:burn_empty_buffers()
  let l:killed = 0

  for l:nr in range(1, bufnr('$'))
    if buflisted(l:nr) == 1 && bufloaded(l:nr) == 1 && bufname(l:nr) ==# ''
      let l:killed += 1
      execute 'bdelete!' l:nr
    endif
  endfor

  echomsg printf('%d buffers have been killed!', l:killed)
endfunction

command! -bar Burn call s:burn_empty_buffers()

" }}}

" MFC {{{

function! s:mfc_calc(expr)
  echo substitute(system('mfc ' . shellescape(a:expr) . ' println'), '^$', '', 'g')
endfunction

command! -nargs=* MFC :call s:mfc_calc(<q-args>)

" }}}

" Maximize もどき {{{

function! s:maximize_modoki()
  if exists('t:maximize_modoki__back_to')
    let l:back_to = t:maximize_modoki__back_to
    tabclose
    execute 'tabnext' l:back_to
  else
    let l:back_to = tabpagenr()
    let l:bufnr = winbufnr(0)
    let l:linenr = line('.')
    tabnew
    execute 'buffer' l:bufnr
    execute l:linenr
    call settabvar(tabpagenr(), 'maximize_modoki__back_to', l:back_to)
  endif
endfunction

command! -bar MaximizeModoki call s:maximize_modoki()

" }}}

" 空のウィンドウを削除してサイズを揃える {{{

function! s:CleanupNotMicrosofts()
  for l:winnr in range(1, winnr('$'))
    let l:bufnr = winbufnr(l:winnr)
    if l:bufnr >= 0 
      if bufname(l:bufnr) ==# ''
        execute 'bdelete' l:bufnr
      elseif getbufvar(l:bufnr, '&filetype', '') ==# 'quickrun'
        execute 'bdelete!' l:bufnr
      endif
    endif
  endfor

  wincmd =
endfunction

command! -bar CleanupWindows call s:CleanupNotMicrosofts()

" }}}

" which して開く {{{

" FUXME Wonderful dependencism
command! -nargs=* -complete=customlist,vimshell#helpers#vimshell_execute_complete Which call s:which(<q-args>)

function! s:which(command_name)
  let l:path = systemlist(printf('which %s', shellescape(a:command_name)))
  if v:shell_error == 0
    execute 'edit' path[0]
  else
    echoerr printf('Command not found: %s', a:command_name)
  endif
endfunction

" }}}

" re-panty {{{

command! -nargs=0 Repanty :call s:repanty()

function! s:repanty() abort
  silent mksession! /tmp/repanty.vim
  bwipeout
  echo system('panty summon --send ":so /tmp/repanty.vim<CR>"')
  quitall
endfunction

" }}}

" XMonad xc を使ってウィンドウをリフレッシュ {{{

function! s:xmonad_refresh_window_delayed(...)
  silent call vimproc#system('~/.xmonad/bin/xc command refresh-window')
endfunction

function! s:xmonad_refresh_window()
  if !has('gui_running')
    return
  endif

  call timer_start(200, function('s:xmonad_refresh_window_delayed'))
endfunction

command! -bar XMonadRefreshWindow call s:xmonad_refresh_window()

" }}}

" errorformat のテスト {{{

function! s:test_errorformat(buf)
  try
    cgetexpr getbufline(a:buf, 1, '$')
    " PP filter(getqflist(), 'v:val.lnum > 0')
    PP getqflist()
  catch
    echo v:exception
    echo v:throwpoint
  finally
  endtry
endfunction

command! -nargs=1 -complete=buffer TestErrorFormat call s:test_errorformat(<q-args>)

" }}}

" タグファイルを生成する {{{

function! s:gen_tag_file__scala()
  let l:cmdline = ['ctags', '--language-force=scala', '--recurse']

  for l:dir in map(systemlist('find -name build.sbt'), "fnamemodify(v:val, ':h')")
    call add(l:cmdline, l:dir . '/app')
    call add(l:cmdline, l:dir . '/src')
  endfor

  return l:cmdline
endfunction

function! s:generate_tag_file(...)
  let l:filetype = get(a:, 0, &filetype)
  if len(l:filetype)
    let l:filetype = &filetype
  endif
  let l:cmdline = call('s:gen_tag_file__' . l:filetype, [])
  call system(join(l:cmdline, ' '))
endfunction

command! -nargs=? Gentags call s:generate_tag_file(<q-args>)

" }}}
