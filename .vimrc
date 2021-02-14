" set runtime path
if version >= 600
  set runtimepath=~/.vim,~/lib/vim/vimfiles,~/lib/vim,~,/usr/share/vim/vim81
" set runtime path if version >= 600 set runtimepath=~/.vim,~/lib/vim/vimfiles,~/lib/vim,~,/usr/share/vim/vim74
endif

" My abbreviations
iab #i #include
iab if if ()<left>
iab whi while ()<left>
iab i_dt <esc>:put =strftime(\"%c\")<cr>

" setting paste mode
set nopaste " by default
map <F8> :set paste<CR><ESC>i
map <ESC><F8> :set nopaste<CR><ESC>
"imap <F10> <C-O>:set paste<CR>
"imap <F10> <nop>
"set pastetoggle=<F8>

" adding searching in subdirectories
set path+=**

" number of colours
set t_Co=256

" vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Bundle 'Valloric/YouCompleteMe'
"Bundle 'gmarik/vundle'
"Bundle 'msanders/snipmate.vim'
"Bundle 'mattn/zencoding-vim'
"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'ekalinin/Dockerfile.vim'

" for c++ autocompletion support
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf' " fuzzy finder
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-fugitive.git' " git support

Bundle 'tpope/vim-surround'

" colour status line: https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'majutsushi/tagbar'

"Bundle 'L9'
"Bundle 'FuzzyFinder'

"Plugin 'itchyny/lightline.vim'
"Plugin 'bling/vim-bufferline'

call vundle#end()
"filetype plugin indent on


" To insert space characters whenever the tab key is pressed, set the 'expandtab' option:
set expandtab

" insert sw spaces when using tab in front of a line
set smarttab

" set incremental search
set incsearch

" highlight all search results
set hlsearch

" ignore case when searching
set ignorecase
set smartcase

set tags=./ctags,ctags;$MY_PROJ_PATH
set tags+=$MY_TF_PATH/ctags

" Set to no vi compatibility mode
set nocompatible

filetype plugin on

" to support xml files
filetype plugin indent on

" chaning the limits of maximum number of opened tabs
set tabpagemax=1000

" set numbers and relative numbers
set nu
set rnu
au FocusLost * :set number
au FocusGained * :set relativenumber
au InsertEnter * :set number
au InsertLeave * :set relativenumber

function! Toggle_Number()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

function! Toggle_Wrap()
  if(&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunc

let g:MyCurrentSyntax = 1
function! Toggle_ColorScheme()
  if g:MyCurrentSyntax == 0
    colorscheme default
	let g:MyCurrentSyntax = 1
  elseif g:MyCurrentSyntax == 1
    colorscheme elflord
	let g:MyCurrentSyntax = 2
  elseif g:MyCurrentSyntax == 2
    colorscheme ron
	let g:MyCurrentSyntax = 0
  endif
endfunc

"next tag
nnoremap <C-n> :next<cr>

" ####### Taken from various places

" turn on verbosity 
"set verbose=10

" define the top hel file
set helpfile=$VIM/doc/help.txt

" no scrolling acceptable
set ttyscroll=0

" create backups
set backup

" the backup extension
set bex=.bak

" the backup directories
set backupdir=~/tmp,/tmp

" no mouse in xterm
set mouse=

" do not wrap lines
set nowrap

" show the ruler
set ruler

"don't add two spaces after ., ?, !
set nojoinspaces

" define the viminfo file
" set viminfo='50,"1000,:50,n~/.viminfo
" set viminfo='0,:0,<0,@0,f0,n~/.viminfo
set viminfo=
" set viminfo="None"

" allow the cursor to wrap on anything
set whichwrap=b,s,h,l,<,>,[,]

" set the characters shown for special cases (must be turned on with set list)
se listchars=extends:Â»,eol:Â¶,trail:Â·,tab:Â»Â­

" allow backspace to delete newlines and beyond the start of the insertion point
set backspace=2

" highlight matching bracket
set showmatch

" brackets insertion, based on http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
"inoremap { {<CR>}<Esc>ko<TAB>
set exrc " This option forces Vim to source .vimrc file if ( it present in working directory)
set secure " This will restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed

" use autoindentation
set autoindent

" we have a fast terminal connection
set ttyfast

" wildmode: complete to longest match, list on second tab
" set wildmode=longest,list

" used when hitting tab on a file list with wildcards
" set wildmenu

" default make program to use
set makeprg=make

" the error format works for gcc,                           javac,                                                      jikes (32) (after filtering)
set errorformat=%f:%l:%c:%m,%f:kk%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m,\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m,%f:%l:%c:%m

" write buffers automagically when leaving them
set autowrite

" recognize ^M files
set textauto

" check one line for commands in each file
set modelines=1

set smartindent           " smart indent
set cindent               " c code indenting

" tabbing
"To control the number of space characters that will be inserted when the tab key is pressed, set the 'tabstop' option. For example, to insert 4 spaces for a tab, use:
set tabstop=4

" highlited column and changed its colour
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

set shiftwidth=4

" those setting should be local for a project in ./.vimrc
"let &path.="/**15,/mnt/src/archive/boost_1_65_0/**,"


" set highlight mode
" set highlight=8b,@-,db,es,lb,mb,M-,nu,rs,sr,tb,vr,ws

" suffixes to put to the end of the list when completing file names
set suffixes=.bak,~,.o,.h,.info,.swp,.class

" patterns to put to ignore when completing file names
set wildignore=*.bak,~,*.o,*.info,*.swp,*.class

set scrolloff=10 " Keep 10 lines below and above the cursor

" get syntax highlighting
" let mysyntaxfile = "$VIM/vim74/mysyntax/mysyntax.vim"
syntax on
if version >= 600
  filetype plugin on
  filetype indent on
endif

" Tlist settings
let Tlist_File_Fold_Auto_Close=1   " To automatically close the fold for the inactive files/buffers and open only the fold for the current buffer in the taglist window
let Tlist_Exit_OnlyWindow=1
let g:Tlist_GainFocus_On_ToggleOpen=0 "this option controls whether the cursor is moved to the taglist window or remains in the current window
let g:Tlist_WinWidth=60

let Tlist_Auto_Open=0 "Auto open the list window, set to '0' because we don't want to always open taglist, only for specific files e.g. c, h, java etc
let Tlist_Compact_Format=1
"let Tlist_Enable_Fold_Column=1 "To not display the Vim fold column in the taglist window, set Tlist_Enable_Fold_Column to '0'
"let Tlist_Show_Menu=1 "Show tag menu in gvim
"let Tlist_Use_Right_Window = 1 "put list window on the rigth

" don't run syntax and other expensive things on files larger than NUM megs
let g:LargeFile = 100

" My own customitions
let MY_wordUnderCursor = expand("<cword>")
let MY_currentLine   = getline(".")

" Leader settings
let mapleader = ","
"nmap <leader>t :silent grep <c-r>=expand("<cword>")<cr> %<CR> :copen<CR>
"nmap <leader>t :silent grep <c-r>=expand("<cword>")<cr> %<CR> :cw<CR>
nmap <leader>g :vimgrep /<c-r>=expand("<cword>")<cr>/j ../**/*.c ../**/*.h<CR> :copen<CR>
nmap <leader>s :tselect  <c-r>=expand("<cword>")<cr><CR>
"nnoremap <leader>m <esc>:marks<CR>
nnoremap M :marks<CR>:normal! `<cr>
nnoremap <leader>ma :marks<CR>:normal! `<cr>
nnoremap <leader>f :ls<CR>:b<Space>
nnoremap <leader>u :undolist<CR>:u<Space>
nnoremap <leader>mm :g/^.*:$/p<CR>
"nnoremap <leader>s :set list<CR> " display non-printable chars, like endofline, $, ^ et
nnoremap <leader>a <esc>mm<CR>:%!astyle -s4 -A6 -C -S -N<CR><ESC>`m
"LOCAL: nnoremap <leader>w <ESC>:w<CR>:make<CR>:cwindow<CR><CR>
"nnoremap <leader>n <ESC>:NERDTreeToggle<CR>
nnoremap <leader>v <ESC>:NERDTreeFind<CR>
nnoremap <leader>t <ESC>:TlistToggle<CR>
map <leader>d :vsplit<CR><C-w>w:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>l <ESC>:echo expand('%:p')<CR>

nnoremap <leader>L <ESC>iprintf( "[SEB] %s():%d <------ \n", __func__, __LINE__ );<ESC>

"nnoremap t <ESC>:TlistToggle<CR>
"nnoremap t <ESC>:TagbarToggle<CR>
nnoremap f <ESC>:NERDTreeToggle<CR>
"nnoremap g <ESC>:tags<CR>
nmap \| <ESC>:vsplit<CR>e

" clang_complete
let g:clang_auto_select = 0
let g:clang_complete_auto = 0
let g:glang_hl_errors = 1
let g:clang_periodic_quickfix = 0
let g:clang_snippets = 0
let g:clang_use_library = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1

nmap <leader>c :call Toggle_ColorScheme()<cr>
nmap <leader>w :call Toggle_Wrap()<cr>
nmap <leader>n :call Toggle_Number()<cr>
"nmap <leader>t :vimgrep /<c-r>=expand("<cword>")<cr>/j $MY_LOCAL_ROOT/**/*.c<CR> :copen<CR>

" the g<C-]> presents a list of tag if there are more than one tag matched. Otherwise, it just jumps to given tag.
nnoremap <C-]> g<C-]>

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
" command -nargs=* Make make <args> | cwindow 3

" abc def ghi
function! WordEcho()
	echo expand("<cWORD>")
endfunction
" nnoremap <silent> <F8> :call WordEcho()<CR> 
" nnoremap <F5> :!tmux send-keys -t BuSt.1 C-m<CR>
" nnoremap <F5> :!tmux send-keys -t .1 C-m<CR><CR>:Make<CR><CR>
nnoremap <F5> :!tmux send-keys -t .1 C-m<CR><CR>
nnoremap <F4> :execute "!tmux source-file ".getcwd()."/.tmux.local.conf"<CR><CR>

" set equalprg=astyle -s4 -A1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" define some additional filetypes
" Bitbake
au BufRead,BufNewFile *.bb{,class} let is_bash=1|setfiletype bash


" autoreload of .vimrc in case it was written
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

augroup Binary
  au!
  au BufReadPre  *.bin,*.exe let &bin=1
  au BufReadPost *.bin,*.exe if &bin | silent %!xxd -c 32 -g 4
  au BufReadPost *.bin,*.exe set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

autocmd BufRead,BufNewFile *.ts set filetype=java
autocmd BufRead,BufNewFile *.inc set filetype=make
autocmd BufRead,BufNewFile *.xml set filetype=xml
autocmd BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab
"autocmd BufEnter   *.c,*.h,*.java TlistOpen | wincmd l
"autocmd BufRead,BufNewFile   *.c,*.h,*.java TlistOpen | win
"autocmd BufRead,BufNewFile   *.c,*.h,*.java wincmd l
autocmd BufRead,BufNewFile   *.py set cin | TlistOpen
"autocmd BufRead,BufNewFile   *.c,*.h,*.java let Tlist_Highlight_Tag_On_BufEnter = 0 | TlistOpen
"autocmd BufRead,BufNewFile   *.c,*.h,*.java let Tlist_Highlight_Tag_On_BufEnter = 0 | TlistToggle
"autocmd BufWinEnter *.c,*.h,*.java wincmd l
"autocmd FileType c setlocal foldmethod=indent
autocmd FileType c setlocal foldmethod=syntax

"autocmd BufRead,BufNewFile   *.c,*.h,*.java NERDTree
autocmd BufRead,BufNewFile   *.pl syntax on

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" when saving, run compilation
au BufWrite *.cpp,*.hpp,*.h :silent !tmux send-keys -t .1 C-m
au BufWrite CMakeLists.txt :silent !tmux send-keys -t .1 C-m
"au BufWrite *.cpp,*.hpp :make
"au BufWrite *.cpp,*.hpp :cwindow

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

nmap Q  <ESC>:q<CR>

" vimdiff options
nmap <F7> :call DiffWithFileFromDisk()<cr>
set diffopt+=iwhite
if &diff " only for vimdiff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

"nmap qq :q<cr>

"Tab navigation
map n :tabnext<cr>
map N :tabprev<cr>
map <C-q> :tabclose<cr>

map ^[q :tabclose<cr>

" mapping 'c' into comments 
" map C <ESC>I//<ESC>j

" map f12 to switch to normal contrast, SF12 to high contrast
map <S-F12>    :!cat ~/lib/high_contrast<CR>
map <F12>    :!cat ~/lib/normal_contrast<CR>

" Map F8 to show the syntax coloring for a character
"map <F8>    :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
" Map <alt><f8> to turn syntax on/off
"map <ESC><F8> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>

" switch from grep to mkid and back
map <F10> :set grepprg=grep\ -n\ $*\ /dev/null <bar> set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m <cr>
map <ESC><F10> :set grepprg=lid\ -Rgrep\ -s <bar> set grepformat=%f:%l:%m <cr>
"map <ESC>8 :exe "grep -w ".expand("<cword>") <cr>

map <F3> /<CR>
"set <S-F3>=[28~
"set <S-F3>=<F3>

" for navigation in quicikfix window
nmap [ <ESC>:cp<CR>
nmap ] <ESC>:cn<CR>

"map <ESC>5 :windo diffthis<cr>

"map <alt>, and <alt>. to jump up and down the tag list
map <C-.> <ESC>:tn<CR>
map <C-,> <ESC>:tp<CR>

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

map ff <esc>:FZF

"map . <CR>

"map ,n :NERDTreeToggle<CR>:wincmd l<CR>

" NERDTree config
" nnoremap <silent> <F2> :NERDTreeToggle<CR>:wincmd l<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nnoremap <silent> <ESC><F12> :pwd<CR>:sleep 1<CR>:echo expand("%:p")<CR>
map <C-h> :wincmd h<CR>
map <C-l> :wincmd l<CR>

set timeout timeoutlen=400

" definitions in new tabs
map <C-\> :vsplit<CR><C-w>w:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" folds
set nofoldenable
"set foldnestmax=1

set foldcolumn=2          " set a column incase we need it
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden

hi Folded ctermbg=233

" space fold and unfolds a fold
"nnoremap <space> za
nnoremap e <C-w>w " switching between window in VIM itself

let java_comment_strings=1
let is_bash=1
let java_allow_cpp_keywords=1
let javaScript_fold=1

" turn off swapfile in battery mode (to conserve energy)
" we don't want .swp files to be created
set noswapfile
if match(system("/usr/bin/apm"),"off")>0
        set updatecount=0
endif

let @q = 'macro contents'
let @c = '^i#€kdq€kb'


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"The 'completeopt' option contains "menu" or "menuone".
set completeopt=menuone,menu,longest,preview
set omnifunc=syntaxcomplete#Complete

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = ''
let g:ycm_confirm_extra_conf = 0
let g:pymode_rope_completion = 0

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" this is needed by light line
set laststatus=2
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"¿":""}',
      \ },
      \ 'separator': { 'left': '|', 'right': '>' },
      \ 'subseparator': { 'left': '|', 'right': '||' }
      \ }
set noshowmode
"set showtabline=1 " when there is no assignment (e.g. set showtabline) a confirmaiton is needed for each run of vim ;o(

command! FZFOldFiles call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

"""""

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! FZFTags call s:tags()

"""""""""
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! FZFLocalFile call s:btags()

function! DiffWithFileFromDisk()
	let filename=expand('%')
	let diffname = filename.'.fileFromBuffer'
	exec 'saveas! '.diffname
	diffthis
	vsplit
	exec 'edit '.filename
	diffthis
	wincmd l
endfunction

" set the minimum window height
set winminheight=0

function! SetDiffEnviron()
  set diff
  set scrollbind
  set scrollopt=ver,jump,hor
  set nowrap
  set fdm=diff
  windo diffget
endfunction
command! SetDiffEnviron call SetDiffEnviron()

