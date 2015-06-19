" General Settings {
set nocompatible  " Do not compatible with vi!This setting must be first line
set shortmess=atI " Do not display the aid for Uganda children
" You can define the mapleader whatever you like
let mapleader=";"
let g:mapleader=";"
set history=500
" } GUI settings {
set nu        " display the line number
syntax enable " open syntax highlight
syntax on     " allow your use specific colorscheme to modify the default one
" set guifont=Bitstream\ Vera\ Sans\ Mono\ 20
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 20
" }
set ruler         " display the row and column number
set noshowmode    " Due to install vim-airline, so it needn't showmode
set showcmd       " show the command of your input in command line insert the mode
set laststatus=2  " Always display status line
set cursorline cursorcolumn " hightlight current line and column
highlight clear SignColumn
highlight clear LineNr
if version >= 700
	hi CursorLine cterm=bold
endif
" Then setting the colorscheme
" progressively check higher values... falls out on first true
set background=dark
if has("gui_running")
  colorscheme molokai
  set guioptions-=m " hidden menubar
  set guioptions-=T " hidden toolbar
  set guioptions-=r " hidden right-side scrollbar
  set guioptions-=R " hidden right-side scrollbar
  set guioptions-=l " hidden left-side scrollbar
  set guioptions-=L " hidden left-side scrollbar
  set guioptions-=b " hidden bottom-side scrollbar
  set guioptions-=h
else
  colorscheme solarized
  let g:solarized_contrast="high"
  let g:solarized_visibility="high"
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
endif
" Then setting for maximize gvim window when open gvim
if has("win32")
  au GUIEnter * simalt ~x
else
  au GUIEnter * call MaximizeWindow()
endif
" Edit Enviroment Settings {
set novisualbell
set visualbell t_vb=
filetype off       " close this for Vundle
filetype plugin on " load the plugin depend on the file type
filetype indent on " indent type depend on the file type
filetype plugin indent on
" ignore compressed file
let g:ft_ignore_pat='\.\(zip\|rar\|bz2\|gz\|gzip\|tgz\)'
"
set wildmenu   " set smart complete the vim command
set autochdir  " auto set current dir as the workspace dir
" Set for tab...
set tabstop=2
set softtabstop=2 " when I press backspace, it delete 2 spaces
set expandtab     " set use space to modify the tab
autocmd FileType c,cpp,python,sh,scala,java set shiftwidth=2
set backspace=indent,eol,start
" Set for indent...
set cindent
set autoindent
set smartindent
"
set t_ti= t_te=
set viminfo^=%  " remember info about open buffers on close
" Now set the search conditions....
set incsearch    " search result real-time
set hlsearch     " hightlight search result
set ignorecase smartcase " set case-sensitive
set showmatch    " show match of () [] {}, but I also need to match '' <> and '""'
" Set for no backup file
set autoread     " set auto read file when it was changed from outside
set writebackup  " set no backup file
set nobackup     " set no backup file
set noswapfile   " set no backup file
" Set code folding.....
" Vim supplied the 6 following fold types:
"    (1) manual, fold code by manual
"    (2) indent, more indent to express more advanced fold
"    (3) expr, use expression to define fold
"    (4) syntax, use syntax highlight to define fold
"    (5) diff, fold the unchanged codes
"    (6) marker, fold the marks in file
" You can type :h usr_28.txt,  :h fold.txt for help!"
set nowrap       " set do not break the line automatic
set foldmethod=indent   " groups in same lines form a fold.
set foldlevel=100       " set do not fold the codes
set nofoldenable        " close folden when enter vim
" za   On/Off current fold
" zM   Close all folds
" zR   Open all folds
au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
" If a line of text is more than 80 columns, notice it use the underline
au BufRead,BufNewFile *.h,*.hpp,*.c,*.cpp,*.cxx,*.cc,*.java,*.pl,*.py,*.sh set colorcolumn=81
au BufRead,BufNewFile *.txt,*.scala set colorcolumn=101
hi colorcolumn ctermbg=LightGray guibg=LightGray
" Set for encoding, fileencoding, fileencodings
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,cp936,latin-1
" then set for file formats
set fileformat=unix            " set file format is unix
set fileformats=unix,dos,mac   " default file types
" Key Mapping Settings {
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Hard Moving Mode, Disable h,j,k,l in Normal mode
nnoremap h <nop>
nnoremap l <nop>
" nnoremap j <nop>
" nnoremap k <nop>
" Important! define Ctrl+h/j/k/l to move cursor
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" define Ctrl+s to save the current file
" Save the file at normal mode
nmap <C-s>  :w<CR>
" Save the file at insert mode
imap <C-s>  <ESC>:w<CR>a
imap <C-i>  <ESC>Ea 
" I must define clear last highlight search results
nmap <silent><leader>nh :nohls<CR>
nmap Y y$
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" define Ctrl+A to select all texts in the file
nnoremap  <C-a>  <ESC>ggVG"
" fast edit .gvimrc at normal mode
nmap<silent> <leader>ee  :e ~/.vimrc<CR>
" fast reloading the .gvimrc file at normal mode
nmap<silent> <leader>ss  :source ~/.vimrc<CR>
" define use ;q to force quit all windows
nmap <leader>q  :wqa!<CR>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
" <C-[>, its ASCII value is equal with <ESC>. Or use jj to simulate <ESC>
inoremap ( ()<ESC>i
inoremap ) <C-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <C-r>=ClosePair(']')<CR>
inoremap { <C-r>=AutoLeftBrace('{', '}')<CR>
inoremap } <C-r>=ClosePair('}')<CR>
inoremap < <C-r>=AutoAngleBracket('<', '>')<CR>
inoremap > <C-r>=ClosePair('>')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
" } end of key mappings
" => Vim Functions Settings {
" return for operating system
func! MySys()
  if has("win32") || has("win64")
    return "windows"
  elseif has("unix")
    return "unix"
  elseif has("mac")
    return "mac"
  endif
