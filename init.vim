
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

set nocompatible
let mapleader=","

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif

call plug#begin('~/.vim/plugged')

let g:coc_global_extensions = [
\ 'coc-tabnine',
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-vimlsp',
\ 'coc-html',
\ 'coc-css',
\ ]

if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() } }
else
    Plug 'codota/tabnine-vim', {'as': 'tabnine', 'for': ['python', 'javascript', 'typescript', 'go', 'rust', 'php', 'cpp', 'haskell', 'sh', 'bash', 'zsh']}
endif

Plug 'tpope/vim-repeat', {'as': 'vim-repeat'}
Plug 'tpope/vim-surround', {'as': 'vim-surround'}
Plug 'junegunn/vim-emoji', {'as': 'vim-emoji'}
Plug 'godlygeek/tabular', {'as': 'vim-tabular'}
    map <leader>== :Tab /=<CR>
Plug 'vim-scripts/LargeFile', {'as': 'vim-largefile'}
    let g:LargeFile=1
Plug 'chrisbra/vim-diff-enhanced', {'as': 'vim-diff-enhanced'}
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'


Plug 'scrooloose/syntastic', {'as': 'syntastic', 'for': ['python', 'yaml', 'json', 'javascript']}
    map <leader>sy :SyntasticCheck<CR>
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_error_symbol = 'x'
    let g:syntastic_warning_symbol = '!'
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
    let g:syntastic_yaml_checkers = ['yamllint']
    let g:syntastic_python_checkers = ['mypy', 'pylint', 'flake8']
    let g:syntastic_javascript_checkers = ['closurecompiler', 'jshint']
    let g:syntastic_javascript_closurecompiler_script = '/usr/local/bin/closure-compiler'
    let g:syntastic_javascript_closurecompiler_args = '--language_in=ECMASCRIPT5'

Plug 'ntpeters/vim-better-whitespace', {'as': 'vim-whitespace'}
    let g:strip_whitespace_on_save = 1
    let g:strip_whitespace_confirm = 1
    let g:show_spaces_that_precede_tabs=1

"Plug 'vim-scripts/cflow-output-colorful', {'as': 'cflow-hl'}
"Plug 'majutsushi/tagbar', {'as': 'vim-tagbar'}
"Plug 'vim-scripts/taglist.vim', {'as': 'vim-taglist'}

Plug 'tpope/vim-git', {'as': 'git-hl'}
Plug 'tpope/vim-fugitive', {'as': 'git-fugitive'}
Plug 'airblade/vim-gitgutter', {'as': 'git-gitgutter'}
    let g:gitgutter_sign_added = '+ '
    let g:gitgutter_sign_modified = '> '
    let g:gitgutter_sign_removed = '_ '
    let g:gitgutter_sign_removed_first_line = '^ '
    let g:gitgutter_sign_modified_removed = '>_'
    map <leader>gg :GitGutterToggle<CR>

Plug 'mgedmin/coverage-highlight.vim', {'as': 'coverage-hl', 'for': 'python'}
    map <leader>cov :ToggleCoverage<CR>
Plug 'tmhedberg/SimpylFold', {'as': 'python-simple-fold', 'for': 'python'}

Plug 'vim-ruby/vim-ruby', {'as': 'ruby-hl', 'for': 'ruby'}

Plug 'pangloss/vim-javascript', {'as': 'js-hl', 'for': 'javascript'}
"    let g:javascript_conceal=1
"Plug 'marijnh/tern_for_vim', {'as': 'js-tern', 'build': 'npm install'}
Plug 'elzr/vim-json', {'as': 'json-hl', 'for': 'json'}
    let g:vim_json_syntax_conceal = 0

Plug 'sukima/xmledit', {'as': 'xml-edit', 'for': ['html', 'xml']}

"Plug 'autowitch/hive.vim', {'as': 'hive-hl'}
"Plug 'motus/pig.vim', {'as': 'pig-hl', 'for': 'pig'}

Plug 'gabrielelana/vim-markdown', {'as': 'markdown-hl', 'for': 'markdown'}
Plug 'pedrohdz/vim-yaml-folds', {'as': 'yaml-fold', 'for': ['yaml', 'cloudformation']}
Plug 'NLKNguyen/cloudformation-syntax.vim', {'as': 'cloudformation-hl', 'for': ['yaml', 'cloudformation']}
Plug 'hashivim/vim-terraform', {'as': 'terraform'}

