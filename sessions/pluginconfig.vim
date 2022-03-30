let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit ~/.config/nvim/lua/plugins.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 114 + 114) / 229)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 114 + 114) / 229)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 229)
argglobal
balt ~/.config/nvim/examples/LV-init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=30
setlocal nofen
let s:l = 42 - ((12 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 42
normal! 0
wincmd w
argglobal
if bufexists("~/.config/nvim/examples/LV-lsp-installer.lua") | buffer ~/.config/nvim/examples/LV-lsp-installer.lua | else | edit ~/.config/nvim/examples/LV-lsp-installer.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/examples/LV-lsp-installer.lua
endif
balt ~/.config/nvim/lua/config/lsp-installer.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=30
setlocal nofen
let s:l = 14 - ((12 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 028|
wincmd w
argglobal
if bufexists("~/.config/nvim/lua/config/lsp-handlers.lua") | buffer ~/.config/nvim/lua/config/lsp-handlers.lua | else | edit ~/.config/nvim/lua/config/lsp-handlers.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/config/lsp-handlers.lua
endif
balt ~/.config/nvim/lua/config/lsp.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=30
setlocal fen
5
normal! zo
16
normal! zo
20
normal! zo
26
normal! zo
16
normal! zc
let s:l = 103 - ((39 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 103
normal! 064|
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 1resize ' . ((&columns * 114 + 114) / 229)
exe '2resize ' . ((&lines * 25 + 27) / 55)
exe 'vert 2resize ' . ((&columns * 114 + 114) / 229)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 229)
tabnext 1
badd +4 ~/.config/nvim/init.lua
badd +10 ~/.config/nvim/lua/config/lsp-installer.lua
badd +11 ~/.config/nvim/examples/LV-lsp-installer.lua
badd +9 ~/.config/nvim/examples/LV-init.lua
badd +78 ~/.config/nvim/lua/plugins.lua
badd +20 ~/.config/nvim/lua/keymaps.lua
badd +1 ~/.config/nvim/lua/config/lspconfig.lua
badd +13 ~/.config/nvim/examples/LV-lsp-handlers.lua
badd +7 ~/.config/nvim/lua/config/lsp.lua
badd +36 ~/.config/nvim/lua/config/lsp_old.lua
badd +1 ~/.config/nvim/lua/config/lsp-handlers.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=xTOntFcfoil
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