endfunc
" define func MaximizeWindow(), it need install wmctrl sudo apt-get install wmctrl
func! MaximizeWindow()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunc
" Now setting for ClosePair() and AutoLeftBrace() {
func! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunc
func! AutoLeftBrace(open, close) " Complete for {}
  let line = getline('.')
  let idx = match(line, ')\|else\|do')
  if idx != -1
    return a:open.a:close."\<ESC>i\<CR>\<ESC>O"
  else
    return a:open.a:close."\<ESC>i"
  endif
endfunc " This function create by Pengqiu Deng
func! AutoAngleBracket(open, close) " Complete for <>
  let line = getline('.')
  let idx = match(line,'vector\|array\|list\|stack\|que\|map\|set\|include\|template\|ptr\|distri')
  if idx != -1
    return a:open.a:close."\<ESC>i"
  else
    return a:open."\<ESC>a"
  endif
endfunc " This function was create by Pengqiu Deng
" } end of ClosePair() and AutoLeftBrace()
"  } end of vim func settings
" Quickfix setting, Quickfix is a build-in plugin in Vim, so it needn't install it.
"    You can type :help quickfix; :h :make; :h 'makeprg'; :h 'switchbuf';
"    :h location-list;  :h grep;  :h :vimgrep;  :h :grep;  :h starstar-wildcard
" :ccl[ose], close the quickfix window (:h cclose)
" :cp[revious], jump to previous error location (:h :cp)
" :cn[ext], jump to next result (:h :cn)
" :cc, list detailed error info in quickfix window (:h :cc)
" :cw[indow] [height], If there are error info in current time, then open quickfix window (:h :cw)
" :col[der], jump to an older error list. BTW, quickfix can record 10 error info (:h :col)
" :cnew[er], jump to an newer error list (:h :cnew)
nnoremap <leader>m :wa<CR>:make<CR>:cw<CR><CR>
" Set tag file location {
" You can type the following commands for help.
" :h 'tags', :h :tag, :h :tags, :h CTRL-], :h CTRL-T, :h vimgrep, :h cw, :h pattern
" Attention, use ',' to seperate multiple tag file
set tags=tags,./tags,./include/tags,./src/tags,../tags,../include/tags,../src/tags,../*/include/tags,../*/src/tags
" Build tags of your own project with Ctrl+F12
nnoremap <C-F12> :!ctags -R --sort=yes --fields=+ialS --extra=+q --c-kinds=+p --c++-kinds=+px .<CR><CR>
set tags+=~/.vim/cpp_tags
" }
" Set Cscope {
" You can type :h cscope :h cword :h cfile for help.
if has("cscope")
    set csprg=/usr/bin/cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-
