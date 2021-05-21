
"
" h/l left/right j/k updown
" b back word, w forward word
" <Leader>rt  tagbar
" ctrl-w <arrow> move to window
" ctrl-h/j/k/l move to window
" ctrl-w_ max/zoom this window
" ctrl-w ctrl-o make current window only window on screen
" ctrl-w cltr-w  cycle windows
" command mode
" :hide   hide current window
" :ls show all buffers
"
" cut/past/yank/put/select/etc
" :reg to show cut things
" "<number>p to paste that cut
" v visual mode, y to yank, p to paste, d to delete
" ggVG , select whole buffer (select all)
" "y+,  yank to system clipboard ([shift] ctrl-v to paste)
" "y*   yank to system selection (middle click to paste)
" "+p  paste from system clipboard  (current mouse select)
" "*p paste from system selection
" and mostly working ctrl-c/x/v
"
" movement etc
" c-c g  goto def in python (repo)
" ctrl-]  find tag, including in help
"
" custom leader actions
" <leader>a ack for word under cursor
" <leader>s s/// for to replace word under cursor
"
" visual
" (visual select) '>' and '<' to move selection default amount l or r
"
" macro
"    qq  start recording macro and store in register 'a'
"    q to stop
"    @q to play it back
"    @@ to repeat it
"
" vim-commentary comment
" gcc  - [un]comment a line
" gc   - [un]comment visual
" gcap - [un]comment paragraph
"
" To list filetype detection
" :autocmd filetypedetect
"
" Note that <f6> and <f7> map to cnext/cprev, aka next/prev quickfix items
" To save a 'session'
" :mksession /path/to/session.vim
"
" To restore:
"    vim -S /path/to/session.vim
" or from already open vim
" :source /path/to/session.vim
"
" # show the current value of a setting
" :set some_setting?
" # set a setting to a value
" :set some_setting value
"# show the current value of a variable
" :let var_name
" # show all vars
" :let
" # show all buffer local
" :let b:
" # set/let a variable to a value
" :let variable_name = value
" # buffer scope
" :let g:variable_name = value
" When an error message is displayed, but it is removed before you could read
" it, you can see it again with: >
"   :echo errmsg
" Or view a list of recent messages with: >
"   :messages

set nocompatible
filetype off

"set verbosefile=~/.vim/log/verbose.log
"set verbose=1

let mapleader='\'

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" " required!
Plugin 'VundleVim/Vundle.vim'

" ack.vim
Plugin 'mileszs/ack.vim'
" Ack for word under cursor
" http://vimbits.com/bits/19
nnoremap <leader>a *<C-o>:AckFromSearch!<CR>
" ag-sort is just shell wrapper for ag | sort.
" Sorting is slower, but more useful overall
let g:ackprg = "ag-sort --vimgrep"
" let g:ack_default_options = " -H --nocolor --nogroup --column"
" 'q' in quickfix window closes it
" Note that <f6> and <f7> map to cnext/cprev, aka next/prev quickfix items
" TODO: add global keymap to do it

" maybe replace vim-ack?
" https://github.com/mhinz/vim-grepper
Plugin 'mhinz/vim-grepper'
"nnoremap <leader>a :Grepper -tool ag -cword -noprompt<cr>
nmap gs <plug>(GrepperOperator)
" let g:grepper.ag = 'ag --vimgrep --path-to-ignore ./.ignore'
" command! ack :Grepper -tool git -query %<cr>
" cmap ack Grepper - %


Plugin 'bogado/file-line'
Plugin 'alikins/vim-fix-git-diff-path'
Plugin 'airblade/vim-rooter'
Plugin 'tpope/vim-git'

"Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'wgwoods/vim-scripts', {'name': 'vim-wgwoods-fedora'}
Plugin 'alikins/vim-buildr'
Plugin 'bling/vim-airline'

"" formerly Plugin 'klen/python-mode'
Plugin 'python-mode/python-mode'
"" disable python folding
let g:pymode_options = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0
"" Key for set/unset breakpoint
"" \b conflicts with buffergator
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_trim_whitespaces = 0
"" too slow
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_syntax = 1
let g:pymode_indent = 1
let g:pymode_virtualenv = 1
" let g:pymode_virtualenv_path = $VIRTUAL_ENV

Plugin 'jeetsukumaran/vim-buffergator'
" toggle instead of open to match nerdtree and tabbar patters
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>
nnoremap <silent> <Leader>t :BuffergatorTabsToggle<CR>
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_sort_regime = "filepath"

"Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = 'CtrlPMixed'
" open ctrl-P in dir of current file
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_buftag_types = {
  \ 'yaml'     : '--languages=ansible --ansible-types=k',
  \ }
