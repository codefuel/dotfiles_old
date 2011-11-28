" Show line numbers on vi startup
  set number

" By default, Vim comes up with tabs set to 8 columns. The Perl Style Guide
" requires them to be set to 4 and not to be replaced by spaces. Add the
" following to your ~/.vimrc file:

  set tabstop=2
  set shiftwidth=2

" Highlight search term
  set hlsearch

" Turn Tab keypresses into spaces
  set expandtab
" Turn Tab keypress into tabs
" set noexpandtab

"    set listchars=tab:·\ ,trail:·
"    set list

" Highlight text after n characters
" match ErrorMsg /\%>78v/

" The first line sets the tab stops to 4. The other two lines show the tabs
" using a period. Since the style guide requires tabs to not be present in
" the remainder of the line and to always be used in the beginning of the
" line this might be a useful addition.

" Have syntax highligting in terminals which can display colors:

if has('syntax') && (&t_Co > 2)
    syntax on
endif


" (in editor) Convert all tabs to space or ASCII-9 (per 'expandtab'), on
" lines 1_to_end-of-file.

" :1,$retab!

" Information bar
hi User1 term=underline cterm=bold ctermfg=Cyan ctermbg=Blue guifg=#40ffff guibg=#0000aa
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)

" Turn off information bar
" set laststatus=2

" Toggle menu on/off with Ctrl+F2
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
  \set guioptions-=T <Bar>
  \set guioptions-=m <bar>
\else <Bar>
  \set guioptions+=T <Bar>
  \set guioptions+=m <Bar>
\endif<CR>

" Remove menu bar
" :set guioptions-=m

" Remove toolbar
" :set guioptions-=T

" Prevent auto-indent
":setlocal noautoindent
":setlocal nocindent
":setlocal nosmartindent
":setlocal indentexpr=

" Equivalent to the above 4 commands to turn off auto-indent
:setl noai nocin nosi inde=

" Mapping so you can press F8 to disable auto indenting
":nnoremap <F8> :setl noai nocin nosi inde=<CR>


" ---
" Changing the Default Colors
"   :hi Comment will show the settings for the Comment element

" Changing POD and Perl comments

" default to bold dark blue:
" hi Comment bold=true ctermfg=4

" change default to green
hi Comment ctermfg=green
"hi PerlComment ctermfg=green

" ---
" CommentBlock -- highlight a block and comment it out; or uncomment it

" This will allow language-specific comment markers
" By setting up some auto commands, you can change this
" based on the on the file type of your current buffer and
" it will work for multiple languages
"
" Use by:
"   highlight the block to comment/uncomment
"       * press ## to comment or
"       * press !# to uncomment

"let g:comment_char = "#"

"function! Comment()
"    let l:line = g:comment_char.getline(".")
"    call setline(".",l:line)
"endfunction

"function! UnComment()
"    let l:line = getline(".")
"    let l:pos  = stridx(l:line,g:comment_char)
"    if  l:pos > -1
"        let l:line = strpart(l:line,0,l:pos).strpart(l:line,l:pos+strlen(g:comment_char))
"    endif
"    call setline(".",l:line)
"endfunction

"map ## :call Comment()<cr>
"map !# :call UnComment()<cr>

" ---
" SmartTab -- function that knows whether to insert a tab (at the begining of a line) or try keyword completion (<C-P>)

" An alternate definition to comply with Perl coding standards:
" Tab at front of line inserts a tab
" Tab elsewhere inserts spaces to defined tabstop
" Optionally can do keyword completion if after a possible keyword
" Note that re-indenting code soon after using tab away from the
" front of a line can convert leading tabs to space. I see no easy fix.

" SmartTab wrapper
""function SmartTab()
""    let prefix= strpart( getline('.'), 0, col('.')-1 )
    " Uncomment these lines to enable keyword completion:
    "if prefix =~ '\k$'
    "    return "\<c-p>"
    "endif
""    if prefix =~ '^\t*$'

""        execute("set noexpandtab")
""        return "\<tab>"
""    endif
""    execute("set expandtab")
""    return "\<tab>"
""endfunction

" turn on SmartTabs
"inoremap <tab> <c-r>=SmartTab()<cr>

" ---
" PerlSubStatusBar -- puts you current subroutine name in the status bar in vim

" ------------------------------------------------------------------------------
 " A really nice status bar.  ( Probably only works with newer version of VIM )
 " Requires that the first line of your file either be a shebang perl or package
 " ------------------------------------------------------------------------------
"if has( "folding" )
"   set statusline=%f%{CurrSubName()}\ %m%h%r\ %=%25(%-17(%l\,%c%V%)\ %p%%%)
"   set laststatus=2
"   set maxfuncdepth=250

"    function! CurrSubName()
"        let g:subname = ""
"        let g:subrecurssion = 0

        " See if this is a Perl file
"        let l:firstline = getline(1)

"        if ( l:firstline =~ '#!.*perl' || l:firstline =~ '^package ' )
"            call GetSubName(line("."))
"        endif

"        return g:subname
"    endfunction

"   function! GetSubName(line)
"        let l:str = getline(a:line)

"      if l:str =~ '^\s*sub'
"            let l:str = substitute( l:str, ' *{.*', '', '' )
"            let l:str = substitute( l:str, '^\s*sub *', ': ', '' )
"            let g:subname = l:str
"            return 1
"        elseif ( l:str =~ '^}' || l:str =~ '^} *#' ) && g:subrecurssion >= 1
"            return -1
"        elseif a:line > 2
"            let g:subrecurssion = g:subrecurssion + 1
"            if g:subrecurssion < 190
"                call GetSubName(a:line - 1)
"            else
"                let g:subname = ': <too deep>'
"                return -1
"            endif
"        else
"            return -1
"        endif
"    endfunction
" endif
" EditPerlClass -- cursor is on a Perl class name. This finds the module and loads it up for editing.
"    *  Relies on PmLocate Perl script.

" Usage

"    * Place the cursor somewhere within a Perl class name (e.g. DAS::DataProvder).
"    * Type \p.
"    * The named module is opened up in a buffer for viewing or editing.
"    * Typing \P opens the module up in a split window.

  " returns the location of a perl module who's class
  " name the cursor is currently located in
"  function! Pmlocate ()
"      let pmname = expand("<cWORD>")
"      let cmd = "/home/cmeyer/bin/pmlocate \"" . pmname ."\""
"      let location = system(cmd)
"      return location
"  endfunction

  " edits the perlmodule
"  function! Pmedit ()
"      let pmlocation = Pmlocate()
"      if pmlocation == ''
"          echo "could not locate the Perl module"
"      else
"          execute("e " . pmlocation)
"      endif
"  endfunction

  " split edits the perlmodule
"  function! Pmsedit ()
"      let pmlocation = Pmlocate()
"      if pmlocation == ''
"          echo "could not locate the Perl module"
"      else
"          execute("sp " . pmlocation)
"      endif
"  endfunction

  " keybindings for two above functions
"  map \p :call Pmedit()<CR>
"  map \P :call Pmsedit()<CR>


" ---
" PerlSyntaxCheck -- quickly check the current buffer for Perl syntactical correctness.
"map <CR> :w<CR> :!$PERL -Mstrict -wc %<CR>
" From vim, in navigation mode, press the Enter key. It will save any changes in the current buffer, and then run $ENV{ PERL } -wc on the resulting file. Any syntax errors will be reported.

"    * Note that this can take a moment if the module or program does anything significant within BEGIN blocks, such as connecting to a database.

" Turn off auto indent
filetype indent off
set noautoindent
set nocindent
set nosmartindent
set indentexpr=

