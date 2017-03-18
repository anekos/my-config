

let &errorformat =
\   '  %l:%c  %t%*[^ ]%*[  ]%m,' .
\   '%+P%f,' .
\   ''

" let &errorformat =
" \   '%E[%f],' .
" \   '%C  %l:%c %m,' .
" \   '%Z' .
" \   ''

" @,48-57,/,.,-,_,+,,,#,$,%,~,=

TestErrorFormat /tmp/xmosh/eserr
