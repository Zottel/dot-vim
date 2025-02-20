" vim: foldmethod=marker
" vim: foldcolumn=3

" Plugins {{{1
	" Pathogen: Load plugins {{{2
	execute pathogen#infect()
	" (Adds every folder in .vim/bundle to search path)

	" CTRL-P: Sublime-like File Search {{{2
	" Prevent hanging when used on huge folders
	"let g:ctrlp_max_files = 4096
	" Search from current directory instead of project root
	"let g:ctrlp_working_path_mode = 0
	" Search only the git repo of the current folder.
	"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
	
	" MiniBuf: Simple window and buffer navigation {{{2
	"let g:miniBufExplMapWindowNavVim = 1 "Bound by hand now
	"let g:miniBufExplMapCTabSwitchBufs = 1

	" NERDTree: Show when no file is given {{{2
	"autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" Session workaround
	"defunct: exec "autocmd BufEnter ". s:NERDTreeBufName ."* call <SID>initNerdTreeInPlace(\"\")"
	"defunct: exec "autocmd BufEnter ". s:NERDTreeBufName ."* :NERDTreeToggle | :NERDTreeToggle"

	" vim-session: Save and load window configurations with NERDTree support. {{{2
	" Session locking is derp most of the time anyway...
	let g:session_lock_enabled = 0
	" Do not remember font size (want it to be global setting)
	let g:session_persist_font = 0
	" Nope!
	let g:session_autosave = 'no'
	

	" EasyMotion {{{2
	" Removed ; from list
	let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
	" Supposed to make it work with only one leader..
	"map <Leader> <Plug>(easymotion-prefix)
	map <Space> <Plug>(easymotion-prefix)

	" EchoDoc {{{2
	set cmdheight=2
	let g:echodoc#enable_at_startup = 1

	" FZF {{{2
	map <C-p> :FZF<CR>
	" Customize fzf colors to match your color scheme
	let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
		\ 'bg':      ['bg', 'Normal'],
		\ 'hl':      ['fg', 'Comment'],
		\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
		\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
		\ 'hl+':     ['fg', 'Statement'],
		\ 'info':    ['fg', 'PreProc'],
		\ 'border':  ['fg', 'Ignore'],
		\ 'prompt':  ['fg', 'Conditional'],
		\ 'pointer': ['fg', 'Exception'],
		\ 'marker':  ['fg', 'Keyword'],
		\ 'spinner': ['fg', 'Label'],
		\ 'header':  ['fg', 'Comment'] }
	" ALE {{{2
		set completeopt=menu,menuone,preview,noselect,noinsert
		let g:ale_completion_enabled = 1
		" Required, explicitly enable Rust LS
		let g:ale_linters = {
		\  'rust': ['analyzer'],
		\}
		nnoremap <F6> :ALEDetail<CR>
		nnoremap <F7> :ALEGoToDefinition<CR>
		
		let g:ale_rust_rls_config = {
			\ 'rust': {
				\ 'all_targets': 1,
				\ 'build_on_save': 1,
				\ 'clippy_preference': 'on'
			\ }
			\ }
		let g:ale_rust_rls_toolchain = ''
		let g:ale_c_build_dir_names = [ 'build' ]
		let g:ale_rust_rls_executable = 'rust-analyzer'
		let g:ale_linters = {
				\ 'rust': ['rls']
				\ }
		let g:ale_fixers = {
				\ 'rust': ['rustfmt']
				\ }
	
	" Rust.vim {{{2
		"let g:tagbar_position = 'leftabove'
		let g:tagbar_position = 'left'
	
	" Tagbar {{{2
		nmap <F8> :TagbarToggle<CR>
		let g:tagbar_type_rst = {
					\ 'ctagstype' : 'ReStructuredText',
					\ 'kinds' : [
					\ 	'c:chapter',
					\ 	's:article',
					\ 	'S:section',
					\ ],
					\ "sort" : 0
					\ }
		
		let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
		let g:tagbar_type_rust = {
					\ 'ctagsbin' : '/usr/bin/ctags-universal',
					\ 'ctagstype' : 'rust',
					\ 'kinds' : [
						\ 'n:modules',
						\ 's:structures:1',
						\ 'i:interfaces',
						\ 'c:implementations',
						\ 'f:functions:1',
						\ 'g:enumerations:1',
						\ 't:type aliases:1:0',
						\ 'C:constants:1:0',
						\ 'M:macros:1',
						\ 'm:fields:1:0',
						\ 'e:enum variants:1:0',
						\ 'P:methods:1',
					\ ],
					\ 'sro': '::',
					\ 'kind2scope' : {
						\ 'n': 'module',
						\ 's': 'struct',
						\ 'i': 'interface',
						\ 'c': 'implementation',
						\ 'f': 'function',
						\ 'g': 'enum',
						\ 't': 'typedef',
						\ 'v': 'variable',
						\ 'M': 'macro',
						\ 'm': 'field',
						\ 'e': 'enumerator',
						\ 'P': 'method',
					\ },
				\ }

