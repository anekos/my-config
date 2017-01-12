
" setlocal tags=./rusty-tags.vi;/
setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
" autocmd BufWrite *.rs :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&"


finish

function! s:TestErrFmt(lines)
  try
    cexpr join(a:lines, "\n")
    copen
  catch
    echo v:exception
    echo v:throwpoint
  endtry
endfunction

let &errorformat  =
  \ '%-G%\s%#Compiling%.%#,' .
  \ '%-G%\s%#error: aborting%.%#,' .
  \ '%-G%\s%#error: Could not compile%.%#,' .
  \ '%-G%\s%#To learn more%.%#,' .
  \ '%Eerror[%.%#]: %m,' .
  \ '%C   --> %f:%l:%c,' .
  \ '%C%.%.%#,' .
  \ '%-Z,' .
  \ '%-G|| To learn more%.%#'

" call s:TestErrFmt(['   Compiling panty v0.6.0 (file:///home/anekos/project/panty-dev)', 'error[E0004]: non-exhaustive patterns: `Panty(_)` not covered', '   --> src/lister/mod.rs:86:31', '    |', '82  |     with_display!(display => {', '    |     - in this macro invocation', '...', '86  |                 let m = match condition {', '    |                               ^^^^^^^^^ pattern `Panty(_)` not covered', '', 'error: aborting due to previous error', '', 'error: Could not compile `panty`.', '', 'To learn more, run the command again with --verbose.'])
