set number
set relativenumber

set shiftwidth=4
set autoindent

set hlsearch
set ignorecase
set smartcase

set cursorline
set showmatch
set laststatus=2

syntax on
highlight MatchParen ctermbg=brown ctermfg=white

highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=green

" --- Cross-Session Cursor Shape ---
if &term =~ "xterm\\|rxvt\\|screen\\|tmux\\|vt100"
  " 1 or 2 = block, 3 or 4 = underline, 5 or 6 = vertical bar
  let &t_SI = "\<Esc>[6 q" " Insert mode (Vertical Bar)
  let &t_SR = "\<Esc>[4 q" " Replace mode (Underline)
  let &t_EI = "\<Esc>[2 q" " Normal mode (Block)
endif

" Fix for specific older Vim versions/terminals
autocmd VimLeave * silent !echo -ne "\e[2 q"

autocmd InsertEnter * hi StatusLine ctermbg=black ctermfg=blue
autocmd InsertLeave * hi StatusLine ctermbg=white ctermfg=black

set statusline=
set statusline+=\ %F                     " Full path to file
set statusline+=\ %m                     " Modified flag [+]
set statusline+=\ %r                     " Read-only flag [RO]
set statusline+=\ %y                     " Filetype [yaml/bash]
set statusline+=%=                       " Switch to right side
set statusline+=\ %l/%L\ (%p%%)          " Line/Total (Percentage)
set statusline+=\ col:%c\                " Column number

" Automatically close brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

