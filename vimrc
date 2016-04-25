
"
" h/l left/right j/k updown
" b back word, w forward word
" <Leader>rt  tagbar
" command mode
" ctrl-w <arrow> move to window
" ctrl-h/j/k/l move to window
" ctrl-w_ max/zoom this window
" ctrl-w ctrl-o make current window only window on screen
" :hide   hide current window
" :ls show all buffers
" ctrl-w cltr-w  cycle windows
" :reg to show cut things
" "<number>p to paste that cut
" v visual mode, y to yank, p to paste, d to delete
" and mostly working ctrl-c/x/v
" c-c g  goto def in python (repo)
" ctrl-]  find tag, including in help
" <leader>a ack for word under cursor
" <leader>s s/// for word under cursor
" macro
"    qq  start recording macro and store in register 'a'
"    q to stop
"    @q to play it back
"    @@ to repeat it
"
" \/ nerd comment toggle

set nocompatible
filetype off

"set verbosefile=~/.vim/log/verbose.log
"set verbose=3

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Plugin 'gmarik/vundle.vim'

" ack.vim
Plugin 'mileszs/ack.vim'
" Ack for word under cursor
" http://vimbits.com/bits/19
nnoremap <leader>a *<C-o>:AckFromSearch!<CR>
let g:ack_default_options = " -H --nocolor --nogroup --column"
" 'q' in quickfix window closes it
" Note that <f6> and <f7> map to cnext/cprev, aka next/prev quickfix items
" TODO: add global keymap to do it



" syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
"let g:syntastic_enable_balloons=1
let g:syntastic_enable_highlighting=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby','python', 'sh', 'puppet'],
                           \ 'passive_filetypes': [] }

let g:syntastic_python_checker_args='--ignore=E501,E121,E122,E123,E124,E125,E126,E127,E128'
"let g:syntastic_python_checkers = ['flake8', 'pylint', 'pyqver']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_enabled_highlighting=1

let g:syntastic_java_checkstyle_classpath = 'checkstyle-5.7-all.jar'
"let g:syntastic_java_javac_autoload_maven_classpath=0
"let g:syntastic_java_javac_config_file_enabled=0
let g:syntastic_java_checkers = ['javac', 'checkstyle']
let g:syntastic_java_checkstyle_conf_file='/home/adrian/.checkstyle'
let g:syntastic_java_javac_custom_classpath_command = "buildr -s syntastic:echo"

"let g:syntastic_puppet_puppetlint
Plugin 'scrooloose/nerdcommenter'


Plugin 'bogado/file-line'
Plugin 'alikins/vim-fix-git-diff-path'
Plugin 'airblade/vim-rooter'
Plugin 'tpope/vim-git'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'ajf/puppet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'wgwoods/vim-scripts', {'name': 'vim-wgwoods-fedora'}
Plugin 'alikins/vim-buildr'
Plugin 'bling/vim-airline'

Plugin 'klen/python-mode'
" disable python folding
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0
" Key for set/unset breakpoint
" \b conflicts with buffergator
let g:pymode_breakpoint_bind = '<leader>B'

" too slow
let g:pymode_rope_regenerate_on_write = 0

Plugin 'jeetsukumaran/vim-buffergator'

" toggle instead of open to match nerdtree and tabbar patters
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>
nnoremap <silent> <Leader>t :BuffergatorTabsToggle<CR>

Plugin 'kien/ctrlp.vim'
"let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = 'CtrlPMixed'
" open ctrl-P in dir of current file
let g:ctrlp_working_path_mode = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
"let g:ctrlp_clear_cache_on_exit = 0
" which ctrl-p extensions to use
"let g:ctrlp_extensions = ['buffertag', 'quickfix', 'dir', 'rtscript',
"                         \ 'undo', 'line', 'changes', 'cmdline', 'menu',
"                         \ 'bookmarkdir']


"https://github.com/milkypostman/vim-togglelist
" allows <leader>q to toggle quickfix (ack, etc)
Plugin 'milkypostman/vim-togglelist'

"https://github.com/majutsushi/tagbar
Plugin 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_puppet = {
    \ 'ctagstype' : 'puppet',
    \ 'kinds' : [
    \ 'd:defination'
    \   ],
    \ 'sort' : 1,
    \ }

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<s-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"https://github.com/robbles/logstash.vim
" syntax highlighting for logstash.conf
Plugin 'robbles/logstash.vim'

