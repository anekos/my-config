"  ____________________
" < ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >
"  --------------------
"         \   ^__^
"          \ (◕‿‿◕)\_______
"            /(__)\       )\/\
"              || ||----w |
"                 ||     ||


scriptencoding utf8


if 0-0
  silent /^let s:jobs/+1,/^\\ } " jobs/-1OSort {$
  silent /^let s:common/+1,/^\\ } " common/-1OSort {$
  silent /^let s:watchdogs/+1,/^\\ } " watchdogs/-1OSort {$
endif

let s:common = {
\   '_': {
\     'runner': 'job',
\     'runner/vimproc/sleep': 10,
\     'runner/vimproc/updatetime': 600,
\     'hook/nuko/enable': 0,
\     'hook/nuko/wait': 2,
\     'hook/lightline_quickrun_status/enable': 1,
\     'outputter': 'multi',
\     'outputter/buffer/split': 'vertical rightbelow',
\     'outputter/buffer/close_on_empty': 1,
\     'outputter/buffer/running_mark': " ____________________\n< ﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮﾐｮ >\n --------------------\n        \\   ^__^\n         \\ (◕‿‿◕)\\_______\n           /(__)\\       )\\/\\\n             || ||----w |\n                ||     ||",
\     'outputter/quickfix/open_cmd': '',
\     'outputter/multi/targets': ['buffer', 'quickfix']
\   }
\ } " common

let s:jobs = {
\   'clojure': {
\     'type': 'clojure/lein/load-file'
\   },
\   'clojure/clj': {
\     'command': 'clj',
\     'exec': '%c %s %a'
\   },
\   'clojure/lein/compile': {
\     'command': 'lein',
\     'exec': '%c compile %a'
\   },
\   'clojure/lein/deps': {
\     'command': 'lein',
\     'exec': '%c deps %a'
\   },
\   'clojure/lein/load-file': {
\     'command': 'lein',
\     'cmdopt': 'repl',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': '(load-file "%S")',
\     'runner/concurrent_process/prompt': '.*=> '
\   },
\   'clojure/lein/run': {
\     'command': 'lein',
\     'exec': '%c run %a'
\   },
\   'clojure/lein/test': {
\     'command': 'lein',
\     'exec': '%c test %a'
\   },
\   'clojure/neoclojure': {
\     'runner': 'neoclojure',
\     'command': 'dummy',
\     'tempfile': '%{tempname()}.clj'
\   },
\   'clojure/watchdogs_checker': {
\     'type': 'watchdogs_checker/clojure/eastwood'
\   },
\   'haskell/cabal': {
\     'command': 'cabal',
\     'exec': '%c build %o',
\     'cmdopt': ''
\   },
\   'javascript': {
\     'type': 'javascript/eslint',
\   },
\   'javascript/eslint': {
\     'command': 'eslint',
\     'exec': '%c --format unix %s',
\   },
\   'json': {
\     'type': 'json/elasticsearch/curl',
\   },
\   'json/elasticsearch/curl': {
\     'command': expand('~/script/dev/elasticsearch/curl'),
\     'exec': '%c %s',
\     'outputter': 'buffer'
\   },
\   'haskell': {'type': 'haskell/runghc'},
\   'lisp': {
\     'type': 'lisp/sbcl/load'
\   },
\   'lisp/sbcl/load': {
\     'command': 'sbcl',
\     'exec': '%c --noinform --quit --load %s',
\   },
\   'lisp/sbcl/script': {
\     'command': 'sbcl',
\     'cmdopt': '--script',
\   },
\   'make': {
\     'command': 'make',
\     'exec': '%c %o',
\     'outputter': 'buffer'
\   },
\   'markdown': {
\     'command': '$HOME/bin/preview-markdown',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox': {'type': 'nox/preview'},
\   'nox/pandoc/markdown/html': {
\     'command': 'pandoc',
\     'exec': '%c --from markdown --to html %s'
\   },
\   'nox/preview': {
\     'command': '$HOME/bin/preview-nox',
\     'exec': '%c %s',
\     'outputter': 'error',
\     'outputter/error/success': 'message',
\     'outputter/error/error': 'buffer',
\   },
\   'nox/remark.js': {
\     'command': '$HOME/script/markdown/remark.js',
\     'exec': '%c %s'
\   },
\   'python2': {
\     'command': 'python2',
\     'exec': '%c %s',
\   },
\   'ruby/script': {
\     'command': 'ruby',
\     'exec': '%c %s %a',
\   },
\   'rust': {
\     'type': 'rust/cargo/build'
\   },
\   'rust/cargo/build': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c build %o',
\   },
\   'rust/cargo/clean': {
\     'command': 'cargo',
\     'exec': '%c clean %a',
\   },
\   'rust/cargo/clippy': {
\     'command': 'cargo',
\     'exec': ['RUST_LOG=error %c clean --target=debug', 'RUST_LOG=error %c +nightly clippy'],
\   },
\   'rust/cargo/quickfix': {
\     'command': 'cargo',
\     'exec': '%c quickfix',
\   },
\   'rust/cargo/release': {
\     'command': 'cargo',
\     'exec': 'RUST_LOG=error %c build --release %o',
\   },
\   'rust/cargo/run': {
\     'command': 'cargo',
\     'exec': '%c run %o',
\   },
\   'rust/cargo/script': {
\     'command': 'cargo',
\     'exec': '%c script %s %a',
\   },
\   'rust/cargo/test': {
\     'command': 'cargo',
\     'exec': '%c test %o',
\   },
\   'rust/rustc': {
\     'command': 'rustc',
\     'exec': ['RUST_LOG=error %c %o %s -o %s:p:r', '%s:p:r %a'],
\     'tempfile': '%{tempname()}.rs',
\     'hook/sweep/files': '%S:p:r',
\   },
\   'rust/rustc/syntax': {
\     'command': 'rustc',
\     'exec': ['RUST_LOG=error %c +nightly %o -Zparse-only %s'],
\   },
\   'rust/watchdogs_checker': {
\     'type': 'watchdogs_checker/rust/update',
\   },
\   'scala': {
\     'type': 'scala/sbt/test-compile'
\   },
\   'scala/sbt/clean': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'clean',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'compile',
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
\   'scala/sbt/test': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/sbt/test-compile': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test:compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'scala/tags': {
\     'command': 'bash',
\     'exec': "%c -c 'ctags --language-force=scala --recurse'",
\     'outputter': 'error',
\     'outputter/error/success': 'null',
\     'outputter/error/error': 'message',
\   },
\   'scala/watchdogs_checker': {
\     'type': 'watchdogs_checker/scala/sbt'
\   },
\   'sh/watchdogs_checker': {
\     'type': 'watchdogs_checker/sh/shellcheck',
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
\     'type': 'watchdogs_checker/vim/vint',
\   },
\ } " jobs

