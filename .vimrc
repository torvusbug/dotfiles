" My vimrc
"
" Maintainer:   Nick Allevato
"
" When started as "evim", evim.Vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Debugging to check when the vimrc was loaded
"echo "VIMRC LOADED"

" Let's begin
set nocompatible
filetype off

set rtp=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
set rtp+=$HOME/.vim/bundle/Vundle.vim

" In case we're on Windows
let $MYVIMRC='$HOME/.vimrc'

"""""""""""""""""" PLUGINS: """"""""""""""""""
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" General And Visual:
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'bling/vim-airline'
Plugin 'allevaton/vim-luna'
Plugin 'b3niup/numbers.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-endwise'

" DVCS:
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
Plugin 'airblade/vim-gitgutter'

" Syntax And Linters:
Plugin 'dbakker/vim-lint'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'

" Generic Language:
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-afterimage'
Plugin 'gerw/vim-latex-suite'
Plugin 'jiangmiao/auto-pairs'

" Utility:
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'oblitum/rainbow'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Navigation:
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tmhedberg/matchit'
Plugin 'Lokaltog/vim-easymotion'

" Python:
Plugin 'hdima/python-syntax'
"Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'alfredodeza/pytest.vim'
Plugin 'fisadev/vim-isort'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'heavenshell/vim-pydocstring'

" JavaScript:
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'nono/jquery.vim'

" CSS:
Plugin 'hail2u/vim-css3-syntax'

" HTML:
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'docunext/closetag.vim'
Plugin 'mattn/emmet-vim'

"Plugin 'Valloric/YouCompleteMe'

if has('win32')

elseif has('mac')

elseif has('linux')
  Plugin 'Matt-Stevens/vim-systemd-syntax'
  Plugin 'tkztmk/vim-vala'
endif

call vundle#end()
filetype plugin indent on
syntax on

" Handle for fish
"set shell=bash\ --norc

" This is the key that will define how remaps essentially work.
let mapleader=','

"""""""""""""""""" Base Settings: """"""""""""""""""
set autoindent      " Always
set copyindent      " Copy the previous indentation
set expandtab       " Much easier when everything's a space
set shiftround      " Only multiples of 4 for shifting
set shiftwidth=2    " Auto indenting spaces
set smarttab        " Go by shift width, not tab stop
set softtabstop=2   " Treats 4 spaces as tabs
set tabstop=2       " Tab size of 4 is better

set backspace=indent,eol,start " Backspace over everything
set gdefault        " search/replace globally on a line by default
set hidden          " Hide buffers instead of closing them.
set history=2000    " keep 2000 lines of command line history
set hlsearch        " Highlight search terms (:noh stops highlight)
set ignorecase      " ignore case sensitivity when searching
set incsearch       " do incremental searching
set laststatus=2    " Always show the status bar
set noautochdir     " DO NOT automatically adjust the current directory for the file
set nobackup        " don't keep a backup file
set noswapfile      " Who uses these, anyways?
set ruler           " show the cursor position all the time
set scrolloff=4     " Use a 4 line buffer when scrolling
set showcmd         " display incomplete commands
set showmatch       " Parenthetical matching
set showmode        " Always show the mode we're in
set sidescrolloff=2 " Side scrolling
set smartcase       " ignore case if pattern is all lower

" Folding:
set foldenable      " enable folding
set foldlevelstart=99 " start with everything folded
set foldmethod=marker " user markers for folding
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which comments trigger auto-unfold

set formatoptions=tcroqn " see :help fo-table
set wildmenu        " make tab completion work like bash
set wildmode=list:full " show a list when pressing tab complete
set modeline

