"------------------------------------------------------------
" For add or update plugins, please see
" https://gist.github.com/manasthakur/ab4cf8d32a28ea38271ac0d07373bb53
"------------------------------------------------------------
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
" let python_highlight_all=1
syntax on

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

set completeopt=menu
"------------------------------------------------------------
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" line at 80th col
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=1
endif
" Set textwidth
set textwidth=80
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" set invi characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" set font
"if has("gui_running")
"    if has("gui_gtk3")
"        echo "Linux"
"        set guifont=Inconsolata\ 12
"    elseif has("gui_macvim")
"        echo "Mac OS"
"        set guifont=Menlo\ Regular:h14
"    elseif has("gui_win32")
"        echo "Win"
"        set guifont=Consolas:h14:cANSI
"    endif
"endif
"
"set guifont=Incosolata\ 15
" ------------------------------------------------------------
"  Make vim clipboard as system clipboard
"  only works for MacOS and Windows
set clipboard=unnamed
" for Linux
" set clipboard=unnamedplus

" ------------------------------------------------------------
" Save current session and load as default
" ------------------------------------------------------------
" function! MakeSession()
"     let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"     if (filewritable(b:sessiondir) != 2)
"         exe 'silent !mkdir -p ' b:sessiondir
"         redraw!
"     endif
"     let b:filename = b:sessiondir . '/session.vim'
"     exe "mksession! " . b:filename
" endfunction
"
" function! LoadSession()
"     let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"     let b:sessionfile = b:sessiondir . "/session.vim"
"     if (filereadable(b:sessionfile))
"         exe 'source ' b:sessionfile
"     else
"         echo "No session loaded."
"     endif
" endfunction
"
" au VimEnter * nested :call LoadSession()
" au VimLeave * :call MakeSession()
" " ------------------------------------------------------------

" ------------------------------------------------------------
"  Vim plugins
" ------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Folding code
Plug 'tmhedberg/SimpylFold'

" Ctrl P for lazzy search inside project
Plug 'kien/ctrlp.vim'

" produre a line for each tab (4 spaces)
Plug 'Yggdroot/indentLine'

Plug 'scrooloose/nerdtree'

" status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" naming tabs (not use)
"Plug 'vim-ctrlspace/vim-ctrlspace'

" tmux theme for airline
Plug 'edkolev/tmuxline.vim'

" git plugin inside vim
"Plug 'tpope/vim-fugitive'

" check code syntax
Plug 'scrooloose/syntastic'

" auto format code
Plug 'Chiel92/vim-autoformat'

" Markdown preview
"Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'ervandew/supertab'

" vim Python
Plug 'python-mode/python-mode'

" onedark
Plug 'joshdick/onedark.vim'

" taglist
"Plug 'vim-scripts/taglist.vim'

" Icon list
Plug 'ryanoasis/vim-devicons'
call plug#end()

" ------------------------------------------------------------
" COLOR THEME
" ------------------------------------------------------------
" -- solarized personal conf
syntax enable
" set background=dark
" try
"    colorscheme solarized
" catch
" endtry

" always show status bar
set laststatus=2

" https://github.com/rakr/vim-one
let g:airline_theme='wombat'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" list all buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = '' "'»'
let g:airline_left_sep = '' "'▶'
let g:airline_right_sep = '' "'«'
let g:airline_right_sep = '' "'◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_powerline_font=1
" ------------------------------------------------------------
" colorscheme onedark
" set background=dark
" ------------------------------------------------------------
"  tmuxline
" ------------------------------------------------------------
let g:tmuxline_powerline_separators = 0
let g:airline_extensions#tmuxline#enabled=1

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#(date)'}

" ------------------------------------------------------------

" ------------------------------------------------------------
" indentLine
let g:indentLine_leadingSpaceChar='.'
let g:indentLine_leadingSpaceEnabled=1

let g:indentLine_fileTypeExclude=['text']
let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']
" ------------------------------------------------------------

" ------------------------------------------------------------
"  SimpylFold
"  Goal: for Python code folding
" ------------------------------------------------------------
let g:SimpylFold_docstring_preview=1
" ------------------------------------------------------------

" ------------------------------------------------------------
"  Syntastic
" ------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" ------------------------------------------------------------

" ------------------------------------------------------------
"  CtrlSpace
"  Tabs and Buffers management
" ------------------------------------------------------------
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"let g:CtrlSpaceSaveWorkspaceOnExit = 1
"
"" For better symbols in CtrlSpace (if use MacVim)
"if has("gui_running")
"        " Settings for MacVim and Inconsolata font
"        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
"endif
" ------------------------------------------------------------

" ------------------------------------------------------------
"  vim-autoformat
" ------------------------------------------------------------
let g:formatterpath = ['/Users/BQM/anaconda2/bin/autopep8']
" ------------------------------------------------------------

" ------------------------------------------------------------
"  vim-markdown-preview
" ------------------------------------------------------------
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
" ------------------------------------------------------------
"if (empty($TMUX))
"  if (has("nvim"))
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
colorscheme onedark
set background=dark
hi Normal ctermbg=none
" ------------------------------------------------------------

" ------------------------------------------------------------
"  Auto fold comment
" ------------------------------------------------------------
"set foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*'.&commentstring[0]
"autocmd FileType c setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*//'
"autocmd FileType python setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*#'
" ------------------------------------------------------------
"  function! ToggleNerdtreeTagbar()

"    " check if NERDTree and Tagbar are opened
"    let NERDTree_close = (bufwinnr('NERD_tree') == -1) 
"    let Tagbar_close   = (bufwinnr('__Tagbar__') == -1) 
"
"    TagbarToggle
"    NERDTreeToggle
"
"    if NERDTree_close && Tagbar_close
"        wincmd K
"        wincmd b
"        wincmd L
"        wincmd h
"        exe 'vertical resize 30'
"    endif
"
"endfunction
"nmap <C-e> :call ToggleNerdtreeTagbar()<CR>
set wrap

set encoding=UTF-8
set guifont=Inconsolata\ Nerd\ Font\ Complete\ 15
