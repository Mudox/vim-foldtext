" vim: foldmethod=marker

function! VimFoldText() " {{{1
  let foldline = getline(v:foldstart)

  " remove fold marker.
  if &l:foldmethod ==# 'marker'
    " remove leanding double quote symbol that begin a comments line.
    "if foldline =~# '^\s*"'
    "let foldline = substitute(foldline, '^\s*\zs"', ' ', '')
    "endif

    let foldline = substitute(foldline, '"', ' ', '')

    " remove fold marker till the end of line.
    let [mk_open, mk_close] = split(&foldmarker, ',')
    let foldline = substitute(foldline, '\V\C' . mk_open . '\m.*$', '', 'g')
    let foldline = substitute(foldline, '\V\C' . mk_close . '\m.*$', '', 'g')
  endif

  let foldline = substitute(foldline, '^\s*', ' ' , '')

  return g:foldline_fancy_symbol . FoldLevelIndent('-') . foldline
endfunction "  }}}1

setlocal foldtext=VimFoldText()