Plug 'tmux-plugins/vim-tmux', {'as': 'tmux-hl', 'for': 'tmux'}
Plug 'ace-wu/nginx-vim-syntax', {'as': 'nginx-hl', 'for': 'nginx'}
"Plug 'editorconfig/editorconfig-vim', {'as': 'editorconfig-hl'}

"Plug 'ace-wu/vim-sml-coursera', {'as': 'sml-hl'}
"Plug 'wlangstroth/vim-racket', {'as': 'racket-hl'}

"Plug 'tikhomirov/vim-glsl', {'as': 'glsl-hl'}
"Plug 'chikamichi/mediawiki.vim', {'as': 'mediawiki-hl'}

Plug 'chrisbra/Colorizer', {'as': 'colorizer', 'on': 'ColorToggle'}
    map <leader>col :ColorToggle<CR>
Plug 'eapache/rainbow_parentheses.vim', {'as': 'rainbow-hl', 'on': 'RainbowParenthesesToggle'}
    map <leader>ra :RainbowParenthesesToggle<CR> :RainbowParenthesesLoadRound<CR> :RainbowParenthesesLoadSquare<CR> :RainbowParenthesesLoadBraces<CR>
    let g:rbpt_max = 15
    let g:rbpt_colorpairs = [
        \ [196, 'RoyalBlue3'],
        \ [166, 'SeaGreen3'],
        \ [178, 'DarkOrchid3'],
        \ [106, 'firebrick3'],
        \ [ 34, 'RoyalBlue3'],
        \ [ 30, 'SeaGreen3'],
        \ [ 27, 'DarkOrchid3'],
        \ [ 57, 'firebrick3'],
        \ [ 92, 'RoyalBlue3'],
        \ [128, 'DarkOrchid3'],
        \ [171, 'firebrick3'],
        \ [219, 'RoyalBlue3'],
        \ [253, 'SeaGreen3'],
        \ [210, 'DarkOrchid3'],
        \ [198, 'firebrick3'],
        \ ]

Plug 'ace-wu/vim-distinguished', {'as': 'theme-distinguished'}
"Plug 'nanotech/jellybeans.vim', {'as': 'theme-jellybeans'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


if has('nvim')
    if $CONDA_PREFIX == ""
        let s:current_python_path=$CONDA_PYTHON_EXE
    else
        let s:current_python_path=$CONDA_PREFIX.'/bin/python'
    endif
    call coc#config('python', {'pythonPath': s:current_python_path})
endif


filetype plugin indent on


" UI settings
if has("gui_running")
    colorscheme desert
    if has("win32") || has("win64")
        set guifont=Consolas:h12,Fixedsys:h12,Lucida_Console:h12
        "set guifontwide=MingLiU:h14     "細明
        set guifontwide=NSimSun:h14     "新宋
        "set guifontwide=FangSong:h15    "仿宋
        "set guifontwide=DFKai\-SB:h15   "標楷
        " https://github.com/topman/blog/blob/master/2011/apr/set_gvim_font.rst
    elseif has("gui_macvim")
        set guifont=Monaco:h15,Consolas:h16
    elseif has("unix")
        behave mswin
        set guifont=DejaVu\ Sans\ Mono\ 12
    endif
    set guioptions+=b   " Enable horizontal scroll bar
else
    set t_Co=256
    silent! colorscheme distinguished
    "highlight clear SignColumn
endif

" encoding settings
if has("multi_byte")
    if has("win32") || has("win64")
        language messages zh_TW.UTF-8
        set fileencodings=ucs-bom,utf-bom,utf-8,cp950,sjis,euc-jp,gbk,utf-16le,iso8859-1
        set termencoding=utf-8
        set encoding=utf-8
    else
        language zh_TW.UTF-8
        set fileencodings=ucs-bom,utf-bom,utf-8,big5,sjis,prc,latin1
        set termencoding=utf-8
        set encoding=utf-8
    endif
    set listchars=tab:▸\ ,eol:¬
