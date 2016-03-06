
set tags=ctags,../ctags,../../ctags,../../../ctags,../../../../ctags,../../../../../ctags,../../../../../../ctags,../../../../../../../ctags,../../../../../../../../ctags,../../../../../../../../../ctags,../../../../../../../../../../ctags,../../../../../../../../../../../ctags,../../../../../../../../../../../../ctags,../../../../../../../../../../../../../ctags,../../../../../../../../../../../../../../ctags,../../../../../../../../../../../../../../../ctags,../../../../../../../../../../../../../../../../ctags,../../../../../../../../../../../../../../../../../ctags,../../../../../../../../../../../../../../../../../../ctags

" ####### Taken from various places
" Set to no vi compatibility mode
set nocompatible

" turn on verbosity 
" set verbose=10

" define the top hel file
set helpfile=$VIM/doc/help.txt

" no scrolling acceptable
set ttyscroll=0

" create backups
set backup

" the backup extension
set bex=.bak

" the backup directories
set backupdir=~/tmp,.,~/,/tmp

" no mouse in xterm
set mouse=

" do not wrap lines
set nowrap

" show the ruler
set ruler

"don't add two spaces after ., ?, !
set nojoinspaces

" define the viminfo file
set viminfo='50,"1000,:50,n~/.viminfo

" allow the cursor to wrap on anything
set whichwrap=b,s,h,l,<,>,[,]

" set the characters shown for special cases (must be turned on with set list)
se listchars=extends:»,eol:¶,trail:·,tab:»­

" allow backspace to delete newlines and beyond the start of the insertion point
set backspace=2

" use autoindentation
set ai

" we have a fast terminal connection
set ttyfast

" wildmode: complete to longest match, list on second tab
set wildmode=longest,list

" default make program to use
set makeprg=gmake

" the error format works for gcc,                           javac,                                                      jikes (32) (after filtering)
set errorformat=%f:%l:%c:%m,%f:kk%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m,\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m,%f:%l:%c:%m

" write buffers automagically when leaving them
set autowrite

" recognize ^M files
set textauto

" check one line for commands in each file
set modelines=1

" insert sw spaces when using tab in front of a line
set smarttab

" To insert space characters whenever the tab key is pressed, set the 'expandtab' option:
set expandtab
" With this option set, if you want to enter a real tab character use Ctrl-V<Tab> key sequence.

"To control the number of space characters that will be inserted when the tab key is pressed, set the 'tabstop' option. For example, to insert 4 spaces for a tab, use:
:set tabstop=4

" smart inden
set smartindent

" tabbing
set tabstop=4
set shiftwidth=4
set expandtab

" set incremental search
set incsearch

" highlight all search results
set hlsearch

" set the minimum window height
set winminheight=0

" set highlight mode
" set highlight=8b,@-,db,es,lb,mb,M-,nu,rs,sr,tb,vr,ws

" suffixes to put to the end of the list when completing file names
set suffixes=.bak,~,.o,.h,.info,.swp,.class

" patterns to put to ignore when completing file names
set wildignore=*.bak,~,*.o,*.info,*.swp,*.class

" get syntax highlighting
let mysyntaxfile = "$VIM/mysyntax/mysyntax.vim"
syntax on
if version >= 600
  filetype plugin on
  filetype indent on
endif

" get special definitions for different file types
source $VIM/set/set.vim

" get directory browser
source $VIM/mymacros/dir.vim

" get directory browser
source $VIM/mymacros/matchit.vim

" get search highlighter
source $VIM/set/hisearch.vim

" define some additional filetypes
" Bitbake
au BufRead,BufNewFile *.bb{,class} let is_bash=1|setfiletype bash
autocmd BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab
autocmd BufRead,BufNewFile   *.pl syntax on