"let g:ctrlp_clear_cache_on_exit = 0
" which ctrl-p extensions to use
"let g:ctrlp_extensions = ['buffertag', 'quickfix', 'dir', 'rtscript',
"                         \ 'undo', 'line', 'changes', 'cmdline', 'menu',
"                         \ 'bookmarkdir']


"https://github.com/milkypostman/vim-togglelist
" allows <leader>q to toggle quickfix (ack, etc)
Plugin 'milkypostman/vim-togglelist'

" http://usevim.com/2014/10/20/incsearch/
" https://github.com/haya14busa/incsearch.vim
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" https://github.com/Peeja/vim-cdo
" http://vimcasts.org/episodes/project-wide-find-and-replace/
"Plugin 'Peeja/vim-cdo'

" https://github.com/pearofducks/ansible-vim
Plugin 'pearofducks/ansible-vim'

"https://github.com/PeterRincker/vim-bumblebee
Plugin 'PeterRincker/vim-bumblebee'

"https://github.com/tpope/vim-haystack
"Plugin 'tpope/vim-haystack'

" Show a vert line between indent blocks
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '┆'
" To toggle: ':IndentLinesToggle'

" https://github.com/thirtythreeforty/lessspace.vim
" clenaup whitespace on exit, but only on lines we've changed
Plugin 'thirtythreeforty/lessspace.vim'

"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_min_num_of_chars_for_completion = 99

Plugin 'majutsushi/tagbar'
nnoremap <silent> <Leader>rt :TagbarToggle<CR>
let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }

"https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

"\   'python': ['flake8', 'pylint'],
" https://github.com/w0rp/ale
Plugin 'w0rp/ale'
" let g:ale_python_pylint_options = '--rcfile=~/.pylint-ansiblerc'
let g:ale_python_pylint_options = '--load-plugins pylint_django --django-settings-module=galaxy_ng.app.alikins'
let g:ale_python_pylint_use_global = 0
let g:ale_python_pylint_change_directory = 1

"let g:ale_python_flake8_executable = 'flake8a'
let g:ale_echo_msg_format = '%linter%:%severity%:%s'
"let g:ale_python_flake8_executable = 'flake8b'
"let g:ale_python_flake8_args = '--max-line-length=160 --config=~/.tox.ini.flake8'
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}
" let g:ale_virtualenv_dir_names = ['venvs', '.env', '.venv', 'env', 've-py3', 've', 'virtualenv', 'venv']
" maybe need this enabled
" let g:ale_python_flake8_executable = '/home/adrian/.local/bin/flake8'
let g:ale_python_flake8_use_global = 0
let g:ale_python_flake8_change_directory = 0
" g:ale_use_global_executables

" let g:ale_yaml_yamllint_options = '-d relaxed'
" https://github.com/saltstack/salt-vim
Plugin 'saltstack/salt-vim'

" https://github.com/stephpy/vim-yaml
Plugin 'stephpy/vim-yaml'

" https://github.com/davidhalter/jedi-vim
"Plugin 'davidhalter/jedi-vim'
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#show_call_signatures = 0

"https://github.com/junegunn/fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" https://github.com/tpope/vim-commentary
" Plugin 'timpope/vim-commentary'
Plugin 'git@github.com:tpope/vim-commentary.git'

" https://github.com/leafgarland/typescript-vim
Plugin 'leafgarland/typescript-vim'

" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" https://github.com/tpope/vim-repeat
Plugin 'tpope/vim-repeat'

" https://github.com/kana/vim-textobj-user
" Plugin 'kana/vim-textobj-user'

" https://vimawesome.com/plugin/vim-textobj-quote
" https://github.com/reedes/vim-textobj-quote
" Plugin 'reedes/vim-textobj-quote'
" map <silent> <leader>qc <Plug>ReplaceWithCurly
" map <silent> <leader>qs <Plug>ReplaceWithStraight

" https://github.com/raimon49/requirements.txt.vim
Plugin 'raimon49/requirements.txt.vim'
"
" color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

"
" Auditions
"   Various plugins I'm trying out but don't use much.
"
" under review

"Plugin 'mattn/webapi-vim'

"Plugin 'mmozuras/vim-github-comment'
"let g:github_user = 'alikins'

"https://github.com/tpope/vim-haystack
"Plugin 'tpope/vim-haystack'

"https://github.com/PeterRincker/vim-bumblebee
"Plugin 'PeterRincker/vim-bumblebee'

"Plugin 'junkblocker/patchreview-vim'
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'ameade/qtpy-vim'

"Plugin 'JarrodCTaylor/vim-python-test-runner'

"https://github.com/lamndalisure/nose.vom
"A simple compiler for using nosetests on VIM
"Plugin 'lambdalisue/nose.vim'

"https://github.com/mattboehm/vim-unstack
"Vim plugin for parsing stack traces and opening the files
"Plugin 'mattboehm/vim-unstack'

