"  __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/Diff_machine_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
"let &t_ut=''
set autochdir



" ===
" === Editor behavior
" ===
set number
"set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

autocmd BufNewFile,BufRead *.vim setlocal noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.json setlocal noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
" autocmd FileType c :set autowrite
" autocmd BufNewFile,BufRead *.c setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
"set notimeout
"set ttimeoutlen=0
"set viewoptions=cursor,folds,slash,unix
" set wrap
set nowrap
"set textwidth=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
"set formatoptions-=tc
"set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
"set shortmess+=c
"set inccommand=split
"set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw "same as above
"set visualbell

"silent !mkdir -p ~/.config/nvim/tmp/backup
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.

set colorcolumn=80
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
"let g:neoterm_autoscroll = 1
"autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
"tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'




" ===
" === Basic Mappings
" ===

" Set <Leader> as <Space>
let mapleader=" "

" exchange ; and :
noremap ; :
noremap : ;

" Save & quit
noremap S :w<CR>
noremap Q :q<CR>
noremap ,q :q!<CR>
"noremap <C-q> :qa<CR>
inoremap kj <Esc>

" Replace the character under the cursor with {char}.
nnoremap 0 r


" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>


" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>tt :%s/    /\t/g
"vnoremap <LEADER>tt :s/    /\t/g

" Folding
"noremap <silent> <LEADER>o za

" Open up lazygit
noremap \g :Git
noremap <C-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
nnoremap <C-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>


" ===
" === Cursor Movement
" ===
" Cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k
" < h   l >
"     j
"     v

" K/J keys for 5 times k/j (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Ctrl + U or E will move up/down the view port without moving the cursor
" noremap <C-U> 5<C-y>
" noremap <C-E> 5<C-e>


" ===
" === Insert Mode Cursor Movement
" ===
inoremap <M-a> <ESC>A
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <C-A> <Home>
inoremap <C-E> <Esc>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
"noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <Nop>

" Split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sp <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srp <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <Leader>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tn
noremap tn :tabnew<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmh and tml
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" source $HOME/.config/nvim/vimwiki-snippets.vim
" auto spell
"autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
"inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~


" Enter paste mode
set pastetoggle=<F2>


" Auto change directory to current dir
"autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" noremap tx :r !figlet
noremap tx :r !toilet -f mono9.tlf 

" External command
nnoremap <Leader>cm :r !

"noremap <LEADER>- :lN<CR>
"noremap <LEADER>= :lne<CR>

" find and replace
"noremap \s :%s//g<left><left>

" Compile function
noremap r :call CompileRunGcc()<CR>
function! CompileRunGcc()
	execute "w"
	if &filetype == 'c'
		if !isdirectory("build")
			execute "!mkdir build"
		endif
		execute "!gcc -o build/%< %"
		set splitbelow
		split
		set nosplitbelow
		resize -15
		autocmd TermOpen term://* startinsert
		:term time ./build/%<
	elseif &filetype == 'cpp'
		if !isdirectory("build")
			execute "!mkdir build"
		endif
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o build/%<"
		split
		resize -15
		:term time ./build/%<
	elseif &filetype =='lua'
		set splitbelow
		split
		set nosplitbelow
		resize -15
		autocmd TermOpen term://* startinsert
		:term lua %
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		set splitbelow
		split
		set nosplitbelow
		resize -15
		autocmd TermOpen term://* startinsert
		:term bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		" exec "MarkdownPreview"
		execute "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		split
		set nosplitbelow
		:term go run .
	elseif &filetype == 'rust'
		" set splitbelow
		" split
		" set nosplitbelow
		" resize -15
		" autocmd TermOpen term://* startinsert
		execute "!cargo run"
	endif
endfunction



