let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/LOCAL\ DEV/ferrum
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit apps/app-buyer-finding/src/contactDealer/SharedContactDealerWrapper.jsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 162 + 162) / 325)
exe 'vert 2resize ' . ((&columns * 162 + 162) / 325)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=30
setlocal nofen
let s:l = 15 - ((14 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 061|
lcd ~/Desktop/LOCAL\ DEV/ferrum
wincmd w
argglobal
if bufexists("~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx") | buffer ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx | else | edit ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx | endif
if &buftype ==# 'terminal'
  silent file ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx
endif
balt ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=30
setlocal nofen
let s:l = 6 - ((5 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 162 + 162) / 325)
exe 'vert 2resize ' . ((&columns * 162 + 162) / 325)
tabnext 1
badd +0 ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-accounts/src/createDealer/react/components/ErrorList.tsx
badd +19 ~/Desktop/LOCAL\ DEV/ferrum/apps/app-admin-cms/index.js
badd +0 ~/Desktop/LOCAL\ DEV/ferrum/apps/app-buyer-finding/src/contactDealer/SharedContactDealerWrapper.jsx
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=tfcoTilxnOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