"https://github.com/alfredodeza/coveragepy.vim
"Plugin 'alfredodeza/coveragepy.vim'

"Plugin 'scrooloose/nerdcommenter'
"let NERDDefaultAlign = 'start'

call vundle#end()

filetype plugin indent on

nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" unstack uses <Leader>s, undo that and use \st
let g:unstack_mapkey = '<Leader>st'

set nonumber
set autoindent
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set expandtab
set noswapfile
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

syntax enable

" http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'
" http://spf13.com/post/perfect-vimrc-vim-config-file/
" Turn off lots of annoying messages including "hit enter
" to continue" on quickfix
set shortmess+=AcfiIlmnoOrstTx
set cmdheight=2
" http://spf13.com/post/perfect-vimrc-vim-config-file/
set backspace=indent,eol,start  " backspace for dummys

"set listchars=""
set history=10000

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

set mouse=a

"  you can change buffers without saving
set hidden

" make backspace/space/<left>/<right> do the right thing
" across line boundarys
set whichwrap=b,s,<,>

" find as you type search
set incsearch
set scrolloff=2
set tabstop=4
set shiftwidth=4



" List chars

"set list lcs=trail:·,tab:»·
set list
" set listchars=tab:\ \ ,trail:·,precedes:«,extends:»
set listchars=tab:\ \ ,trail:␣,precedes:«,extends:»
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=                  " Reset the listchars
"set listchars=trail:" "
" a tab should display as "  ", trailing whitespace as "."
" set listchars+=tab:\ \
" set listchars+=tab:\ \
" whitespace as .
" set listchars+=space:\.\
" set listchars+=trail:\

"set listchars+=trail:··
"set listchars+=trail:.            " show trailing spaces as dots
"set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
"set listchars+=precedes:<         " The character to show in the last column when wrap is
"set showbreak
set hlsearch    " highlight matches
"set incsearch   " incremental searching

" various backup and temp dirs
set backupdir=~/.vim/state/backup/    " where to put backup files.
set directory=~/.vim/state/tmp/      " where to put swap files.
set undodir=~/.vim/state/undo/         " where to put undo files


" gah, folding stop stop stop
set nofoldenable
" or number lines. Every f'in plugin tries to turn this back on.
set nonumber
set wildmenu
set wildmode=longest:longest,full

colorscheme molokai

highlight! link DiffText MatchParen

"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

highlight nonascii guibg=Red ctermbg=1 term=standout
highlight NonText ctermfg=16 guifg=#4a4a59
highlight ExtraWhitespace ctermbg=red guibg=red

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" insert python logger
" imap <silent> <Leader>L log = logging.getLogger(__name__)
" imap <silent> <Leader>CL self.log = logging.getLogger('%s.%s' % (__name__, self.__class__.__name__))


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

map <F8> :lnext <CR>
imap <F8> <ESC>:lnext <CR>i
map <F9> :lprev <CR>
imap <F9> <ESC>:lprev <CR>i

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

" from https://stackoverflow.com/a/1708936/781180
" open ,e " open file relative to file in current buffer instead of project
" and or, split and open
" map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
" map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" Start the status line
"set statusline=%f\ %m\ %r
"set statusline+=Line:%l/%L[%p%%]
"set statusline+=Col:%v
"set statusline+=Buf:#%n
"set statusline+=[%b][0x%B]

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
set linebreak
  set textwidth=72
  set nolist
endfunction

" just to the longest lint
function! Jumptolongestline()
  let lines = map(getline(1, '$'), 'len(v:val)')
  return index(lines, max(lines))+1
endfunction

function MaxLine()
    let maxcol = 0
    let lnum = 1
    while lnum <= line("$")
        call cursor(lnum, 0)
        if col("$") > maxcol
            let maxcol = col("$")
            let maxline = lnum
        endif
        let lnum += 1
    endwhile
    echo "Line" maxline "has" maxcol - 1 "characters"
endfunction

""
"" File types
""

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")

  " highlist non ascii
  autocmd BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

  " Show trailing whitepace and spaces before a tab:
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

  " In Makefiles, use real tabs, not tabs expanded to spaces
  autocmd FileType make setlocal noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  "au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 nonumber

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  " autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  "  \| exe "normal! g`\"" | endif

  " autocmd Filetype gitcommit setlocal spell textwidth=72

  " in git rebase commit list/edit window 'S' to cycle between pick/squash/etc
  " and 's' to just use squash
  autocmd Filetype gitrebase nnoremap <buffer> <silent> S :Cycle<CR>
  autocmd Filetype gitrebase nnoremap <buffer> <silent> s :Squash<CR>

  "autocmd BufNewFile,BufRead */src/ansible/*.py set ft=python.ansible_src
  "autocmd FileType ansible_src let b:pymode_trim_whitespaces = 0
endif