let s:watchdogs = {
\   'watchdogs_checker/_': {
\     'hook/echo/enable': 1,
\     'outputter': 'quickfix',
\     'outputter/quickfix/open_cmd': 'HierStart',
\     'hook/lightline/enable': 1,
\   },
\   'watchdogs_checker/clojure/eastwood': {
\     'command': 'lein',
\     'exec': '%c eastwood %a',
\     'hook/nuko/enable': 1,
\   },
\   'watchdogs_checker/rust/cargo/quickfix': {
\     'command': 'cargo',
\     'exec': '%c quickfix',
\   },
\   'watchdogs_checker/rust/rusty-tags': {
\     'command': 'rusty-tags',
\     'exec': '%c --quiet vi',
\   },
\   'watchdogs_checker/rust/update': {
\     'command': '_',
\     'exec': ['cargo quickfix', 'rusty-tags --quiet vi'],
\   },
\   'watchdogs_checker/scala/sbt': {
\     'command': 'sbt',
\     'cmdopt': '-Dsbt.log.noformat=true',
\     'runner': 'concurrent_process',
\     'runner/concurrent_process/load': 'test:compile',
\     'runner/concurrent_process/prompt': '\[.*\] \$ '
\   },
\   'watchdogs_checker/sh/shellcheck': {
\     'command': 'shellcheck',
\     'exec': '%c --format gcc %s'
\   },
\   'watchdogs_checker/vim/vint': {
\     'command': 'vint',
\     'exec': '%c %s',
\   },
\ } " watchdogs


" ↑の設定をマージしてセットする
let g:quickrun_config = extend(extend(s:common, s:jobs, 'error'), s:watchdogs, 'error')


" なにこれ?
command! -bar -range QuicKill call quickrun#sweep_sessions()
command! -bar InitQuickRun call quickrun#get_module('runner')


" ∪･ω･∪ - http://d.hatena.ne.jp/osyo-manga/20120919/1348054752 - shabadou.vim を使って quickrun.vim をカスタマイズしよう - C++でゲームプログラミング
let g:watchdogs_check_BufWritePost_enables = {'_': 1, 'sh': 1, 'scala': 0, 'rust': 1, 'vim': 1}
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
" やっぱり、やめるとく?
" autocmd Meowrc BufReadPost * call s:set_quickrun_config()
