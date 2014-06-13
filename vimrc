
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'

" ack.vim
Bundle 'mileszs/ack.vim'
" Ack for word under cursor
" http://vimbits.com/bits/19
nnoremap <leader>a *<C-o>:AckFromSearch!<CR>

" syntastic
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
"let g:syntastic_enable_balloons=1
let g:syntastic_enable_highlighting=1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby','python', 'sh'],
            \ 'passive_filetypes': ['puppet'] }
"let g:syntastic_python_checker_args='--ignore=E501,E121,E122,E123,E124,E125,E126,E127,E128'
"let g:syntastic_python_checkers = ['flake8', 'pyqver']
let g:syntastic_enabled_highlighting=1

Bundle 'scrooloose/nerdcommenter'

Bundle 'jeetsukumaran/vim-buffergator'
" toggle instead of open to match nerdtree and tabbar patters
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>
nnoremap <silent> <Leader>t :BuffergatorTabsToggle<CR>

Bundle 'bogado/file-line'
Bundle 'alikins/vim-fix-git-diff-path'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ajf/puppet-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'wgwoods/vim-scripts'
Bundle 'alikins/vim-buildr'
Bundle 'bling/vim-airline'

Bundle 'klen/python-mode'
" disable python folding
let g:pymode_folding = 0
let g:pymode_lint = 0

Bundle 'mattn/webapi-vim'
Bundle 'mmozuras/vim-github-comment'
let g:github_user = 'alikins'

Bundle 'junkblocker/patchreview-vim'
"Bundle 'Valloric/YouCompleteMe'

"Bundle 'ameade/qtpy-vim'

Bundle 'JarrodCTaylor/vim-python-test-runner'

"https://github.com/lamndalisure/nose.vom
"A simple compiler for using nosetests on VIM
Bundle 'lambdalisue/nose.vim'

"https://github.com/mattboehm/vim-unstack
"Vim plugin for parsing stack traces and opening the files
Bundle 'mattboehm/vim-unstack'

"https://github.com/alfredodeza/coveragepy.vim
Bundle 'alfredodeza/coveragepy.vim'

call vundle#end()

filetype plugin indent on

" Key for set/unset breakpoint
" \b conflicts with buffergator
let g:pymode_breakpoint_key = '<leader>B'

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

set backupdir=~/.vimtmp/_backup//    " where to put backup files.
set directory=~/.vimtmp/_temp//      " where to put swap files.

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

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

set laststatus=2  " always show the status bar

" Start the status line
"set statusline=%f\ %m\ %r
"set statusline+=Line:%l/%L[%p%%]
"set statusline+=Col:%v
"set statusline+=Buf:#%n
"set statusline+=[%b][0x%B]

if filereadable(expand("~/.vim/filetypes.vim"))
  source ~/.vim/filetypes.vim
endif
