"================================
" |\  |\  /|   |   | |\  /| |\
" | \ | \/ |   |   | | /\ | |\ \
" |   |    |  /|\  | |/  \| |  \
" |   |    | / | \ | |    | |
"================================

" Pasco http://www.pasconet.co.jp/

let g:lexima_enable_basic_rules = 0

let s:sixima = [
\   {'char': '(', 'input_after': ')'},
\   {'char': '(', 'at': '\\\%#'},
\   {'char': ')', 'at': '\%#)', 'leave': 1},
\   {'char': '<BS>', 'at': '(\%#)', 'delete': 1},
\   {'char': '{', 'input_after': '}'},
\   {'char': '}', 'at': '\%#}', 'leave': 1},
\   {'char': '<BS>', 'at': '{\%#}', 'delete': 1},
\   {'char': '[', 'input_after': ']'},
\   {'char': '[', 'at': '\\\%#'},
\   {'char': ']', 'at': '\%#]', 'leave': 1},
\   {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
\ ]

let s:sixima += [
\   {'char': '"', 'input_after': '"'},
\   {'char': '"', 'at': '\%#"', 'leave': 1},
\   {'char': '"', 'at': '\\\%#'},
\   {'char': '"', 'at': '^\s*\%#', 'filetype': 'vim'},
\   {'char': '"', 'at': '\%#\s*$', 'filetype': 'vim'},
\   {'char': '<BS>', 'at': '"\%#"', 'delete': 1},
\   {'char': '"', 'at': '""\%#', 'input_after': '"""'},
\   {'char': '"', 'at': '\%#"""', 'leave': 3},
\   {'char': '<BS>', 'at': '"""\%#"""', 'input': '<BS><BS><BS>', 'delete': 3},
\   {'char': "'", 'input_after': "'"},
\   {'char': "'", 'at': '\%#''', 'leave': 1},
\   {'char': "'", 'at': '\w\%#''\@!'},
\   {'char': "'", 'at': '\\\%#'},
\   {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
\   {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'scala']},
\   {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
\   {'char': "'", 'at': "''\\%#", 'input_after': "'''"},
\   {'char': "'", 'at': "\\%#'''", 'leave': 3},
\   {'char': '<BS>', 'at': "'''\\%#'''", 'input': '<BS><BS><BS>', 'delete': 3},
\   {'char': '`', 'input_after': '`'},
\   {'char': '`', 'at': '\%#`', 'leave': 1},
\   {'char': '<BS>', 'at': '`\%#`', 'delete': 1},
\   {'char': '`', 'filetype': ['ocaml']},
\   {'char': '`', 'at': '``\%#', 'input_after': '```'},
\   {'char': '`', 'at': '\%#```', 'leave': 3},
\   {'char': '<BS>', 'at': '```\%#```', 'input': '<BS><BS><BS>', 'delete': 3},
\ ]

" Beautiful fuck for &'lifetime
let s:sixima += [
\   {'char': "'", 'input_after': '', 'filetype': 'rust', 'priority': 666},
\ ]


for s:rule in s:sixima
  call lexima#add_rule(s:rule)
endfor
