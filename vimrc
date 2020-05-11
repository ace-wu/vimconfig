
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim', {'name': 'neobundle'}
"NeoBundle 'Shougo/neobundle-vim-recipes', {'name': 'neobundle-recipes'}

NeoBundle 'tpope/vim-git', {'name': 'git-hl'}
NeoBundle 'tpope/vim-fugitive', {'name': 'git-fugitive'}
NeoBundle 'tpope/vim-repeat', {'name': 'repeat'}
NeoBundle 'tpope/vim-surround', {'name': 'surround'}

NeoBundle 'scrooloose/syntastic', {'name': 'syntastic'}
    map ,sy :SyntasticCheck<CR>
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_error_symbol = "x"
    let g:syntastic_warning_symbol = "!"
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
    let g:syntastic_javascript_checkers = ['closurecompiler', 'jshint']
    let g:syntastic_javascript_closurecompiler_script = '/usr/local/bin/closure-compiler'
    let g:syntastic_javascript_closurecompiler_args = '--language_in=ECMASCRIPT5'

NeoBundle 'godlygeek/tabular',       {'name': 'tabular'}
NeoBundle 'gabrielelana/vim-markdown', {'name': 'markdown'}
NeoBundle 'elzr/vim-json', {'name': 'json'}
    let g:vim_json_syntax_conceal = 0
NeoBundle 'autowitch/hive.vim', {'name': 'hive'}

NeoBundle 'vim-scripts/python.vim--Vasiliev',  {'name': 'python-hl'}
NeoBundle 'vim-scripts/py-coverage', {'name': 'python-coverage'}
NeoBundle 'tmhedberg/SimpylFold',    {'name': 'python-simple-fold'}

NeoBundle 'vim-scripts/cflow-output-colorful', {'name': 'cflow-hl'}
NeoBundle 'vim-scripts/LargeFile',   {'name': 'largefile'}
    let g:LargeFile=1
NeoBundle 'vim-scripts/taglist.vim', {'name': 'taglist'}

NeoBundle 'sukima/xmledit',          {'name': 'xmledit'}
NeoBundle 'majutsushi/tagbar',       {'name': 'tagbar'}
NeoBundle 'motus/pig.vim',           {'name': 'pig-hl'}
NeoBundle 'vim-ruby/vim-ruby',       {'name': 'ruby'}
NeoBundle 'chrisbra/Colorizer',      {'name': 'colorizer'}
    map ,co :ColorToggle<CR>
NeoBundle 'pangloss/vim-javascript', {'name': 'js'}
"    let g:javascript_conceal=1
"NeoBundle 'marijnh/tern_for_vim',    {'name': 'js-tern', 'build': 'npm install'}
"NeoBundle 'nanotech/jellybeans.vim', {'name': 'theme-jellybeans'}
NeoBundle 'airblade/vim-gitgutter',  {'name': 'gitgutter'}
    let g:gitgutter_sign_added = '+ '
    let g:gitgutter_sign_modified = '~ '
    let g:gitgutter_sign_removed = '_ '
    let g:gitgutter_sign_removed_first_line = '^ '
    let g:gitgutter_sign_modified_removed = '~_'
NeoBundle 'chikamichi/mediawiki.vim', {'name': 'mediawiki'}
NeoBundle 'chrisbra/vim-diff-enhanced', {}
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
NeoBundle 'tmux-plugins/vim-tmux',    {'name': 'tmux'}

NeoBundle 'ace-wu/nginx-vim-syntax',  {'name': 'nginx-hl'}
NeoBundle 'ace-wu/vim-distinguished', {'name': 'theme-distinguished'}
"NeoBundle 'ace-wu/vim-sml-coursera',  {'name': 'sml'}
"NeoBundle 'wlangstroth/vim-racket',  {'name': 'racket'}
"NeoBundle 'tikhomirov/vim-glsl', {'name': 'glsl'}

NeoBundle 'eapache/rainbow_parentheses.vim',    {'name': 'rainbow'}
    map ,ra :RainbowParenthesesToggle<CR> :RainbowParenthesesLoadRound<CR> :RainbowParenthesesLoadSquare<CR> :RainbowParenthesesLoadBraces<CR>
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

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif


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
    colorscheme distinguished
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
set ruler foldmethod=syntax "foldlevelstart=1
set backspace=2        " allow backspacing over everything in insert mode
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set history=500
set formatoptions+=mB  " see :h fo-table
set autochdir
set modeline modelines=5
set nowrap
set nobackup
"set backup backupdir=~/tmp,.,/var/tmp/vi,/tmp
if version >= 703
    set conceallevel=2
endif

if has("win32") || has("win64")
    set directory=.,C:\WINDOWS\Temp
endif

set tags=./tags;/

map ,sp :set spell spelllang=en_us<CR>
cmap w!! w !sudo tee > /dev/null %

if has("autocmd")
    filetype plugin indent on
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufRead,BufNewFile,BufEnter *.wsgi setlocal ft=python
    autocmd BufRead,BufNewFile,BufEnter *.pig  setlocal ft=pig
    autocmd BufRead,BufNewFile,BufEnter *.go   setlocal ft=go
    autocmd BufRead,BufNewFile,BufEnter *nginx*conf* setlocal ft=nginx
    "autocmd BufRead,BufNewFile,BufEnter *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal ft=ghmarkdown
    autocmd BufRead,BufNewFile,BufEnter *.hql,*.q   setlocal ft=hive

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

let mapleader=","

syntax on
