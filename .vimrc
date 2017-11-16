" __              __   __  __
"/\ \            /\ \ /\ \/\ \  __
"\ \ \         __\ \\ \ \ \ \ \/\_\    ___ ___
" \ \ \  __  /'__`\//  \ \ \ \ \/\ \ /' __` __`\
"  \ \ \L\ \/\  __/     \ \ \_/ \ \ \/\ \/\ \/\ \
"   \ \____/\ \____\     \ `\___/\ \_\ \_\ \_\ \_\
"    \/___/  \/____/      `\/__/  \/_/\/_/\/_/\/_/
"
" Legz's Everyday Vim Config File
" - Used mostly for Golang, Perl, Shell
"
" 1. Plugins
"	- vundle
"	- see plugin list
"
" 2. Hotkeys
"       2.1 Leader Hotkeys (SPACE)
"		r:	Save and run Go program.
"		ev:	Open .vimrc in a split.
"		sv:	Reload vim with the new changes in .vimrc.
"		=:	Auto-indent the whole file.
"		n:	Jump to the next error (Syntastics).
"		E:	Close all syntastics error windows
"		p:	Jump to the previous error (Syntastics).
"		t:	Toggle the TagBar (Vim-Go).
"		g:	Run the Go linter on the project.
"		gg:	Doesnt work?
"		ii:	Run GoImplements on the current keyword under the cursor.
"		cc:	Run GoCallees on the current keyword under the cursor.
"		R:	Globaly rename the variable name.
"		q:	Quit vim.
"		qq:	Really quit vim.
"		h:	hide search highligt
"
"	2.2 Other Hotkeys
"		C^n	Toggle NERDTree
"		F5	Toggle Paste-Mode
"		F6	Toggle Tagbar
"		F7	Toggle linenumbers
"		^x^o 	Toggle omnicomplete
"
"	2.2.1 Nerdtree Hotkeys
"		o 	open folder
"		O	recursively open folder
"		go	preview file
"		t	open in new tab
"		i	open in vertical split
"		s	open in horizontal split
"		:e somefile	create a new file
"
"	2.2.2 VimWiki Hotkeys
"		<Leader>ww	Open default wiki index file.
"		<Leader>wt	Open default wiki index file in a new tab.
"		<Leader>ws	Select and open wiki index file.
"		<Leader>wd	Delete wiki file you are in.
"		<Leader>wr	Rename wiki file you are in.
"		<Enter>		Follow/Create wiki link
"		<Shift-Enter>	Split and follow/create wiki link
"		<Ctrl-Enter> 	Vertical split and follow/create wiki link
"		<Backspace>	Go back to parent(previous) wiki link
"		<Tab>		Find next wiki link
"		<Shift-Tab>	Find previous wiki link
"		For more keys, see :h vimwiki-mappings
"
"	2.3 Abbreviations
"		GOERR	Print standard go err-clause
"		GOSDL	Import Go SDL Libraries
"		GOVEC	Import Go 2D Vector libraries
"
" ====================================================================
" Enable syntax highlight
" ====================================================================
syntax on

" ====================================================================
" Be (Vim)proved, required from Vundle
" ====================================================================
set nocompatible
filetype off

" ====================================================================
" Set the runtime path to initialize vundle
" ====================================================================
set rtp+=~/.vim/bundle/Vundle.vim

" ====================================================================
" Begin of Plugins section
" To install plugins on new machines
" :PluginInstall
" ====================================================================

" ====================================================================
" Start vundle. Keep plugin commands between vundle#begin/end
" Alternatively, pass a path where Vundle should install plugins
" Example: call vundle#begin('~/some/path/here')
" ====================================================================
call vundle#begin('~/.vim/plugins')

" ====================================================================
" Vundle:
" Let Vundle manage Vundle, required
" ====================================================================
Plugin 'VundleVim/Vundle.vim'

" ====================================================================
" YouCompleteMe:
" Syntax completion, suggestion, and check error syntax
" python install.py --gocode-completer
" ====================================================================
"Plugin 'valloric/youcompleteme'

" ====================================================================
" The NERD Tree:
" Hierarchy Tree starting from current directory.
" ====================================================================
Plugin 'scrooloose/nerdtree'

" ====================================================================
" NERD Tree Syntax:
" Syntax highlighting
" ====================================================================
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" ====================================================================
" The NERD Commenter:
" Easiest way to comment blocks, lines, etc.
" ====================================================================
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'

" ====================================================================
" Vim Markdown Syntax:
" Syntax for markdown files
" ====================================================================
"Plugin 'plasticboy/vim-markdown'

" ====================================================================
" Vim Instant Markdown:
" Preview your markdown files
" ====================================================================
"Plugin 'suan/vim-instant-markdown'

" ====================================================================
" HTML5:
" Omnicomplete and syntax
" ====================================================================
"Plugin 'othree/html5.vim'

" ====================================================================
" JQuery Syntax:
" ====================================================================
"Plugin 'nono/jquery.vim'

" ====================================================================
" Vim Wiki:
" Live preview of markdown
" ====================================================================
"Plugin 'vimwiki/vimwiki'

" ====================================================================
" Vim JSON:
" Pretty render of json
" ====================================================================
Plugin 'elzr/vim-json'

" ====================================================================
" Vim Go:
" Go support in vim
" ====================================================================
"Plugin 'fatih/vim-go'

" ====================================================================
" Base16 colorschemes:
" Pretty colors
" ====================================================================
Plugin 'chriskempson/base16-vim'

" ====================================================================
" Conque Shell:
" Run commands inside vim
" Great for color output of cisco/juniper ssh
" ====================================================================
Plugin 'vim-scripts/Conque-Shell'

" ====================================================================
" Better Whitespace:
" ====================================================================
"Plugin 'ntpeters/vim-better-whitespace'


" Uncommented cuz dont know how to use yet
"Plugin 'junegunn/fzf.vim'

" Limelight
Plugin 'itchyny/lightline.vim'

Plugin 'w0rp/ale'

Plugin 'airblade/vim-gitgutter'

Plugin 'sheerun/vim-polyglot'

Plugin 'pearofducks/ansible-vim'


call vundle#end()
filetype plugin indent on
" ====================================================================
" End plugin things
" ====================================================================

" Set SPACE as the leader-key.
let mapleader = " "

" ====================================================================
" Keybindings
" ====================================================================
map <C-n> :NERDTreeToggle<CR>	" Toggle NERDTree Window
map <F5> :set paste<CR>		" Set pasta mode
map <F2> :GoRun<CR>		" Save files, compile and run go programs
map <F6> :TagbarToggle<CR>	" Show tag source in sidebar
map <F7> :set invnumber<CR>	" Toggle linenumbers

noremap <leader>r :wa<cr>:GoRun<CR>
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>= gg=G
noremap <leader>n :lnext<cr>
noremap <leader>E :lclose<cr>
noremap <leader>p :lprev<cr>
noremap <leader>t :TagbarToggle<cr>
noremap <leader>g :GoLint<cr>
noremap <leader>gg :GoVet<cr>
noremap <leader>ii :GoImplements<cr>
noremap <leader>cc :GoCallees<cr>
noremap <leader>R :GoRename<cr>
noremap <leader>q :q<cr>
noremap <leader>qq :q!<cr>
noremap <leader>wa :wa<cr>
noremap <leader>w :w<cr>
noremap <leader>h :nohlsearch<CR>
inoremap jk <esc>

iabbrev GOERR if err != nil {<cr><cr>}
iabbrev HANDLER (w http.ResponseWriter, r *http.Request)

" ====================================================================
" Colorscheme
" ====================================================================
let base16colorspace=256  	" Access colors present in 256 colorspace
set background=dark		" Use dark theme
colorscheme base16-unikitty-dark " Enable base16 theme
let g:rehash256 = 1

" ====================================================================
" Visual
" ====================================================================
set number 			" Enable line numbering
set ruler			" Enable ruler
set cmdheight=1			" Height of the command bar
set cursorline!			" Hightlight line with the cursor on
"set showmode			" Shows the current mode in the modeline
set t_Co=256 			" Enable 256-color mode
set t_ut=			" Dont know
set term=xterm-256color		" 256-color mode, for windows/cygwin
set visualbell t_vb=		" no visual bell
set novisualbell                " no visual bell
set shortmess=aIoO		" no welcome message
"set wildmenu            	" visual autocomplete for command menu
set wildmode=list:longest,full	" Show vim completion menu

" Statusline
set laststatus=2		" Display statusline
set showcmd     		" show command in bottom bar
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
set noshowmode 			" Lightline handle this

" ====================================================================
" Clipboard
" ====================================================================
set clipboard^=unnamed
set clipboard^=unnamedplus

" ====================================================================
" Behaviour
" ====================================================================
set nobackup 			" Backup is for pussies.
set noswapfile			" Disable .swp file.
set undolevels=256 		" Undo levels.
set history=256			" How much history to save.
set scrolloff=8			" Number of line to keep above cursor when scrolling
set autoread 			" Auto read when file is changed
set magic  			" Regular expression magic
set nocp 			" no-compatible mode
set backspace=eol,start,indent	" Smarter backspace
set encoding=utf8 		" UTF-8 Encoding
set ttyfast			" faster redrawing
set nowb			" Prevents automatic write backup before overwriting file
set diffopt+=vertical		" Always use vertical diffs
set updatetime=250		" Faster update of internals
set cindent                 	" Automatic program indenting
set cinkeys-=0#             	" Comments don't fiddle with indenting
"set notitle                 	" Don't set the title of the Vim window
set lazyredraw


" Brackets
set showmatch			" Show matching brackets
set mat=2 			" Bracket matching blinking interval (1/10 sec)

" Searching
set incsearch			" Show partial matches.
set hlsearch			" Highlight search patterns.
set ignorecase			" Ignore case when searching.
set smartcase			" Dont ignore case if there is capitals in the search pattern

" Indentation
set shiftwidth=8		" Go standard shiftwidth
set smarttab			" Smart tab
set smartindent			" Smart indent
set autoindent			" Autointentation
set textwidth=128		" Cap linewidth at 128
filetype plugin indent on	" Indent for plugins

" Input
set pastetoggle=<F5> 		" Paste mode on F5
"set mouse=a			" Enable mouse scrolling.

" i always, ALWAYS hit ":W" instead of ":w"
command! Q q
command! W w

" ====================================================================
" Vim-Go settings
" Syntax-highlighting for Functions, Methods and Structs 
" Fist time run :GoInstallBinarys in vim
" ====================================================================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" gotags
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

" ====================================================================
"HTML Editing
" ====================================================================
set matchpairs+=<:>
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are

" ====================================================================
" File Detects
" ====================================================================
" Perl
au FileType pl,pm,t set filetype=perl
au FileType ep set filetype=html
au FileType perl set makeprg=perl\ -c\ %\ $*
au FileType perl set errorformat=%f:%l:%m

" Junos configuration
autocmd BufNewFile,BufReadPost *.junos set filetype=junos

" Python configuration
autocmd BufNewFile,BufReadPost *.py set filetype=python

" Systemd
au BufNewFile,BufRead *.automount set filetype=systemd
au BufNewFile,BufRead *.mount     set filetype=systemd
au BufNewFile,BufRead *.path      set filetype=systemd
au BufNewFile,BufRead *.service   set filetype=systemd
au BufNewFile,BufRead *.socket    set filetype=systemd
au BufNewFile,BufRead *.swap      set filetype=systemd
au BufNewFile,BufRead *.target    set filetype=systemd
au BufNewFile,BufRead *.timer     set filetype=systemd

" Nginx
au BufRead,BufNewFile /opt/nginx/*,/etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/nginx/conf.d/* if &ft == '' | setfiletype nginx | endif 

" Ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible
" ====================================================================
" Nerdtree settings
" ====================================================================
" Open Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nerdtree is only buffer left when :q
function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
				\ || &buftype == 'quickfix'
		q
	endif
endfunction
augroup CloseIfOnlyControlWinLeft
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" ====================================================================
" Vimwiki
" ====================================================================
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md', 'index': 'Index'}]

" ====================================================================
" Open file at last edited position
" ====================================================================
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\"" |
			\ endif

" ====================================================================
" JQuery
" ====================================================================
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" ====================================================================
" LightLine
" ====================================================================
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [['mode', 'paste'], ['filename', 'modified']],
			\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
			\ },
			\ 'component_expand': {
			\   'linter_warnings': 'LightlineLinterWarnings',
			\   'linter_errors': 'LightlineLinterErrors',
			\   'linter_ok': 'LightlineLinterOK'
			\ },
			\ 'component_type': {
			\   'readonly': 'error',
			\   'linter_warnings': 'warning',
			\   'linter_errors': 'error'
			\ },
			\ 'component_function': {
			\   'filename': 'LightLineFilename'
			\ }
			\ }

function! LightlineLinterWarnings() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors
	return l:counts.total == 0 ? '✓ ' : ''
endfunction

function! LightLineFilename()
	return expand('%:p')
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
	if exists('#lightline')
		call lightline#update()
	end
endfunction

" ====================================================================
" GitGutter
" ====================================================================
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
" Always display gitgutter column. (Prevents movement of the linenumber column)
if exists('&signcolumn')  " Vim 7.4.2201
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif

" ====================================================================
" ALE
" ====================================================================
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" ====================================================================
" Theme Overwrites
" ====================================================================
" Search hilight color
hi Search cterm=NONE ctermfg=black ctermbg=gray
" LineNumber Background
highlight LineNr ctermfg=gray ctermbg=black
" GitGutter Line Color
highlight GitGutterAdd ctermfg=green ctermbg=black
highlight GitGutterChange ctermfg=yellow ctermbg=black
highlight GitGutterDelete ctermfg=red ctermbg=black
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=black

" Conque-Shell
" conque term is missing python scripts in git repo,
" download manualy to .vim/plugins/Conque-Shell/autoload/conque_term/
let g:ConqueTerm_Color = 1
let g:ConqueTerm_InsertOnEnter = 0
