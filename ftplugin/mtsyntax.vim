" Language:		MT-Syntax (mtsx)
" Maintainer:		A4-Tacks <wdsjxhno1001@163.com>
" Last Change:		2025-06-24
" URL:			https://github.com/A4-Tacks/mtsyntax.vim

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = 'setl iskeyword< comments< commentstring< foldmethod<'

setlocal iskeyword+=-
setlocal comments=://
setlocal commentstring=//%s
setlocal foldmethod=syntax

" vim:ts=8 noet
