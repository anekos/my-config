

function! s:OpenAllProjectSource()
  echo filereadable('build.sbt')
  if filereadable('build.sbt')
    if isdirectory('app')
      args app/**/*.scala
    endif

    if isdirectory('modules')
      args modules/**/*.scala
    endif

    if isdirectory('src')
      args src/**/*.scala
    endif

    if isdirectory('conf')
      args conf/**/*.conf
    endif
  endif

  if glob('**/*.rst')
    args **/*.rst
  endif
endfunction

command! OpenAllProjectSource :call s:OpenAllProjectSource()