" wildcard ignores
set wildignore=*.pyc,*.pyo,*.so,*.swp,*/tmp/*

set linebreak       " disable line breaks for better word wrapping
set nolist          " no lists also disable line breaks
set wrap            " word wrapping

" this could add a major typing latency, so be careful.
" if it does, remove THIS LINE
"set regexpengine=1

" CtrlP:
let g:ctrlp_extensions = ['tag', 'line']

" Dictionary:
"set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" Rainbow Parentheses:
let g:rainbow_active = 1
" 458748 was cc241d
let g:rainbow_guifgs = [
      \ '#458588',
      \ '#b16286',
      \ '#d65d0e',
      \ '#458748',
      \ '#458588',
      \ '#b16286',
      \ '#d65d0e',
      \ '#458748'
      \ ]

" YCM YouCompleteMe Configuration:
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<C-x><C-o>'
let g:ycm_key_detailed_diagnostics = '<leader>D'
let g:ycm_auto_trigger = 1

"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>DTreeFindpleter GoToDefinition<CR>

" Bufexplorer:
let g:bufExplorerShowNoName = 1

" Column Color Change:
"let &colorcolumn=join(range(80, 255 ), ',')

" Syntastic Config:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

nnoremap <leader>S :SyntasticCheck<CR>

" Eclim:
let g:EclimCompletionMethod = 'omnifunc'

" Omnicompletion:
set completeopt=menu,menuone,longest,preview

" LaTeX:
set grepprg=grep\ -nH\ $*
let g:tex_flavor = 'latex'
let g:Tex_CompileRule_dvi = "latex --interaction=nonstopmode \"$*\""
let g:Tex_CompileRule_pdf = "pdflatex --interaction=nonstopmode \"$*\""
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "evince \"$*.pdf\" \&"
let g:Tex_ViewRuleComplete_pdf = "evince \"$*.pdf\" \&"

" Airline:
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80" "use double quotes here
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"


" Tagbar:
"let g:tagbar_left = 0
let g:tagbar_sort = 0
nnoremap <leader>t :TagbarToggle<CR>

" Python Syntax Config:
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_templates = 1

" NERDTree:
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
map <leader>n :NERDTreeTabsToggle<CR>
map <leader>f :NERDTreeFind<cr><C-w><C-p>

" Indent Guides:
let g:indentLine_char = '¦'
let g:indentLine_enabled = 0  " disabled until I patch the font

" Emmet:
let g:user_emmet_leader_key = '<C-z>'
"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <Tab> emmet#expandAbbrIntelligent("\<Tab>")

" Session:
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" EasyMotion:
nnoremap ? /
map  <Space>/ <Plug>(easymotion-sn)
omap <Space>/ <Plug>(easymotion-tn)

map <Space> <Plug>(easymotion-prefix)

" These 'n' & 'N' mappings are options. You do not have to map 'n' & 'N' to EasyMotion.
" Without these mappings, 'n' & 'N' works fine. (These mappings just provide
" different highlight method and have some other features)
map <Space>n <Plug>(easymotion-next)
map <Space>N <Plug>(easymotion-prev)

nmap s <Plug>(easymotion-s)
nmap <Space>f <Plug>(easymotion-f)

" Repeat the last motion
map <Space>. <Plug>(easymotion-repeat)

map <Space>l <Plug>(easymotion-lineforward)
map <Space>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" Next Prev Navigation:
map ]l :lnext<CR>
map [l :lprevious<CR>
map ]c :cnext<CR>
map [c :cprevious<CR>
map ]h <Plug>GitGutterNextHunk
map [h <Plug>GitGutterPrevHunk

" Git Keys:
let g:gitgutter_realtime = 1
map <leader>gd :Gvdiff<CR>
map <leader>ghd :Gdiff<CR>
map <leader>gs :Gstatus<CR>
map <leader>go :Gcommit<CR>
map <leader>gu :Gpull<CR>
map <leader>gap <Plug>GitGutterPreviewHunk
map <leader>gah <Plug>GitGutterStageHunk
map <leader>grh <Plug>GitGutterRevertHunk

" QuickFix Window:
let g:quickfix_is_open = 0
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <leader>1 :call <SID>QuickfixToggle()<cr>

" Quick fix window solution {{{
function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction
" }}}

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    augroup! auto_highlight
      setl updatetime=4000
      echo 'Highlight current word: OFF'
      return 0
    augroup END
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup END
    setl updatetime=1
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" ---------------

" Set it so enter on a menu item doesn't insert return
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" Better pasting
xnoremap p "_dP

" Generate implicit tags (NOT RECOMMENDED)
nnoremap <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Quickfix
nnoremap <leader>1 :call <SID>QuickfixToggle()<cr>

" Better cursor searching
nnoremap # *
nnoremap * #

" ,ws clears whitespace
map <leader>ws :FixWhitespace<CR>

" Easier window navigation
" Using this weirdo block will stop vim-latex from remapping C-j
nmap <SID>I_won't_ever_type_this <Plug>IMAP_JumpForward
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Significantly better navigation
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" Go right to command mode from insert mode
" TODO doesn't work?
inoremap <C-;> <esc>:

" This might be a good idea
map <C-m> zz

" What an awesome idea
nnoremap ; :
nnoremap <leader>; ;

" Spelling is useful
nnoremap <leader>s :set spell!<CR>

" jj changes insert->normal
inoremap jj <esc>

" Easy :set nohls!
nnoremap <leader>2 :set nohls!<CR>
nnoremap <leader>h :noh<CR>

" Select all
inoremap <C-a> <esc>ggVG

" Switching tabs
nnoremap <C-tab> :bn<CR>
nnoremap <C-S-tab> :bp<CR>
inoremap <C-tab> <esc>:bn<CR>
inoremap <C-S-tab> <esc>:bp<CR>

"nnoremap <Tab> <C-6>

" Allow switching windows in edit mode
inoremap <C-w> <esc><C-w>

" And some nice page up and down remakes
nnoremap <S-k> <C-u>
nnoremap <S-j> <C-d>

" Deleting words easily
inoremap <C-backspace> <C-w>

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
xnoremap < <gv
xnoremap > >gv

" Copying and pasting
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has('autocmd')
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    "autocmd FileType text setlocal textwidth=79

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gVim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END

  " Go to the first line of a diff
  "if &diff == 1
  "    call setpos('.', [0, 1, 1, 0])
  "endif

  " Probably using NASM in Vim
  au BufRead,BufNewFile *.asm set filetype=nasm

  " Close the preview window when we move
  au CursorMovedI * if pumvisible() == 0|silent! pclose|endif

  " Always have rainbow parentheses on
  "au BufNewFile,BufRead * RainbowParenthesesLoadRound
  "au BufNewFile,BufRead * RainbowParenthesesActivate
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For GUI:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  " Line highlight
  set cul
  set nu
  set rnu " Relative numbers

  "if has('autocmd')
  "au BufLeave,WinLeave,FocusLost * set norelativenumber
  "au BufEnter,WinEnter,FocusGained * set relativenumber

  "au InsertEnter * set norelativenumber
  "au InsertLeave * set relativenumber

  "au BufEnter,WinEnter,FocusGained,FileType nerdtree set norelativenumber
  "endif

  if has('mac')
    set linespace=2
  endif

  " GUI Font
  if has("win32")
    set guifont=Consolas\ for\ Powerline:h14
  elseif has("mac")
    set guifont=Consolas\ for\ Powerline:h14
  else
    set guifont=Consolas\ for\ Powerline\ 12
  endif

  " Colorscheme:
  set background=dark
  colorscheme luna

  " With this, the gui (gVim and macVim) now doesn't have the toolbar,
  " left and right scrollbars, and the menu.
  " From Valloric's vimrc
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions-=M
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For JetBrains IDE IdeaVim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("IDEA")
  map ,r :action RenameElement<CR>
  map ,d :action GotoDeclaration<CR>
  map ,d :action GotoDeclaration<CR>
  map ,s :action ShowErrorDescription<CR>
  "map / :action GotoSymbol<CR>

  map [c :action GotoPreviousError<CR>:action ShowErrorDescription<CR>
  map ]c :action GotoNextError<CR>:action ShowErrorDescription<CR>

  map <C-o> :action Back<CR>
  map <C-i> :action Forward<CR>

  map S :action SurroundWith<CR>
endif
