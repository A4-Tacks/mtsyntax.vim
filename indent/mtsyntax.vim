" Vim syntax file
" Language:		mtsyntax
" Maintainer:		A4-Tacks <wdsjxhno1001@163.com>
" Last Change:		2024-06-26
" URL:			https://github.com/A4-Tacks/abnf_to_mtsx

if exists('b:did_indent')
    finish
endif
let b:did_indent = 1

function! s:filter_line(l) " {{{
    let l = substitute(a:l, '"\%(\\["\\]\|[^"]\)*"\|'
                \.'/\%(\\/\|[^/]\)\+/', "''", 'g')

    let l = substitute(l, '\%(^ *\|[ \t]*\%(//.*\)\=$\)', '', 'g')
    return l
endfunction " }}}
function! GetMtsyntaxIndent() "{{{
    let lnum = v:lnum
    let pnum = prevnonblank(lnum-1)
    let diff = 0

    if s:filter_line(getline(pnum)) =~# '[{[]$'
        let diff += 1
    endif

    if s:filter_line(getline(lnum)) =~# '^[}\]]'
        let diff -= 1
    endif

    let indent = indent(pnum) + (diff * &shiftwidth)

    if indent < 0 | return 0 | endif
    return indent
endfunction "}}}

setlocal indentexpr=GetMtsyntaxIndent()
setlocal indentkeys=0),0],0},o,O

" vim:ts=8 sts=8 noet
