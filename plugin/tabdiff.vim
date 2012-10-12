" tabdiff.vim	A differetn way to diff.
" Author:		Laurence Gonsalves <laurence@xenomachia.com>
" Maintainer:	Nathaniel Soares <http://so8r.es/>
" Version:		1.0
" License:		GPLv2 <http://www.gnu.org/licenses/gpl-2.0.html>
" GetLatestVimScripts: 4247 1 :AutoInstall: tabdiff.zip
if exists("g:loaded_tabdiff") || &cp || v:version < 700
	finish
endif
let g:loaded_tabdiff = 1


command! TabDiff call tabdiff#TabDiff()
