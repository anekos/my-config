"  ____________________
" < ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >
"  --------------------
"         \   ^__^
"          \ (◕‿‿◕)\_______
"            /(__)\       )\/\
"              || ||----w |
"                 ||     ||


scriptencoding utf8

let g:quickrun_config = {
\   '_' : {
\     'runner' : 'job',
\     'runner/job/interval' : 1,
\     'runner/vimproc/sleep' : 10,
\     'runner/vimproc/updatetime' : 600,
\     'hook/nuko/enable' : 0,
\     'hook/nuko/wait' : 2,
\     'outputter': 'multi',
\     'outputter/buffer/split': 'vertical rightbelow',
\     'outputter/buffer/close_on_empty' : 1,
\     'outputter/buffer/running_mark': " ____________________\n< ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >\n --------------------\n        \\   ^__^\n         \\ (◕‿‿◕)\\_______\n           /(__)\\       )\\/\\\n             || ||----w |\n                ||     ||",
\     'outputter/quickfix/open_cmd': '',
\     'outputter/multi/targets': ['buffer', 'quickfix']
\   },
\   'make' : {
\     'command': 'make',
\     'exec': '%c %o',
\     'outputter': 'buffer'
\   },
\   'javascript': {
\     'command': 'eslint'
\   },
\   'scala': {
\     'type': 'scala/sbt/test-compile'
\   },
\   'scala/sbt/compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/test-compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test:compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/test': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/sync/compile': {
\     'command': 'sbt',
\     'exec': '%c -Dsbt.log.noformat=true compile'
\   },
\   'scala/sbt/sync/test-compile': {
\     'command': 'sbt',
\     'exec': '%c -Dsbt.log.noformat=true test:compile',
\     'outputter': 'quickfix'
\   },
\   'clojure': {
\     'type': 'clojure/lein/load-file'
\   },
\   'clojure/clj': {'command': 'clj', 'exec': '%c %s %a'},
\   'clojure/watchdogs_checker': {
\     'type': 'clojure/lein/eastwood'
\   },
\   'clojure/lein/compile': {
\     'command': 'lein',
\     'exec': '%c compile %a'
\   },
\   'clojure/lein/run': {
\     'command': 'lein',
\     'exec': '%c run %a'
\   },
\   'clojure/lein/test': {
\     'command': 'lein',
\     'exec': '%c test %a'
\   },
\   'clojure/lein/load-file': {
\     'command': 'lein',
\     'cmdopt': 'repl',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': '(load-file "%S")',
\     'runner/concurrent_process/prompt': '.*=> '
\   },
\   'clojure/lein/eastwood': {
\     'type': 'watchdogs_checker/eastwood'
\   },
\   'clojure/lein/deps': {
\     'command': 'lein',
\     'exec': '%c deps %a'
\   },
\   'clojure/neoclojure': {
\     'runner': 'neoclojure',
\     'command': 'dummy',
\     'tempfile'  : '%{tempname()}.clj'
\   },
\   'lisp/sbcl': {
\     'command': 'sbcl',
\     'cmdopt': '--script',
\   },
\   'json/elasticsearch-curl': {
\     'command': '$HOME/script/dev/elasticsearch/curl',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/buffer/filetype': 'json',
\     'outputter/error/success': 'buffer',
\     'outputter/error/error': 'message'
\   },
\   'json/elasticsearch-search': {
\     'command': expand('~/script/dev/elasticsearch/search-with-json'),
\     'exec': '%c %a %s',
\     'outputter': 'error',
\     'outputter/buffer/filetype': 'json',
\     'outputter/error/success': 'buffer',
\     'outputter/error/error': 'message'
\   },
\   'haskell': {'type': 'haskell/runghc'},
\   'haskell/cabal': {
\     'command': 'cabal',
\     'exec': '%c build %o',
\     'cmdopt': ''
\   },
\   'markdown': {
\     'command': '$HOME/bin/preview-markdown',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox': {'type': 'nox/preview'},
\   'nox/preview': {
\     'command': '$HOME/bin/preview-nox',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox/pandoc/markdown/html': {
\     'command': 'pandoc',
\     'exec': '%c --from markdown --to html %s'
\   },
\   'nox/remark.js': {
\     'command': '$HOME/script/markdown/remark.js',
\     'exec': '%c %s'
\   },
\   'text': {
\     'type': 'text/split-sentences-jp'
\   },
\   'text/split-sentences-jp': {
\     'runner': 'vimscript',
\     'outputter': 'message',
\     'exec': '%%s/。/\r/g'
\   },
\   'vim/watchdogs_checker': {
\     'type': executable('vint') ? 'watchdogs_checker/vint' : '',
\   },
\   'rust': {
\     'type': 'rust/cargo/quickfix'
\   },
\   'rust/watchdogs_checker': {
\     'type': 'rust/cargo/quickfix',
\     'outputter': 'quickfix',
\   },
\   'rust/rustc': {
\     'command': 'rustc',
\     'exec': ['RUST_LOG=error %c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.rs',
\     'hook/sweep/files': '%S:p:r',
\   },
\   'rust/cargo/quickfix': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c quickfix %o',
\   },
\   'rust/cargo/build': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c build %o',
\   },
\   'rust/cargo/run': {
\     'command': 'cargo',
\     'exec': '%c run %o',
\   },
\   'rust/cargo/script': {
\     'command': 'cargo',
\     'exec': '%c script %s %a',
\   },
\   'rust/clippy': {
\     'command': 'cargo',
\     'exec': ['RUST_LOG=error %c clean --target=debug', 'RUST_LOG=error %c +nightly clippy'],
\   },
\   'sh/watchdogs_checker': {
\     'type': 'watchdogs_checker/shellcheck',
\   },
\	  'watchdogs_checker/_' : {
\     'outputter': 'quickfix',
\	  	'outputter/quickfix/open_cmd': 'HierStart',
\     'hook/echo/enable': 1,
\     'hook/echo/output_failure': '> Some Errors Found!!!!',
\     'hook/echo/output_success': '> No Errors Found.',
\     'hook/qfstatusline_update/enable_exit': 1,
\     'hook/qfstatusline_update/priority_exit': 4,
\	  },
\   'watchdogs_checker/vint' : {
\     'command': 'vint',
\     'exec': '%c %o %s:p',
\   },
\   'watchdogs_checker/eastwood' : {
\     'command': 'lein',
\     'exec': '%c eastwood %a',
\     'hook/nuko/enable' : 1,
\   },
\   'watchdogs_checker/shellcheck' : {
\     'command': 'shellcheck',
\     'exec': '%c %s'
\   },
\ }

command! -bar -range QuicKill call quickrun#sweep_sessions()
command! -bar InitQuickRun call quickrun#get_module('runner')

let g:Qfstatusline#UpdateCmd = function('lightline#update')

" http://d.hatena.ne.jp/osyo-manga/20120919/1348054752 - shabadou.vim を使って quickrun.vim をカスタマイズしよう - C++でゲームプログラミング

let g:watchdogs_check_BufWritePost_enables = {'sh': 1, 'scala': 0, 'rust': 1}
let g:watchdogs_check_CursorHold_enable = 0
call watchdogs#setup(g:quickrun_config)


" quickrun のバッファ毎の設定をしてみる
function! s:set_quickrun_config()
  if filereadable('Cargo.toml')
    let l:name = 'rust/cargo/quickfix'
  elseif filereadable('Makefile')
    let l:name = 'make'
  else
    return
  endif

  let b:quickrun_config = {'type': l:name}
endfunction
autocmd Meowrc BufReadPost * call s:set_quickrun_config()