endif

set nocompatible
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set incsearch hlsearch ignorecase
set autoindent smartindent
set ruler nofoldenable foldmethod=syntax "foldlevelstart=1
set backspace=2        " allow backspacing over everything in insert mode
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set history=500
set formatoptions+=mB  " see :h fo-table
set autochdir
set modeline modelines=5
set nowrap
set nobackup
set completeopt-=preview  " disable scratch preview window
set hidden
"set backup backupdir=~/tmp,.,/var/tmp/vi,/tmp
if version >= 703
    set conceallevel=2
endif

if has("win32") || has("win64")
    set directory=.,C:\WINDOWS\Temp
endif

set tags=./tags;/

" disable "ex" mode
map Q <Nop>
" close preview window
map <leader>pc :pclose<CR>
map <leader>sp :set spell! spelllang=en_us<CR>
map <leader>jq :%!jq .<CR>
map <leader>jc :%!jq -c .<CR>
map <leader>js :%!jq -S .<CR>
map <leader>be :%!base64<CR>
map <leader>bd :%!base64 -d<CR>
map <leader>wp :w\|!python %<CR>
cmap w!! w !sudo tee > /dev/null %
nnoremap <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

if has("autocmd")
    filetype plugin indent on
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufRead,BufNewFile,BufEnter *.wsgi setlocal ft=python
    "autocmd BufRead,BufNewFile,BufEnter *.go   setlocal ft=go
    autocmd BufRead,BufNewFile,BufEnter *nginx*conf* setlocal ft=nginx
    autocmd BufRead,BufNewFile,BufEnter *cloudformation/*.yaml setlocal ft=cloudformation

    autocmd BufRead,BufNewFile,BufEnter *.json.tpl setlocal ft=json
    autocmd BufRead,BufNewFile,BufEnter *.yaml.tpl,*.yml.tpl setlocal ft=yaml
    "autocmd BufRead,BufNewFile,BufEnter *.pig  setlocal ft=pig
    "autocmd BufRead,BufNewFile,BufEnter *.hql,*.q   setlocal ft=hive

    " file system navigation
    autocmd BufRead,BufNewFile,BufEnter * nmap g. :e %:p:h<CR>
    autocmd FileType netrw       nmap g. -

    autocmd FileType c,cpp       setlocal cindent
    autocmd FileType haskell     setlocal ts=3 sts=3 sw=3 noic fdm=marker
    autocmd FileType ruby,eruby  setlocal ts=2 sts=2 sw=2
    autocmd FileType ruby,eruby  let ruby_fold=1
    autocmd FileType python      setlocal ts=4 sts=4 sw=4
    autocmd FileType python      let python_highlight_all=1
    autocmd FileType perl        setlocal ts=4 sts=4 sw=4
    autocmd FileType perl        let perl_fold=1
    autocmd FileType vim         setlocal ts=4 sts=4 sw=4
    autocmd FileType vim         let vimsyn_folding='af'
    autocmd FileType muttrc      setlocal ts=2 sts=2 sw=2
    autocmd FileType yaml        setlocal ts=2 sts=2 sw=2
    autocmd FileType make        setlocal list noet
    autocmd FileType changelog   setlocal list et

    autocmd FileType sql         setlocal ts=2 sts=2 sw=2
    autocmd FileType hive        setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript  setlocal ts=2 sts=2 sw=2 | let javaScript_fold=1
    autocmd FileType json        setlocal ts=2 sts=2 sw=2
    autocmd FileType css         setlocal ts=2 sts=2 sw=2
    autocmd FileType html,xml    setlocal ts=2 sts=2 sw=2
    autocmd FileType html,xml    imap </ </<C-X><C-O>
    autocmd FileType html,xml    imap <! <!--  --><esc>hhhi
    autocmd FileType xml         let xml_syntax_folding=1
    autocmd FileType html        let g:html_indent_inctags = "html,body,head,tbody"

    autocmd FileType php         let php_folding=1
    "autocmd FileType r           let r_syntax_folding=1
    "autocmd FileType sh          let sh_fold_enabled=1

    "autocmd BufWritePost *.c,*.cpp,*.h,*.py silent! !ctags -R &>/dev/null &
endif
