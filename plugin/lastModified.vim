"
" VIM script to update the last changed date of the current file
" Copyright (C) 2013 Jostein Elvaker Haande - aka tolecnal
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program; if not, see <http://www.gnu.org/licenses/>.
"
" @Filename:    lastModified.vim
" @Author:      Jostein Elvaker Haande - aka tolecnal
" @Email:       tolecnal@tolecnal.net
" @Website:     http://tolecnal.net
" @License:     GPL2
" @Created:     2013-09-24
"	@Last Change: Tue 24 Sep 2013 13:53:37 CEST
" @Revision:    36
"


function! UpdateLastMod()
  " Init the variables
  let lastMod=0
  let lastModModified=0
  let lastModFormat='@Last Change:'
  let lastModTimeFormat='%c'

  " Search for the line number
  let numberOfLine = search(lastModFormat)

  " Only do the change if the string is found in the first 30 lines
  if numberOfLine <= 30 && numberOfLine > 0 && &modifiable
    " Modify the line
    let line = getline(numberOfLine)
    let curStart = matchstr(line, '.*\ze'.lastModFormat)
    let lastModCurrentTime = strftime(lastModTimeFormat)

    let line = curStart.lastModFormat." ".lastModCurrentTime
    call setline(numberOfLine, line)
  endif
endfunction

autocmd BufWritePre * call UpdateLastMod()