" GDB
au BufRead,BufNewFile .*gdb* set filetype=gdb
" Mocha, Wingdis (java decompiler)
au BufRead,BufNewFile *.mocha,*.wingdis set filetype=java
" Test file used for testing various vim settings
au BufRead,BufNewFile test set filetype=test
" Assembler x86 preprocessor
au BufRead,BufNewFile *\.S set filetype=asms
" Assembler 
au BufRead,BufNewFile *.bS set filetype=myasm
" Test file used for testing various vim settings
au BufRead,BufNewFile *access_log*,*.httplog set filetype=httplog
" dtd files 
" au BufRead,BufNewFile *.dtd set filetype=dtd
" WebMacro files 
au BufRead,BufNewFile *.wm set filetype=webmacro
" config files 
au BufRead,BufNewFile CONFIG,config set filetype=config
" mhtml files 
au BufRead,BufNewFile *html set filetype=html
" html.m4 files 
" au BufRead,BufNewFile *.html.m4 set filetype=htmlm4
" html.m4 files 
" au BufRead,BufNewFile *.shtml.m4 set filetype=htmlm4
" jsp
au BufRead,BufNewFile *.jsp set filetype=jsp
" bytecode tracefiles
au BufRead,BufNewFile *.ptr set filetype=bytecodetr
" language files
au BufRead,BufNewFile *.mxm set filetype=maxima
" simulator log files
au BufRead,BufNewFile *.lng set filetype=lng
" simulator log files
au BufRead,BufNewFile sim*.log set filetype=simlog
" language files
autocmd BufReadPost *.httplog.gz set bin | '[,']!gunzip
autocmd BufReadPost *.httplog.gz set nobin | set readonly
autocmd BufReadPost *.httplog.gz set filetype=httplog
autocmd BufWritePost,FileWritePost	*.httplog.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost	*.httplog.gz !gzip -9 <afile>:r


" map <F9> to switch from no dead keys to normal and to html dead keys
imap <F9>      <ESC><F9>a
map <F9>      :source $VIM/set/text_dead.vim<CR>
"
" F6         - spell file & hilite spelling mistakesk
" <ALT>F6    - return to normal syntax coloring
source $VIM/mymacros/vimspell.vim

" source the file macros
" so $VIM/macros/file_select.vim

" set runtime path
if version >= 600
  set runtimepath=~/.vim,~/lib/vim/vimfiles,~/lib/vim,~
endif

" Map F1 to the ESC key in insert mode (useful if ESC and F11 are pretty close together)
imap [11~ 

" Map F1 to help
map [11~ :h

" map f7 to switch to normal contrast, SF7 to high contrast
map <S-F7>    :!cat ~/lib/high_contrast<CR>
map <F7>    :!cat ~/lib/normal_contrast<CR>

" Map F8 to show the syntax coloring for a character
map <F8>    :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
" Map <alt><f8> to turn syntax on/off
map <ESC><F8> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>

" switch from grep to mkid and back
map <F10> :set grepprg=grep\ -n\ $*\ /dev/null <bar> set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m <cr>
map <ESC><F10> :set grepprg=lid\ -Rgrep\ -s <bar> set grepformat=%f:%l:%m <cr>
map <ESC>8 :exe "grep -w ".expand("<cword>") <cr>

"map <alt>, and <alt>. to jump up and down the tag list
map <esc>, :tp<CR>
map <esc>. :tn<CR>

"map <hift><alt>. and <shift><alt>, to jump up and down the error/grep list
map <esc>< :cp<CR>
map <esc>> :cn<CR>
map <esc>V :cc<cr>
map <esc>L :cw<cr>

" shifted function keys
map <esc>[23~ <s-f1>
map <esc>[24~ <s-f2>
map <esc>[25~ <s-f3>
map <esc>[26~ <s-f4>
map <esc>[28~ <s-f5>
map <esc>[29~ <s-f6>
map <esc>[31~ <s-f7>
map <esc>[32~ <s-f8>
map <esc>[33~ <s-f9>
map <esc>[34~ <s-f10>
map <esc>[23$ <s-f11>
map <esc>[24$ <s-f12>

set timeout timeoutlen=400

" no folds
set nofoldenable

let java_comment_strings=1
let is_bash=1
let java_allow_cpp_keywords=1
let javaScript_fold=1

" turn off swapfile in battery mode (to conserve energy)
if match(system("/usr/bin/apm"),"off")>0
        set updatecount=0
endif