" csto=1 stand for preferred to search tags, then cscope database
    set csto=1
" set cscope tag
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
" Build cscope.* database file of your project
nnoremap <C-F11> :!cscope -Rbqk *.h *.c *.cpp *.cxx *.cc *.py<CR><CR>
" cs find c|d|e|f|g|i|s|t symbol_name
" cs find s(or 0), find C symbol
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" cs find g(or 1) name, find defination
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" cs find d(or 2) func, find the functions call in this func
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" cs find c(or 3) func, find which functions call this func
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" cs find t(or 4) str, find this string
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" cs find e(or 6) pattern, find this pattern just like using egrep
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" cs find f(or 7) file_name, find this file just like using find command
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" cs find i(or 8) file_name, find the files which include in this file
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
" } end setting for Cscope
" (0) set for Vundle {
" Vundle Commands
" :BundleList     list all plugins in vimrc
" :BundleInstall  install all plugins in vimrc
" :BundleUpdate   update all plugins in vimrc
" :BundleClean    delete all plugins didn't install in vimrc file
" :BundleSearch   search plugin xxx
" 1) mkdir -pv ~/.vim/bundle/
" 2) git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'fholgado/minibufexpl.vim'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'magic-dot-files/TagHighlight'
Bundle 'vim-scripts/ShowMarks'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'hdima/python-syntax'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/a.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
" Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-easymotion'
" } end of Vundle
" (1) Set Tagbar Plugin {
nnoremap <silent><F9> :TagbarToggle<CR>
nnoremap <Leader>tl :TagbarToggle<CR>
if MySys() == "windows"
    let g:tagbar_ctags_bin='D:\ctags.exe'
elseif MySys() == "unix"
    let g:tagbar_ctags_bin='/usr/bin/ctags' "set the path of Exuberant Ctags utility
endif
let g:tagbar_autofocus=0  "Don't open tagbar window when vim run
let g:tagbar_autoclose=1  "when I click a tag in tagbar window, auto close tagbar window
let g:tagbar_left=1   "default is right-side
let g:tagbar_width=35 "default is 40
let g:tagbar_sort=0   "sort by order in source file
let g:tagbar_compact=1 "compact the blank line and didn't display the help info
let g:tagbar_singleclick=1  "default was 0, use double-click to jump to the tag location
let g:tagbar_autoshowtag=1
"
highlight TagbarKind  gui=bold  guifg=DarkGreen  ctermfg=DarkGreen
highlight TagbarScope gui=bold  guifg=Orange
highlight TagbarType  gui=bold  guifg=DarkRed    ctermfg=DarkRed
highlight TagbarHighlight  gui=bold,italic guifg=#FF0033 guibg=LightGray ctermfg=LightGray
highlight TagbarComment    guifg=LightGreen  ctermfg=LightGreen
highlight TagbarVisibilityPublic     guifg=Green   ctermfg=Green
highlight TagbarVisibilityProtected  guifg=Yellow  ctermfg=Yellow
highlight TagbarVisibilityPrivate    guifg=Red     ctermfg=Red
" }  end of Tagbar settings
" (2) Set NERDTree plugin list all files in tree view {
" NERDTree is a tree explorer plugin for navigating the filesystem. It had a lot of commands,
" You can type :h NERD_tree for help.
" use NERDTree to list the project file, set shortcut: N(erd)T(ree)
noremap <Leader>nt :NERDTreeToggle<CR>
" set the width of NERDTree window
let NERDTreeWinSize=25
" set the location of NERDTree Window
let NERDTreeWinPos="right"
" when the vim had only NERDTree window, exit vim or gvim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" set NERDTree ignore files
let NERDTreeIgnore=['\.$', '\~$', '\.pyc$', '.\.pyo$', '\.swp$', '\.o$', '\.obj$', '^\.git$', '^\.svn$', '^\.hg$']
let NERDTreeShowBookmarks=1
" }
" Set MiniBufExpl plugin settings {
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrow=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
" for buffers that have NOT CHANGED and are NOT VISIBLE
highlight MBENormal term=bold  gui=bold guifg=#808080 guibg=fg
" for buffers that have CHANGED and are NOT VISIBLE
highlight MBEChanged term=bold gui=bold guifg=#CD5907 guibg=fg
" for buffers that have NOT CHANGED and VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=#5DC2D6 guibg=fg
" for buffers that have CHANGED and VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=#F1266F guibg=fg
" }
" Set Grep.vim for search source code file in project {
" You can type the following commands for help:
" :h add-plugin; :h add-global-plugin; :h runtimepath; :h quickfix; :h :grep
" :h :lgrep or :lgr; :h :vimgrep; :h :lvimgrep or :lv
if MySys() == "unix"
    let Grep_Path='/bin/grep'
    let Fgrep_Path='/bin/fgrep'
    let Egrep_Path='/bin/egrep'
