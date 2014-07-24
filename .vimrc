set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundel Vundle
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'TaskList.vim'
Bundle 'FuzzyFinder'
Bundle 'ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'davidhalter/jedi-vim.git'

Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'trapd00r/vim-after-syntax-vim'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'

Bundle 'matchit.zip'
Bundle 'SearchComplete'
Bundle 'snipmate-snippets'
Bundle 'bufkill.vim'
Bundle 'godlygeek/tabular'
Bundle 'Mark'
Bundle 'bkad/CamelCaseMotion'
Bundle 'sjl/gundo.vim'
Bundle 'sessionman.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'stlrefvim'

Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'
Bundle 'kshenoy/vim-signature'
Bundle 'tpope/vim-surround'

Bundle 'molokai'
Bundle 'searchfold.vim'

Bundle 'kana/vim-operator-user'
Bundle 'rhysd/vim-clang-format'

"

filetype plugin indent on " required!
syntax on

" set environment setings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"remove gui
set guioptions=

" Show line numbers
set number

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set noswapfile
set nobackup
set nowb

set linespace=5
set laststatus=2
"

" folding
set foldmethod=marker
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme moria
"colorscheme wombat
colorscheme molokai
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use bitsream font
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
set guifont=Inconsolata\ Medium\ 10



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable beep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=79

set ai "Auto indent
set wrap "Wrap lines



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
function! VisualSearch(direction) range
     let l:saved_reg = @"
     execute "normal! vgvy"
     let l:pattern = escape(@", '\\/.*$^~[]')
     let l:pattern = substitute(l:pattern, "\n$", "", "")
     if a:direction == 'b'
         execute "normal ?" . l:pattern . " "
     else
         execute "normal /" . l:pattern . " "
     endif

     let @/ = l:pattern
     let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> <leader>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'python_coverage.vim'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:jedi#popup_on_dot = 0


noremap <F5> :!python %<cr>
" Debug version of Python
noremap <C-F5> :!python -m pdb %<cr>
noremap <C-F4> :call PyLintEval()<cr>
autocmd BufRead *.py silent! call CTagsCompile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'eagletmt/ghcmod-vim'
Bundle 'kana/vim-filetype-haskell'
Bundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-b> :FufBuffer <cr>
noremap <C-f> :FufFileWithCurrentBufferDir <cr>

noremap <C-g>  :FufBookmarkFile <cr>
noremap <C-a><C-g> :FufBookmarkFileAdd <cr>

"noremap <C-t> :FufTaggedFile <cr>
"noremap <C-a><C-t> :!ctags -R --extra=+f <cr>

noremap <C-d>  :FufBookmarkDir <cr>
noremap <C-a><C-d> :FufBookmarkDirAdd <cr>
noremap <cr> :nohl <cr><cr>
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
map <leader>p "+p

inoremap ;; <ESC>
imap jk <ESC>

noremap <F3> :TaskList <cr>
"noremap <F2> :Tlist <cr>
noremap <F2> :TagbarToggle <cr>
let g:tagbar_left=1
    
noremap <C-F11> :silent! call CTagsCompile()<cr>

" Tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
noremap <C-t> :tabnew<CR>
noremap <A-t> :tabclose<CR>

noremap ; :

noremap <A-f> :ClangFormat<cr>

"

"Saving
"
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif


nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>


function! PyLintEval()
    let pylint_evaluation_res=system("pylint2 ".expand("%"))
    silent! exec "pedit pylint_eval_buffer"
    noautocmd wincmd P
    set buftype=nofile
    put=pylint_evaluation_res
    noautocmd wincmd p
endfun

fun! CTagsCompile()
    let current_dir=system("pwd")
    cd %:h
    !ctags -R --sort=yes .
    exec ':cd '.current_dir
endfun

fun! Runcmd(cmd)
    silent! exe "pedit ".a:cmd
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! ".a:cmd
    noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")

"
"""""""""" Resize vim windows """"
set ssop+=resize,winpos
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' . (getwinposx()<0?0:getwinposx()) . ' ' . (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

function! ReverseBackground()
 let Mysyn=&syntax
 if &bg=="light"
 se bg=dark
 else
 se bg=light
 endif
 syn on
 exe "set syntax=" . Mysyn
: echo "now syntax is "&syntax
endfunction
command! Invbg call ReverseBackground()
noremap <F11> :Invbg<CR>
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1
