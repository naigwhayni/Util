let mapleader=" "

filetype on
filetype indent on
filetype plugin indent on
filetype plugin on
syntax on

set encoding=utf-8
set autochdir
set backspace=1 " more powerful backspacing
set cursorline
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set nocompatible
set number
set relativenumber
set ruler
set showcmd
set smartcase
set smartindent
set autoindent
set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2
set textwidth=72
set wildmenu
"set wildmode=longest:list,full
set wrap
set wrapmargin=2
set showmatch
set spell spelllang=en_us
set autoread
set listchars=tab:^I,trail:.,eol:$
set scrolloff=5
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/.undo
set updatetime=100

" Set cursor shape and color
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[5 q" . "\<Esc>]12;blue\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif


autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup
autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

exec "nohlsearch"

if exists('$VIM_TERMINAL')
  echoerr 'Do not run Vim inside a Vim terminal'
  quit
endif



call plug#begin('~/.vim/plugged')

" File navigation
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'dyng/ctrlsf.vim'

" Movement
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'

" Formating
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =

" ALE
Plug 'dense-analysis/ale'

" Undo Tree
Plug 'mbbill/undotree'

" other visual enhancement
Plug 'itchyny/vim-cursorword'
Plug 'terryma/vim-expand-region'

" git
Plug 'rhysd/conflict-marker.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML, CSS, JavaScript, JSON, etc.
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'

call plug#end()


"color evening
color snazzy

map R :source $MYVIMRC<CR>
map Q :q<CR>
map S :w<CR>
map s <nop>
map <Esc>k <C-w>k
map <Esc>j <C-w>j
map <Esc>h <C-w>h
map <Esc>l <C-w>l

map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical res-5<CR>
map <right> :vertical res+5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map tb :+tabnext<CR>

map sh <C-w>t<C-w>H
map sv <C-w>t<C-w>K

tnoremap <Esc><Esc>  <C-\><C-N>
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
noremap J 20jzz
noremap K 20kzz

" a key: go to the start of the line
noremap <C-a> 0
" e key: go to the end of the line
noremap <C-e> $

autocmd FileType markdown inoremap ,f <esc>/<++><cr>:nohlsearch<cr>c4l
autocmd FileType markdown inoremap ,n ---<enter><enter>
autocmd FileType markdown inoremap ,b **** <++><esc>f*hi
autocmd FileType markdown inoremap ,s ~~~~ <++><esc>f~hi
autocmd FileType markdown inoremap ,i ** <++><esc>f*i
autocmd FileType markdown inoremap ,d `` <++><esc>f`i
autocmd FileType markdown inoremap ,c ```<enter><enter>```<enter><enter><++><esc>4ka
autocmd FileType markdown inoremap ,h ====<space><++><esc>f=hi
autocmd FileType markdown inoremap ,p ![](<++>) <++><esc>f[a
autocmd FileType markdown inoremap ,a [](<++>) <++><esc>f[a
autocmd FileType markdown inoremap ,1 #<space><enter><++><esc>ka
autocmd FileType markdown inoremap ,2 ##<space><enter><++><esc>ka
autocmd FileType markdown inoremap ,3 ###<space><enter><++><esc>ka
autocmd FileType markdown inoremap ,4 ####<space><enter><++><esc>ka
autocmd FileType markdown inoremap ,5 #####<space><enter><++><esc>ka
autocmd FileType markdown inoremap ,l --------<enter>
autocmd FileType markdown noremap  ,p :MarkdownPreview<cr>

" ===
" === nerdtree
" ===
map ff :NERDTreeToggle<CR>
noremap fg :exec("NERDTree ".expand('%:h'))<CR>

let NERDTreeMapOpenExpl      = ""
let NERDTreeMapUpdir         = ""
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit     = ""
let NERDTreeOpenVSplit       = ""
let NERDTreeMapActivateNode  = ""
let NERDTreeMapOpenInTab     = "o"
let NERDTreeMapPreview       = ""
let NERDTreeMapCloseDir      = "n"
let NERDTreeMapChangeRoot    = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"===
"=== tabular
"===

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

"===
"=== vim-gutter
"===

highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 1

" ===
" === ale
" ===

let g:ale_fixers             = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save        = 1
"let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error         = '>>'
let g:ale_sign_warning       = '--'

nnoremap <leader>l :ALEFix<CR>
nnoremap <leader>- :ALEPrevious<CR>
nnoremap <leader>= :ALENext<CR>




" ===
" === Vimwiki
" ===
let g:vimwiki_list         = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let Tlist_Use_Right_Window = 1
let skip_defaults_vim      = 1

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start         = 0
let g:mkdp_auto_close         = 1
let g:mkdp_refresh_slow       = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world  = 0
let g:mkdp_open_ip            = ''
let g:mkdp_browser            = 'arc'
let g:mkdp_echo_preview_url   = 0
let g:mkdp_browserfunc        = ''
let g:mkdp_preview_options    = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css       = ''
let g:mkdp_highlight_css      = ''
let g:mkdp_port               = ''
let g:mkdp_page_title         = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
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


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" ===
" === vim-javascript
" ===

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" ===
" === vim-sneak
" ===
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" ===
" === ctrlp-funky
" ===
nnoremap <leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
