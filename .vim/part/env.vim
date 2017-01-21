"=====================
" |\  /|   |   |\__
" | \/ |  _|_| |   \
" |    | | |   |    |
" |    |   |   |    |
"=====================


if !exists('g:original_env_path')
  let g:original_env_path = $PATH
endif

let $PATH = join([expand('~/bin'), expand('~/.cabal/bin'), g:original_env_path], ':')
