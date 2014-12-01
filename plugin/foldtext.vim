" vim: foldmethod=marker

" GUARD {{{1
if exists("s:loaded") || &cp || version < 700
  finish
endif
let s:loaded = 1
" }}}1

let g:foldline_fancy_symbol = '»'

function GlobalFoldText() " {{{1
  let foldline = getline(v:foldstart)

  " remove fold marker.
  if &foldmethod ==# 'marker'
    let [mk_open, mk_close] = split(&foldmarker, ',')
    let foldline = substitute(foldline, '\M\C' . mk_open . '\.\*$', '', 'g')
    let foldline = substitute(foldline, '\M\C' . mk_close . '\.\*$', '', 'g')
  endif

  " prefix a fancy symbol.
  let foldline = g:foldline_fancy_symbol . foldline

  return foldline
endfunction "  }}}1

" HELPER FUNCTIONS {{{1

" can only be used in fold functions.
function! FoldLevelIndent(padding) " {{{2
  let level_indent = ''
  for x in range(foldlevel(v:foldstart))
    let level_indent = level_indent . a:padding
  endfor
  return level_indent
endfunction "  }}}2

function! StripFolderMarker(line) " {{{2
  if &l:foldmethod ==# 'marker'
    let [mk_open, mk_close] = split(&l:foldmarker, ',')
    let mk_open = escape(mk_open, '\')
    let ret_line = substitute(a:line, '\V\C' . mk_open . '\m\d\?\s*$', '', '')
  endif
  return ret_line
endfunction "  }}}2

" }}}1

set foldtext=GlobalFoldText()
