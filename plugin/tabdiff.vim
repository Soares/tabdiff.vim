" tabdiff.vim	A differetn way to diff.
" Author:		Laurence Gonsalves <laurence@xenomachia.com>
" Maintainer:	Nathaniel Soares <http://so8r.es/>
" Version:		1.0
" License:		GPLv2 <http://www.gnu.org/licenses/gpl-2.0.html>

if exists("g:loaded_tabdiff") || &cp || v:version < 700
	finish
endif
let g:loaded_tabdiff = 1


" Creates a new tab page for each consecutive pair of buffers (split
" vertically, with first on left and second on right) and sets all of the
" new windows to diff mode. The original tab page will also be closed.
"
" Intended usage is to start vim with alternating "old" and "new" files,
" and then invoke this function. It expects there to be only one tab
" open and 2*n buffers.
"
" Example:
"	 gvim -c 'silent call TabDiff()' old-foo foo old-bar bar
"
"	 This will result in two tabs: old-foo+foo diff, and old-bar+bar diff.
function! tabdiff#TabDiff()
	let s:tab_multi_diff = 0
	argdo call s:AddBufferToTab()
	tabclose
endfun
command! TabDiff call tabdiff#TabDiff()


" Helper function used by TabDiff(). Adds current buffer to new tab
" or last tab as appropriate, and sets new window's "diff" option.
function! s:AddBufferToTab()
	let buf = bufnr("%")
	if s:tab_multi_diff
		tablast
		vsplit
		wincmd w
	else
		tab split
		tabmove
	endif
	let s:tab_multi_diff = ! s:tab_multi_diff
	exe 'b ' . buf
	diffthis
	tabfirst
endfun