" General Settings {{{1
	" UTF-8 Encoding {{{2
	set encoding=utf8

	" Longer history (default: 20) {{{2
	set history=400

	" Turn off beeping {{{2
	set visualbell
	" May reduce problems caused by compatibility mode {{{2
	set nocompatible

	" Tabs/Spaces {{{2
	set ts=2 sts=2 sw=2

	" Show special chars for tab/trailing space {{{2
	set list
	set listchars=tab:»·,trail:·

	" Wild Menu - cli tab completion done right {{{2
	set wildmenu
	set wildmode=list:longest

	" Autoindent {{{2
	set autoindent

	" Line Numbering {{{2
	set number

	" Cursor position highlighting {{{2
	set cursorline
	"set cursorcolumn

	" Show matching brackets {{{2
	set showmatch

	" Enable syntax highlighting {{{2
	syntax enable

	" Limit length of line for syntax hl for performance reasons. {{{3
	" (Yay 2015 Intel Core i7 and my text editor lags...)
	set synmaxcol=250

	" Mark 81st column {{{2
	set colorcolumn=81

	" Filetype {{{2
	set filetype=on
	filetype plugin on
	filetype indent on

	" line break {{{2
	"set textwidth=80
	set wrap

	" Searching {{{2
	set ignorecase
	set smartcase " case-sensitive when uppercase in search string
	set hlsearch
	set incsearch
	set novisualbell

	" Ignore files we do not want vim to show in autocomplete etc... {{{2
	set wildignore+=.git,*.so,*.swp,*.zip,*.pyc,*.dll,*.exe

	" Backups and swap directory {{{2
	set backup
	:silent !mkdir -p ~/.vim/backup ~/.vim/temp
	set backupdir=~/.vim/backup
	set directory=~/.vim/temp " swap files

	" Status line {{{2
	set laststatus=2

	" Explore Folding {{{2
	let g:netrw_liststyle=3
	
	" Folding

" Colour Scheme {{{1
	set background=dark
	"colorscheme solarized
	"colorscheme srcery
	colorscheme gruvbox

	"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
	"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
	"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
	if (empty($TMUX))
	  if (has("nvim"))
	    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	  endif
	  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	  if (has("termguicolors"))
	    set termguicolors
	  endif
	endif

" Key Mapping {{{1
	" Leader changed to "," {{{2
	let mapleader = ","
	" Window Movement {{{2
	"nnoremap <C-h> <C-W>h
	"nnoremap <C-j> <C-W>j
	"nnoremap <C-k> <C-W>k
	"nnoremap <C-l> <C-W>l
	"nnoremap <C-Tab> :bn<Enter>
	"nnoremap <C-w> :bn<Enter>

	" Folder Explorer {{{2
	map <leader>e :Explore<cr>

	" Clearing search string {{{2
	map <leader>s :let @/ = ""<cr>
	" Toggle wrap {{{2
	map <leader>w :set wrap!<cr>


" File Syntax {{{1
	" Quartz {{{2
	autocmd BufReadPost *.qrz set syntax=qrz

	" F# {{{2
	" source files are recognised as forth otherwise
	" autocmd BufNewFile,BufRead *.fs set syntax=fsharp
	"autocmd BufReadPost *.fs set syntax=fsharp
	autocmd FileType fsharp setlocal ts=4 sts=4 sw=4 expandtab

	" Markdown {{{2
	let g:markdown_fold_style = 'nested'
	autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
	autocmd BufNewFile,BufReadPost *.md setlocal foldmethod=expr


	" PHP {{{2
	autocmd BufNewFile,BufReadPost *.php setlocal foldmethod=marker
	autocmd BufNewFile,BufReadPost *.php setlocal foldmarker={,}



" File templates {{{1
	" RestructuredText {{{2
	autocmd BufReadPost *.rst set syntax=qrz
	autocmd BufNewFile  *.rst 0r ~/.vim/templates/restructuredtext.rst