elseif MySys() == "windows"
    let Grep_Path='D:\grep.exe'
    let Fgrep_Path='D:\fgrep.exe'
    let Egrep_Path='D:\egrep.exe'
endif
let Grep_Default_FileList='*.h *.c *.cpp *.cxx *.cc *.java *.py *.pl *.vhd *.v *.sh'
let Grep_Skip_Dirs='.git .svn obj bin'
let Grep_Skip_Files='tags cscope.* *.bak *~ *.swp *.txt *.log *.o *.obj *.so Makefile'
" }  end of grep.vim
" CtrlP for searching files {
nmap <Leader>fp  :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.bak,*.so,*.swp,*.zip,*.tar.gz,*tgz,*tar.bz2
let g:ctrlp_mruf_include='\.h$\|\.c$\|\.hpp$\|\.hh$\|\.cpp$\|\.cxx$\|\.cc$\|\.py$\|\.pl$\|\.txt$\|\.log$\|\.sh$\|\.java$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|svn|hg|rvm)$',
    \ 'file': '\v\.(o|obj|so|dll|exe|zip|tar.gz|tgz|tar.bz2|rar)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_woking_path_mode='ra'
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:12,results:12'
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" } end of setting CtrlP
" Set for TagHighlight plugin {
" I just type :UpdateTypesFile
" If I don't want update all taghl_*.taghl recursively, I should create a file which named
" as taghl_config.txt, and input just a line, Recurse:False
" } end of TagHighlight
" Set for ShowMarks plugin {
" :h marks, :h mark-motions, :h :jumps, :h ' for help
" If you want to delete all marks, type :delm! in command mode
let g:showmarks_enable=1  "enable ShowMarks
" All marks in Vim had name, which was a single character. [a-z] or [A-Z] can be used for mark name.
" Attention, the lower-alpha was confined for buffer. But upper-alpha was global, it was available in all
" files in current project.
" If you input ma to define mark a in normal mode, and you can input 'a or `a to jump to mark a in normal mode.
let showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, preview windows and non-modified buffers
let showmarks_ignore_type="hqpm"
" For marks a-z were available in buffer. So I could define mark a in buffer 1, and I
" also defined mark a in buffer 2, etc.
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=DarkBlue
" For marks A-Z, upper case marks were available in current project.
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" highlight lower and upper marks
let showmarks_hlline_lower=1   "default is 0
let showmarks_hlline_upper=1   "default is 0
" By default, the following keymapping are defined, you can use them.
" <Leader>mt    Toggles showMarks plugin on and off
" <Leader>mh    Clears a mark
" <Leader>ma    Hiddens all marks in current buffer
" <Leader>mm    Set the next available mark in current line
" <Leader>mo    Turns ShowMarks on and display marks.
" } end setting for ShowMarks
" rainbow_parentheses.vim {
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let  g:rbpt_max=16
let  g:rbpt_loadcmd_toggle=0
au VimEnter *  RainbowParenthesesToggle
au syntax   *  RainbowParenthesesLoadRound
au syntax   *  RainbowParenthesesLoadSquare
au syntax   *  RainbowParenthesesLoadBraces
" } end of rainbow_parentheses.vim settings
" python-syntax settings {
let python_highlight_all=1
" }
" vim-cpp-enhanced-hightlight {
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
" }
" Syntastic setting {
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1  "use :sign interface to
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_loc_list_height=10
nmap <Leader>e :Errors<CR>
nmap <Leader>ne :lnext<CR>
nmap <Leader>pe :lprev<CR>
" ignore check all header files, backup files, text and log files"
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_ignore_files=['.*\.py$']
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_include_dirs=['/usr/include']
let g:syntastic_cpp_remove_include_errors=1
" let g:syntastic_cpp_config_file='.syntastic_cpp_config'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-stdlib=libstdc++ -std=c++14'
" } end of Syntastic setting
" YouCompleteMe setting {
" First let me set for popup menu...
highlight Pmenu ctermbg=13 guibg=LightGray guifg=DarkGreen
highlight PmenuSel term=bold cterm=bold gui=bold ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar term=bold cterm=bold gui=bold ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuThumb guibg=Black
" Second setting auto close popup menu and preview window when curosr move
" and insert leave the pumvisible() func return non-zero when popup menu is
" visible, otherwise is 0
au CursorMovedI,InsertLeave * if pumvisible()==0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview
set completeopt=longest,menu
" Third, set keymapping for completion
inoremap <expr> <CR> pumvisible()?"\<C-y>":"\<C-g>u\<CR>"
inoremap <expr> <C-j> pumvisible()?"\<PageDown><C-n>\<C-p>":"\<C-x><C-o>"
inoremap <expr> <C-u> pumvisible()?"\<C-e>":"\<C-u>"
" set you can use PgUp/pgDn to scroll the popup menu
inoremap <expr> <PageDown> pumvisible()?"\<PageDown>\<C-p>\<C-n>":"\<PageDown>"
inoremap <expr> <pageUp>   pumvisible()?"\<PageUp>\<C-p>\<C-n>":"\<PageUp>"
" Ctrl+n
inoremap <expr> <C-n> pumvisible()?'<C-n>':'<C-n><C-r>=pumvisible()?"\<lt>Down>":""<CR>'
" Ctrl+p
inoremap <expr> <C-p> pumvisible()?'<C-p>':'<C-p><C-r>=pumvisible()?"\<lt>Up>":""<CR>'
" Forth, you should install YouCompleteMe using Vundle. If it was too slow, run the following command
" in ~/.vim/bundle
" git clone --recursive https://github.com/Valloric/YouCompleteMe.git, and cd YouCompleteMe, run
" git submodule update --init --recursive to ensure the integrity.
" Fifth, cd ~/.vim/bundle/YouCompleteMe, type ./install.sh --clang-completer --system-libclang
" to compile YouCompleteMe
" Last, you must set path to .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" close notice about loading .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0
" set completion based onags file
let g:ycm_collect_identifiers_from_tags_files=1
" set complete syntax keyword
let g:ycm_seed_identifiers_with_syntax=1
" Don't use complete cache
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
" Due to default value was <tab>, it confused with ultisnips, so I change it.
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
" set YCM error and warning symbols
let g:ycm_error_symbol='✗'
let g:ycm_warning_symbol='⚠'
" Attention, previous time, when I edit C++ source files, YCM always tell that
" cannot distinguish std, vector and other elements in STL. When I new added 
" following statement, this problem has solved.
let g:ycm_register_as_syntastic_checker=0
" force compile with Syntastic
nnoremap <F5>  :YcmForceCompileAndDiagnostics<CR>
" jump to defition or declaration
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
" } end of setting YouCompleteMe
" for ultisnips {
" } end of ultisnips
" vim-airline setting {
" first, you should install patched fonts for Powerline
" git clone https://github.com/powerline/fonts.git in ~;
" second, cd fonts/, then ./install.sh, and set guifont=...
" then setting as following...
set t_Co=256
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" set airline theme
let g:airline_theme='light'
" } end of vim-airline
" vim-easymotion setting {
let g:EasyMotion_do_mapping=0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-s)
" bidirection and with line 't' motion
omap o <Plug>(easymotion-bd-tl)
" Turn on case sensitive feature
let g:EasyMotion_smartcase=1
" JK motions: Line motions
" move to <-- backward
nmap <Leader>h <Plug>(easymotion-linebackward)
" move to downside
nmap <Leader>j <Plug>(easymotion-j)
" move to upside
nmap <Leader>k <Plug>(easymotion-k)
" move to --> forward
nmap <Leader>l <Plug>(easymotion-lineforward)
" } end of vim-easymotion setting
