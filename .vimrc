let b:did_ftplugin = 1

" Use color syntax highlighting.
syntax on

" Color specifications. Change them as you would like.

hi Comment	term=none	ctermfg=green	guifg=Gray
hi Constant	term=none	ctermfg=cyan	guifg=Cyan
hi Identifier	term=none	ctermfg=green	guifg=White
hi Statement	term=none	ctermfg=yellow 	guifg=White
hi PreProc	term=none	ctermfg=magenta  guifg=Magenta
hi Type		term=none	ctermfg=white	guifg=White
hi Special	term=none	ctermfg=cyan	guifg=Blue
hi Nontext	term=none	ctermfg=red	guifg=Red
hi Normal	guifg=Yellow	guibg=#00007F
hi Normal	ctermfg=white cterm=none

colorscheme desert

hi Comment      cterm=none	gui=none
hi Constant     cterm=none	gui=none
hi Identifier   cterm=none	gui=none
hi Statement    cterm=none	gui=none
hi PreProc      cterm=none	gui=none
hi Type         cterm=none	gui=none
hi Special      cterm=none	gui=none
hi NonText	cterm=none	gui=none

" Special highlighting for XML
hi xmlTag ctermfg=blue cterm=none guifg=white
hi xmlTagName ctermfg=blue cterm=none guifg=white
hi xmlEndTag ctermfg=blue cterm=none guifg=white


" Options.

set autoindent
set backspace=2		" Allows insert-mode backspace to work as one expects
set cindent
set cinkeys=0{,0},:,!^F,o,O,e	" See "cinkeys"; this stops "#" from indenting
set fileformat=unix	" No crazy CR/LF
set listchars=tab:\ \ ,trail:· " If you do ":set list", shows trailing spaces
set mouse=		" I don't like the mouse in VIM
set nobackup		" Don't use a backup file (also see writebackup)
set nohlsearch		" Don't highlight search terms
set nojoinspaces	" One space after a "." rather than 2
set ruler		" Show the line position at the bottom of the window
set scrolloff=1		" Minimum lines between cursor and window edge
set shiftwidth=4	" Indent by 4 columns for C functions, etc
set showcmd		" Show partially typed commands
set showmatch		" Show parentheses matching
set smartindent		" Indent settings (really only the cindent matters)
set textwidth=80	" Maximum line width
set viminfo='0,\"100,	" Stay at the start of a file when opening it
set whichwrap=<,>,[,],h,l " Allows for left/right keys to wrap across lines
set writebackup		" Write temporary backup files in case we crash
" tab to space options
set shiftwidth=3
set tabstop=3
set softtabstop=3
set expandtab
set tabpagemax=100
set number
setlocal spell spelllang=en_gb





if version >= 600

" Vim 6 options

"  colo cduan
  set formatoptions=tcroql

  " Increase the highlighting accuracy
  syn sync fromstart

else

  set fo=tcroql
"  source ~/.vim/colors/cduan.vim
"  source ~/.vim/plugin/matchit.vim
  syn sync minlines=1000

end

set guifont=-Schumacher-Clean-Medium-R-Normal--16-160-75-75-C-80-ISO646.1991-IRV

map <F2>  :vsp<CR>
         \:vsp<CR>
         \:vsp<CR>
         \<C-W>l
         \<C-W>l
         \<C-W>l
         \:sp<CR>
         \<C-w>h
         \:sp<CR>
         \<C-W>10>
         \<C-W>h
         \<C-W>23>
         \<C-W>h
         \<C-W>10>
         \<ESC>

map <F5> <C-W>h 
map <F6> <C-W>j
map <F7> <C-W>k
map <F8> <C-W>l

map <Del> <BS>
imap <Del> <BS>

" My file types. TODO: These should be in the .vimft file, I think...
au BufNewFile,BufRead *.cls set syn=tex
au BufNewFile,BufRead *.R set syn=r
au BufNewFile,BufRead *.R syn sync fromstart

" On plain text files, no keyword chars, because we don't want tab completion
au BufNewFile,BufRead *.txt set iskeyword=

" NOTE: Sweave syntax is my own file...
au BufNewFile,BufRead *.Snw set syn=sweave

" On LaTeX files don't use indenting.
au BufNewFile,BufRead *.tex,*.Snw set noautoindent nosmartindent nocindent
" On HTML files don't use indenting.
au BufNewFile,BufRead *.html set noautoindent nosmartindent nocindent

" On CGI files, determine type by reading in a line.
fun! CGICheck()
    let l = getline(nextnonblank(1))
    if l =~ 'php'
	set syn=php
    elseif l =~ 'perl'
	set syn=perl
    endif
endfun

au BufRead *.cgi	call CGICheck()

" On reading TeX files, don't wrap to eighty characters. I know this is
" horrible, but it makes formatting and parsing much easier for me.
" TODO Figure out how to make the scrolling work properly with line wrapping.
fun! TeXformat()
    set noautoindent nosmartindent nocindent
    set textwidth=0
    set linebreak
    set display=lastline
    noremap j gj
    noremap k gk
    noremap $ g$
    noremap ^ g^
    noremap 0 g0
    noremap A g$a
    noremap I g^i
    noremap C cg$
    noremap D dg$
endfun

"au BufNewFile,BufRead *.tex call TeXformat()

" Set expandtab for Fortran files
au BufNewFile,BufRead *.f,*.for set expandtab

" I don't know why I need this...
augroup cprog
    au!
augroup end

" Based on VIM tip 102: automatic tab completion of keywords
function InsertTabWrapper(dir)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
	return "\<tab>"
    elseif "back" == a:dir
	return "\<c-p>"
    else
	return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper("fwd")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("back")<cr>

set encoding=utf-8

" Nice highlight for text that goes over the 80 character column limit
highlight Overlength ctermbg=lightblue ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Cursor "
set cursorline
 
