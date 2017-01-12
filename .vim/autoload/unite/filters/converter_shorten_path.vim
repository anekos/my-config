
let s:save_cpo = &cpo
set cpo&vim


let s:converter = {
\   'name': 'converter_shorten_path',
\   'description': 'Shorten path'
\ }

function! unite#filters#converter_shorten_path#define() abort
  return s:converter
endfunction

function! s:convert(candidate) abort
  let l:candidate = deepcopy(a:candidate)
  let l:abbr = get(l:candidate, 'abbr', get(l:candidate, 'word', l:candidate.action__path))
  let l:candidate.abbr = fnamemodify(l:abbr, ':~:.')
  return l:candidate
endfunction

function! s:is_valid(candidate) abort
  return fnamemodify(a:candidate.action__path, ':e') !=# 'archive'
endfunction

function! s:converter.filter(candidates, context) abort
  return map(filter(deepcopy(a:candidates), 's:is_valid(v:val)'), 's:convert(v:val)')
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
