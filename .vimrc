" to access hex mode :%!xxd
" to reverse hex mode :%!xxd -r
"
"
autocmd!

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set t_Co=256

let g:molokai_original=1
let g:rehash256=1
"colorscheme molokai

let g:gruvbox_termcolors = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_improved_strings = 1
set background=dark
colorscheme gruvbox

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' "required

Plugin 'easymotion/vim-easymotion'
"easynumber preset:
"map <Leader> <Plug>(easymotion-prefix)

Plugin 'fatih/vim-go'
"let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
"let g:go_highlight_operators = 1

Plugin 'sheerun/vim-polyglot'

"Glsl syntax
Plugin 'tikhomirov/vim-glsl'


" nerdTree
Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

" fuzzy matching
Plugin 'Yggdroot/leaderf'

"shows indentation
Plugin 'Yggdroot/indentLine'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"""""""""""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"""""""""""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"""""""""""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"""""""""""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





" * User Interface
" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" don't have files trying to override this .vimrc:
set nomodeline

" don't make it look like there are line breaks where there aren't:
"set nowrap

" use indents of 2 spaces, and have them copied down lines: " set shiftwidth=2
" set shiftround
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 98 characters:
set formatoptions+=t
set textwidth=98
set colorcolumn=98

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,] 
noremap <Space> <C-d>
noremap <BS> <C-u>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
"nnoremap <F6> <C-W>w
"nnoremap <S-F6> <C-W>W
" just use C-W w W

nnoremap <F4> :bn<CR>
nnoremap <F3> :bp<CR>

" use <F6> to cycle throught tabs (and <F5> to cycle backwards
nnoremap <F6> :tabn<CR>
nnoremap <F5> :tabp<CR>



" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :wnext<CR>
nnoremap <C-P> :wprev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal mode keystrokes
" beginning \t but some function keys (which won't work in all terminals) are also mapped.

" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" allow <BkSpc> to delete line breaks, beyond the start of the current insertion, and over
" indentations:
set backspace=eol,start,indent

set number
"two lines below causes cursor lag
set relativenumber
set regexpengine=1
"three lines below fixe the lag cause by the two lines above
set cursorline
set lazyredraw
set ttyfast
"changes search opperators such as * to act more as expected
"might mess up some really old Vi scripts
set magic

set hlsearch
set laststatus=2
"leaves 5 lines between cursor and end of the screen
set scrolloff=5
"saves marks and jumps for the most recent 100files
set viminfo='100,f1
" autoreads the file 
set autoread
"au CursorHold,CursorHoldI,InsertEnter * checktime
"au FocusGained,BufEnter * :silent! !
"au FocusLost,WinLeave * :silent! noautocmd w
au CursorMoved     * silent! checktime
au CursorMovedI    * silent! checktime

"folding
set foldmethod=manual
set foldlevel=0
"set foldcolumn=7
" saves folds
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" Status line modifications.
"set statusline =
"set statusline +=\%1*\ \[%n]\ %*            "buffer number
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%02B\ %*          "character under cursor " replace 2 with 4 if not using utf-8

nnoremap ; :
nnoremap <F1> <End>

:nmap + :vertical resize +3<CR>
:nmap - :vertical resize -3<CR>
:nmap < :resize -1<CR>
:nmap > :resize +1<CR>
:nmap K k:join<CR>
:vmap K k:join<CR>

execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093

nnoremap <C-e> <C-e>
nnoremap <C-y> <C-y>
nnoremap <C-u> 5<C-y>
nnoremap <C-d> 5<C-e>

inoremap <C-c> <Esc><Esc>

inoremap <C-d> <C-o><C-e>
inoremap <C-u> <C-o><C-y>

set number
set relativenumber

filetype plugin indent on    " required must be the last line
