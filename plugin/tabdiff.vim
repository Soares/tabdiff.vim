" Version:       1
" Authors:       Laurence Gonsalves <laurence@xenomachina.com>
"                Nathaniel Soares <http://so8r.es/>
" Created:       2012-02-01
" Last Modified: 2012-09-28
" License:       GPLv2 (http://www.gnu.org/licenses/gpl-2.0.html)
" URL:           https://github.com/Soares/tabdiff.vim
"
" Adds some functions to vim to make it easier to use vim as a
" multi-tabbed diff tool.


" Creates a new tab page for each consecutive pair of buffers (split
" vertically, with first on left and second on right) and sets all of the
" new windows to diff mode. The original tab page will also be closed.
"
" Intended usage is to start vim with alternating "old" and "new" files,
" and then invoke this function. It expects there to be only one tab
" open and 2*n buffers.
"
" Example:
"   gvim -c 'silent call TabDiff()' old-foo foo old-bar bar
"
"   This will result in two tabs: old-foo+foo diff, and old-bar+bar diff.
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