" https://github.com/Peeja/vim-cdo
" http://vimcasts.org/episodes/project-wide-find-and-replace/
Plugin 'Peeja/vim-cdo'

" http://usevim.com/2014/10/20/incsearch/
"httpa://github.com/haya14busa/incsearch.vim
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" fugitive, mostly for http://vi.stackexchange.com/a/3748
Plugin 'tpope/vim-fugitive'

Plugin 'chase/vim-ansible-yaml'

"
" Auditions
"   Various plugins I'm trying out but don't use much.
"
" under review
Plugin 'mattn/webapi-vim'
Plugin 'mmozuras/vim-github-comment'
let g:github_user = 'alikins'

"https://github.com/tpope/vim-haystack
Plugin 'tpope/vim-haystack'

"https://github.com/PeterRincker/vim-bumblebee
Plugin 'PeterRincker/vim-bumblebee'

Plugin 'junkblocker/patchreview-vim'
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'ameade/qtpy-vim'

Plugin 'JarrodCTaylor/vim-python-test-runner'

"https://github.com/lamndalisure/nose.vom
"A simple compiler for using nosetests on VIM
Plugin 'lambdalisue/nose.vim'

"https://github.com/mattboehm/vim-unstack
"Vim plugin for parsing stack traces and opening the files
Plugin 'mattboehm/vim-unstack'

"https://github.com/alfredodeza/coveragepy.vim
Plugin 'alfredodeza/coveragepy.vim'

" puppet git@github.com:rodjek/vim-puppet.git
Plugin 'rodjek/vim-puppet'


" color schems
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'



call vundle#end()

filetype plugin indent on

" Key for set/unset breakpoint
" \b conflicts with buffergator
let g:pymode_breakpoint_bind = '<leader>B'
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" unstack uses <Leader>s, undo that and use \st
let g:unstack_mapkey = '<Leader>st'

set nonumber
set autoindent
set tabstop=4
set shiftwidth=4
set encoding=utf-8

syntax enable

set noswapfile
set smartcase

"set listchars=""
set history=1000

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set mouse=a

"  you can change buffers without saving
set hidden

" http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'
" http://spf13.com/post/perfect-vimrc-vim-config-file/
" Turn off lots of annoying messages including "hit enter
" to continue" on quickfix
set shortmess+=filmnrxoOtT

" http://spf13.com/post/perfect-vimrc-vim-config-file/
set backspace=indent,eol,start  " backspace for dummys

" make backspace/space/<left>/<right> do the right thing
" across line boundarys
set whichwrap=b,s,<,>

" find as you type search
set incsearch
set scrolloff=2
set tabstop=4
set shiftwidth=4
set expandtab
set list
set backspace=indent,eol,start

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" various backup and temp dirs
set backupdir=~/.vim/state/backup//    " where to put backup files.
set directory=~/.vim/state/tmp//      " where to put swap files.
set undodir=~/.vim/state/undo//         " where to put undo files


" gah, folding stop stop stop
set nofoldenable

colorscheme molokai

highlight! link DiffText MatchParen
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" search and replace word under cursor
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" via http://hackr.se/vim/vimrc/
" F6/F7 for next/prev errors in quickfix
map <F6> :cnext <CR>
imap <F6> <ESC>:cnext <CR>i
map <F7> :cprev <CR>
imap <F7> <ESC>:cprev <CR>i

" indent, but keep visual mode
" http://vim.wikia.com/wiki/Shifting_blocks_visually
vnoremap > >gv
vnoremap < <gv

" cough, emacs, cough
" begin/end of line
map <C-a> <Home>
map <C-e> <End>

"readline/bash style home/end for command mode as well
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

set laststatus=2  " always show the status bar

highlight nonascii guibg=Red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"
" Start the status line
"set statusline=%f\ %m\ %r
"set statusline+=Line:%l/%L[%p%%]
"set statusline+=Col:%v
"set statusline+=Buf:#%n
"set statusline+=[%b][0x%B]

if filereadable(expand("~/.vim/filetypes.vim"))
  source ~/.vim/filetypes.vim
endif