" Debug function
noremap R :call DebugRunGDB()<CR>
function! DebugRunGDB()
	execute "w"
	if &filetype == 'c'
		if !isdirectory("build/debugs")
			execute "!mkdir -p build/debugs"
		endif
		execute "!gcc -std=c11 -g -o build/debugs/%< %"
		set splitbelow
		split
		set nosplitbelow
		resize -15
		autocmd TermOpen term://* startinsert
		:term time ./build/debugs/%<
	elseif &filetype == 'cpp'
		if !isdirectory("build/debugs")
			execute "!mkdir -p build/debugs"
		endif
		set splitbelow
		exec "!g++ -std=c++11 -Wall -g -o build/debugs/%< %"
		split
		resize -15
		:term time ./build/debugs/%<
	endif
endfunction




" map <F4> :call TitleDet()<CR>
" function AddTitle()
    " call append(0,"\#!/usr/bin/env bash")
    " call append(1,"# ******************************************************")
    " call append(2,"# Author       : geometryolife")
    " call append(3,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    " call append(4,"# Email        : geometryolife@gmail.com")
    " call append(5,"# Filename     : ".expand("%:t"))
    " call append(6,"# Description  : ")
    " call append(7,"# ******************************************************")
    " echohl WarningMsg | echo "Successful in adding copyright." | echohl None
" endf

" function UpdateTitle()
     " normal m'
     " execute '/# Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
     " normal ''
     " normal mk
     " execute '/# Filename/s@:.*$@\=":\t".expand("%:t")@'
     " execute "noh"
     " normal 'k
     " echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
" endfunction

" function TitleDet()
    " let n=1
    " while n < 10
        " let line = getline(n)
        " if line =~ '^\#\s*\S*Last\smodified\S*.*$'
            " call UpdateTitle()
            " return
        " endif
        " let n = n + 1
    " endwhile
    " call AddTitle()
" endfunction



" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
Plug 'mhartington/oceanic-next'
" Plug 'theniceboy/nvim-deus'

" UI Beautification
Plug 'mhinz/vim-startify'
"Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'

" Emoji
Plug 'junegunn/vim-emoji'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'

" Plug 'vimwiki/vimwiki'

" Editor Enhancement
Plug 'preservim/nerdcommenter'
Plug 'AndrewRadev/switch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-peekaboo'

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
" Plug 'rhysd/vim-clang-format'


" Taglist
" Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Undo Tree
Plug 'mbbill/undotree'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Go
"Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align

Plug 'rust-lang/rust.vim'

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'jpalardy/vim-slime'
"Plug 'sillybun/vim-repl'
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

" Lua
Plug 'andrejlevkovitch/vim-lua-format'

Plug 'voldikss/vim-translator'

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'theniceboy/vim-snippets'
Plug 'honza/vim-snippets'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c'}

" Code check
" Plug 'dense-analysis/ale'



" File navigation
Plug 'gcmt/wildfire.vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'tpope/vim-surround'  " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
" V -normal $cs'"

Plug 'theniceboy/vim-calc'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Plug 'ianding1/leetcode.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()




"  ____  _             _          ____             __ _
" |  _ \| |_   _  __ _(_)_ __    / ___|___  _ __  / _(_) __ _
" | |_) | | | | |/ _` | | '_ \  | |   / _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | |__| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \____\___/|_| |_|_| |_|\__, |
"                |___/                                  |___/



" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support

colorscheme deus
" colorscheme OceanicNext

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:airline_theme='oceanicnext'


" ===
" === FZF
" ===
" noremap <Leader>fa :Ag<CR>

" for e in emoji#list()
  " call append(line('$'), printf('%s (%s)', emoji#for(e), e))
" endfor
set completefunc=emoji#complete


" ===
" === Tabular
" ===
vmap ga :Tabularize /

" ===
" === Tagbar
" ===
" map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === Undotree
" ===
nnoremap <leader>U :UndotreeToggle<CR>
silent !mkdir -p $HOME/.config/nvim/tmp/undo
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo
endif
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
" e.g. using 'd' instead of 'days' to save some space.
" let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8

" ===
" === vim-signature
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z

" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer

" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>        Remove all markers



" ===
" === NERDTree
" ===
nmap tt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = ""
" let NERDTreeMapUpdirKeepOpen = "l"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeOpenVSplit = ""
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = "n"
" let NERDTreeMapChangeRoot = "y"


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_disable_mappings = 0

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 0
let g:instant_markdown_allow_unsafe_content = 0
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_port = 8888
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" let g:instant_markdown_browser = "firefox --new-window"


" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]



" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === vimwiki
" ===
" let g:vimwiki_list = [{'path': '/home/ubuntu/GitHub-Learning/wiki'}]
" autocmd FileType vimwiki :setlocal expandtab
" nmap <Leader>wl <Plug>VimwikiToggleListItem


" ===
" === Ultisnips
" ===
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" ===
" === AutoFormat
" ===
augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END

" ===
" === vim-fmt
" ===
" let g:shfmt_fmt_on_save = 1


" ===
" === vim-clang-format
" ===
" let g:clang_format#code_style = "google"
" let g:clang_format#code_style = "chromium"
" let g:clang_format#code_style = "mozilla"
" let g:clang_format#code_style = "llvm"
" let g:clang_format#style_options = {
						" \ "AccessModifierOffset" : -4,
						" \ "AllowShortIfStatementsOnASingleLine" : "true",
						" \ "AlwaysBreakTemplateDeclarations" : "true",
						" \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" autocmd FileType c ClangFormatAutoEnable


" ===
" === rust.vim
" ===
" let g:rustfmt_autosave = 1


" ===
" === Python-mode
" ===
let g:pymode_doc_bind = ''
let g:pymode_run_bind = ''

" ===
" === vim-lua-format
" ===
autocmd BufWrite *.lua call LuaFormat()


" ===
" === vim-easymotion
" ===
map , <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0 " Disable default mappings"
" <Leader>f{char} to move to {char}
map  ,f <Plug>(easymotion-bd-f)
nmap ,f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap ,, <Plug>(easymotion-overwin-f2)

" Move to line
map  ,L <Plug>(easymotion-bd-jk)
nmap ,L <Plug>(easymotion-overwin-line)

" Move to word
map  ,w <Plug>(easymotion-bd-w)
nmap ,w <Plug>(easymotion-overwin-w)


" ===
" === vim-gitgutter
" ===
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▎'
" let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_removed_above_and_below = '_¯'
" let g:gitgutter_sign_modified_removed = '▓'

" ===
" === lazygit.nvim
" ===
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif







" ===
" === Vim-calc
" ===
nnoremap ,a :call Calc()<CR>

" ===
" === vim-slime
" ===
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}



" ===
" === rainbow
" ===
"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1


" ===
" === nerdcommenter
" ===
" let g:NERDDefaultNesting = 0

" Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'python': { 'left': '#' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1


" map <Leader>cn <Plug>NERDCommenterToEOL('n', 'To_EOL')<CR>

" TODO:  <02-11-21, Joe Chen> "
" fix bug for Lua
function! JoeFixCommenter()
	if search("--[[ ")
		:%s/--\[\[\s/--\[\[/g
	endif
endfunction
autocmd BufWrite *.lua call JoeFixCommenter()

" ===
" === Coc
" ===

source ~/.config/nvim/coc.vim

" ===
" === Vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
" 	" has to be a function to avoid the extra space fzf#run insers otherwise
" 	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
" 			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
" 			\   'down': 20,
" 			\   'sink': function('<sid>read_template_into_buffer')
" 			\ })
" " noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad

" ===
" === Vim-translator
" ===

" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX

" let g:translator_proxy_url = 'socks5://127.0.0.1:7891'
let g:translator_default_engines = ['google']



" ===
" === Vim-go
" ===

"let g:go_def_mapping_enabled = 0
"let g:go_template_autocreate = 0
"let g:go_textobj_enabled = 0
"let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 0
"let g:go_highlight_array_whitespace_error = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_chan_whitespace_error = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_trailing_whitespace_error = 1
"let g:go_highlight_variable_assignments = 0
"let g:go_highlight_variable_declarations = 0
"let g:go_doc_keywordprg_enabled = 0


let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" 禁用K进入GoDoc
let g:go_doc_keywordprg_enabled = 0

" gopls
let g:go_template_autocreate = 0

autocmd FileType go :set autowrite
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>c :cclose<CR>
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap R  <Plug>(go-run)
"autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

