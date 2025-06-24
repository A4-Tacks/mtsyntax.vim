" Vim syntax file
" Language:		MT-Syntax (mtsx)
" Maintainer:		A4-Tacks <wdsjxhno1001@163.com>
" Last Change:		2024-06-26
" URL:			https://github.com/A4-Tacks/abnf_to_mtsx

if exists("b:current_syntax")
    finish
endif

" debug clear
"syn clear

" 大小写敏感
syn case match

setlocal comments=://
setlocal commentstring=//%s
setlocal iskeyword+=-
setlocal foldmethod=syntax


syn region mtsyntaxString start=/"/ end=/"\|$/ contains=mtsyntaxStrEscape,mtsyntaxStrFailEscape
syn match mtsyntaxStrFailEscape /\\./ contained
syn match mtsyntaxStrEscape /\\\(x\x\x\|u\x\{4}\|[f'"\\tbnr]\)/ contained
hi def link mtsyntaxString String
hi def link mtsyntaxStrEscape SpecialChar
hi def link mtsyntaxStrFailEscape Error

syn region mtsyntaxRegex start="/" end="/\|$" contains=mtsyntaxRegexEscape,mtsyntaxRegexOtherEscape,mtsyntaxRegexCompactInclude oneline
syn match mtsyntaxRegexOtherEscape "\\\%(\\/\)\@!." contained
syn match mtsyntaxRegexEscape "\\/" contained
if has('conceal')
    syn region mtsyntaxRegexCompactInclude matchgroup=mtsyntaxRegexCompactIncludeGroup start=.\%(/\|)\@<=\)+include(". end=.")\%(+/\|\%(\%(+include("[^"]\+")\)\++/\)\@=\). oneline contained concealends cchar=/
else
    syn region mtsyntaxRegexCompactInclude matchgroup=mtsyntaxRegexCompactIncludeGroup start=.\%(/\|)\@<=\)+include(". end=.")\%(+/\|\%(\%(+include("[^"]\+")\)\++/\)\@=\). oneline contained
endif
hi def link mtsyntaxRegex String
hi def link mtsyntaxRegexOtherEscape mtsyntaxRegex
hi def link mtsyntaxRegexEscape SpecialChar
hi def link mtsyntaxRegexCompactInclude Include
hi def link mtsyntaxRegexCompactIncludeGroup Operator

syn match mtsyntaxBuiltin /#[0-9A-Z_]\+#/
syn match mtsyntaxColor /#\x\{3,8}\>/
syn match mtsyntaxRegexGroup /\v<(0|[1-9]\d*)>/
syn match mtsyntaxBoolean /\v<(true|false)>/
syn match mtsyntaxMeta /\v\@<\K\k*>/
syn match mtsyntaxFail /\c=>\s*FAIL\>/
syn match mtsyntaxEndMatcher /<EndMatcher>/
hi def link mtsyntaxBuiltin Constant
hi def link mtsyntaxColor Number
hi def link mtsyntaxRegexGroup Number
hi def link mtsyntaxBoolean Number
hi def link mtsyntaxMeta Function
hi def link mtsyntaxFail Function
hi def link mtsyntaxEndMatcher Constant

syn match mtsyntaxGroup /\v<group>[ \t]*:/he=e-1 skipwhite nextgroup=mtsyntaxGroupValue
syn match mtsyntaxGroupValue /\v<(link(All)?|select)>/ contained
hi def link mtsyntaxGroup Keyword
hi def link mtsyntaxGroupValue Number

syn match mtsyntaxBuiltinFunction /\v<(keywordsToRegex)>/
hi def link mtsyntaxBuiltinFunction Operator

syn keyword mtsyntaxKeywords
            \ match name comment insertSpace \contains color colors start end startsWith endsWith builtin
            \ matchEndFirst mustMatchEnd codeFormatter codeShrinker lineBackground ignoreCase hide
            \ addToContains number iSuffixes fSuffixes recordAllGroups defines include endPriority
            \ style styles childrenStyle bracketPairs

hi def link mtsyntaxKeywords Keyword

syn keyword mtsyntaxTodo contained TODO FIXME NOTE Todo Note
hi def link mtsyntaxTodo Todo

syn match mtsyntaxComment /\/\/.*/ contains=mtsyntaxTodo
hi def link mtsyntaxComment Comment

syn region mtsyntaxBlock start=/{/ end=/}/ transparent fold
syn region mtsyntaxList start=/\[/ end=/\]/ transparent fold

syn match mtsyntaxPreProc +\v//!(BEGIN|END|COLOR(DEF)=|NOOPT|CODE)>+
hi def link mtsyntaxPreProc PreProc

syn region mtsyntaxABNFString start=/\(%[si]\)\="/ end=/"\|$/ contains=mtsyntaxABNFStrEscape,mtsyntaxABNFStrFailEscape
syn match mtsyntaxABNFStrFailEscape /\\./ contained
syn match mtsyntaxABNFStrEscape /\\\(x\x\x\|u\x\{4}\|[f'"\\tbnr]\)/ contained
hi def link mtsyntaxABNFString String
hi def link mtsyntaxABNFStrEscape SpecialChar
hi def link mtsyntaxABNFStrFailEscape Error

syn region mtsyntaxABNF start=+//!BEGIN+ end=+\(//!END\)\@<=+ fold contains=mtsyntaxABNFProse,mtsyntaxABNFComment,mtsyntaxPreProc,mtsyntaxABNFString,mtsyntaxABNFNumVal,mtsyntaxColor,mtsyntaxABNFRepeat
syn region mtsyntaxABNFProse start=/</ end=/>\|$/ contained
syn match mtsyntaxABNFComment /;.*/ contained
syn match mtsyntaxABNFNumVal /\v\%(b[01]+((\.[01]+)+|\-[01]+)=|d\d+((\.\d+)+|\-\d+)=|x\x+((\.\x+)+|\-\x+)=)/ contained
syn match mtsyntaxABNFRepeat /\v\d+|\d*\*\d*/ contained
hi def link mtsyntaxABNFProse String
hi def link mtsyntaxABNFComment Comment
hi def link mtsyntaxABNFNumVal Number
hi def link mtsyntaxABNFRepeat Number

" vim:ts=8 sts=8 noet nowrap
