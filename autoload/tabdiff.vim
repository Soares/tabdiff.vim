function! s:addtotab()
	let l:buf = bufnr('%')
	if s:old
		tab split
		tabmove
	else
		tablast
		belowright vsplit
	endif
	exe 'b ' . l:buf
	diffthis
	normal gg
	let s:old = !s:old
	tabfirst
endfunction

 
" @a:000 [{file}] List of files to be diffed, interleaved old/new.
function! tabdiff#tabdiff(...)
	let g:tabdiff_active = 1
	let s:old = 1
	argdo call s:addtotab()
	tabclose
endfunction
