let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" filetype on           " Enable filetype detection
" filetype indent on    " Enable filetype-specific indenting
" filetype plugin on    " Enable filetype-specific plugins

call plug#begin('~/.vim/plugged')
" filetype plugin indent on
Plug 'jceb/vim-orgmode'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch' " SudoWrite
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'

Plug 'kassio/neoterm'
"
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'

Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'svermeulen/vim-easyclip'
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'

Plug 'mhinz/vim-sayonara'
Plug 'haya14busa/incsearch.vim'
Plug 'wellle/targets.vim'
Plug 'hynek/vim-python-pep8-indent'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'rust-lang/rust.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-go'

Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'

Plug 'shime/vim-livedown'
Plug 'pearofducks/ansible-vim'

Plug 'nelsyeung/twig.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" Plug 'mustache/vim-mustache-handlebars'

Plug 'vim-airline/vim-airline'
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" Plug 'lambdatoast/elm.vim'

" Plug 'machakann/vim-highlightedyank'

Plug 'LnL7/vim-nix'
Plug 'fatih/vim-go'

Plug 'juanpabloaj/vim-istanbul'

Plug 'vim-scripts/php-annotations-syntax'
Plug 'vim-php/vim-php-refactoring'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

Plug 'cespare/vim-toml'
Plug 'janko-m/vim-test'

call plug#end()
let g:neoterm_shell = "zsh"

let g:coverage_json_path = 'coverage/json/coverage-final.json'

let g:php_refactor_command='refactor.phar'

let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"

let g:deoplete#enable_at_startup = 1

let g:go_fmt_fail_silently = 1

function! s:neosnippet_complete()
"   if pumvisible()
"     return "\<CR>"
"   else
    if neosnippet#expandable_or_jumpable()
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<C-N>"
"   endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()

let g:neosnippet#enable_snipmate_compatibility = 1
" imap <expr><C-.> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-,>"
" imap <TAB> <C-N>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg -S --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap gv :execute "!git-view % " . line(".")<CR>

let g:enable_bold_font = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:neoterm_size = 13

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:jsx_ext_required = 0

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
let g:gitgutter_diff_args = '-w'


let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '^V' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '^S' : 'S',
      \ }

let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

nmap gm :LivedownToggle<CR>
map '' ysiw'

" inoremap <Tab> <C-n>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let test#strategy = "neovim"
map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>

let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1

" nmap     <C-F> <Plug>CtrlSFPrompt
nmap     <C-F> :Rg<space>

nmap ge :e <C-R>=expand("%:p:h") . "/" <CR>

let g:netrw_dirhistmax = 0

set background=dark

" syntax sync minlines=256
" set synmaxcol=256 " Syntax highlight max cols
" set mouse=
set so=999
set modeline
set modelines=4
set bs=2		" allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l
set nojoinspaces

set ignorecase
set smartcase
set completeopt-=preview " disable popup on top
set tabstop=4
set shiftwidth=4
set expandtab
set noautoindent
set showcmd
set nostartofline
set clipboard+=unnamedplus
set autowriteall
set grepprg=rg
set wildignore+=*.so,*.swp,*.zip,*/node_modules/*
set iskeyword-=.
set gdefault
set hidden
set undofile
set termguicolors
" set leader to ,
let mapleader=","
let g:mapleader=","
set fillchars+=vert:│

hi VertSplit ctermbg=NONE guibg=NONE
" hi ALEErrorSign ctermbg=NONE guibg=NONE ctermfg='169' guifg=169

hi! link ALEErrorSign GruvboxRedSign
hi! link ALEWarningSign GruvboxYellowSign

let g:gruvbox_sign_column = 'bg0'
" let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = 1

" set inccommand=nosplit

colorscheme gruvbox

let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 1

let g:ale_sign_error = '*'
let g:ale_sign_warning = '!'

" let g:neomake_elixir_mix_maker = {
"       \ 'exe': 'mix',
"       \ 'args': ['compile'],
"       \ 'errorformat':
"       \ '%E** %s %f:%l: %m,' .
"       \ '%W%f:%l: warning: %m'
"       \ }

" let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']
" au BufWritePost * Neomake

autocmd FileType javascript set formatprg=eslint-fix-stdin

au BufNewFile,BufRead *.ejs set filetype=html

au BufWritePre * :%s/\s\+$//e  " remove trailing whitespace
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FileType twig setl sw=2 ts=2 sts=2 et
au FileType jade setl sw=2 ts=2 sts=2 et
au FileType html setl sw=2 ts=2 sts=2 et
au FileType yaml setl sw=2 ts=2 sts=2 et
au FileType htmldjango setl sw=2 ts=2 sts=2 et
au FileType javascript setl sw=2 ts=2 sts=2 et
au BufNewFile,BufRead *.es6 setlocal ft=javascript
au BufNewFile,BufRead *.tag setlocal ft=javascript


""
"" Fugitive
""

nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gg :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Git status -sb<cr>

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>


" FZF stuff
let g:fzf_commits_log_options = '--oneline --color=always --format="%C(auto)%h%d %C(black)%C(bold)%an %C(auto)%s %C(black)%C(bold)%cr"'

imap <c-x><c-k> <plug>(fzf-complete-word)
nnoremap <c-p> :Files<cr>
nnoremap <c-o> :GFiles?<CR>
nnoremap <c-l> :Buffers<CR>
nnoremap <c-t> :History<CR>
nnoremap <c-g> :Commits<CR>


" search for word under cursor
nnoremap L :Rg <C-R><C-W><CR>
nnoremap <c-d> :Rg <C-R><C-W><CR>

map q gq
map q gq
map S s$
nnoremap Y y$
nnoremap M m$

imap <leader>; <C-R>=Semicolonfun()<CR>
fun! Semicolonfun()
  call setline(line('.'), substitute(getline('.'), '\s*$', ';', ''))
  return "\<End>"
endfunction

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

au BufEnter * set noro

map <leader>2 :set ts=2 sw=2<cr>
map <leader>4 :set ts=4 sw=4<cr>
map <leader>q :Sayonara<CR>
map <leader>w :w<CR>
nmap <silent> <leader>l :vsplit<CR>
nmap <leader>/ :nohl<CR>
noremap j gj
noremap k gk
cmap w!! :SudoWrite
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
nmap <leader>p :set paste!<BAR>set paste?<CR>
vnoremap < <gv
vnoremap > >gv

