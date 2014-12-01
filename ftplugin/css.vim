" vim: foldmethod=marker

function! CSSFoldText() " {{{1
  let foldline = getline(v:foldstart)

  " remove comment marker.
  let foldline = substitute(foldline, '\/\*\|\*\/', '', 'g')

  " remove folder marker
  let foldline = StripFolderMarker(foldline)

  " strip redundant heading space
  let foldline = substitute(foldline, '^\s*', ' ' , '')

  return g:foldline_fancy_symbol . FoldLevelIndent('-') . foldline
endfunction "  }}}1

setlocal foldtext=CSSFoldText()
