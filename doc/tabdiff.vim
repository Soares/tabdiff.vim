*tabdiff.txt*  Diff in Tabs

Author: Nate Soares <http://so8r.es/>
License: GPLv2 (http://www.gnu.org/licenses/gpl-2.0.html)

INTRODUCTION					*tabdiff*

Diff many files in multiple tabs.

COMMANDS					*tabdiff-commands*

						*tabdiff-:TabDiff*
:TabDiff	       
		Creates a new tab page for each consecutive pair of buffers
		(split vertically, with the first on the left and the second
		on the right) and sets all of the windows to diff mode. The
		original tab page is closed.  

                Intended usage is to start vim with alternating 'old' and
                'new' files and then invoke this function immediately. It
                expects there to be only one tab and an even number of
                buffers, as in: >

	vim -c 'silent :TabDiff'            \
		/tmp/original/apples apples \
		/tmp/original/oranges oranges
<

ABOUT						*tabdiff-about*

Grab the latest version or report a bug on GitHub:

http://github.com/Soares/butane.vim

 vim:tw=78:ts=8:noet:ft=help:norl:
