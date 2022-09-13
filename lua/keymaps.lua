local noshow = { noremap = true, silent = true }
local show = { noremap = true, silent = false }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", show)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<Leader>x", ":helloooo dere", show) --stupid example

-- Modes
--   Normal, Visual, Select, Operator-pending = '',
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- MISC (dump, org later)
keymap("", "<leader>V", "+y", noshow)
keymap("", "gq", "<esc>:q<CR>", noshow)
keymap("", "<leader>hub", ":!hub sync<CR>", noshow)
keymap("", "<leader>yre", ":!yarn relay<CR>", noshow)

-- QF LIST
keymap("", "<leader><leader>c", ":ccl<CR>", noshow)

-- TERMINAL
keymap("t", "<Esc>", "<C-\\><C-n>", noshow)
keymap("t", "<C-w>", "<Esc><C-w>", noshow)

-- BUFFER
keymap("", "<leader>B", "<C-^>", noshow) -- telescope
keymap("", "<leader>bd", ":%bd!<CR>", noshow)
keymap("", "<Tab>", ":bnext<CR>", noshow)
keymap("", "<S-Tab>", ":bprevious<CR>", noshow)

-- BASE
keymap("", "<esc>", ":noh<CR>", noshow)
keymap("", "<leader>Q", ":qa!<CR>", noshow)
keymap("", ";", ":", show)
keymap("", "<leader>w", ":noa w<CR>", noshow)
keymap("", "<leader>W", ":w<CR>", noshow)
keymap("", "<leader>pw", ":pwd<CR>", noshow)

-- SPLIT CONTROL
keymap("", "<leader>sp", ":split<CR>", noshow)
keymap("", "<leader>vs", ":vs<CR>", noshow)
keymap("", "<leader>sw", "<C-w>r", noshow)
keymap("", "<leader>ee", "<C-w>=", noshow)

-- MOVEMENT
keymap("", "<leader>j", "<C-w><C-w>", noshow) -- next split
keymap("", "<leader>J", "<C-w>p", noshow) -- next split
keymap("", "Y", "y$", noshow) -- select to end of line
keymap("n", "L", "15j", noshow)
keymap("n", "H", "15k", noshow)
keymap("n", "U", "<C-r>", noshow) -- redo
keymap("", "E", "$", noshow) -- end of line
keymap("", "B", "^", noshow) -- beginnning of line
keymap("v", "J", ":m '>+1<CR>gv=gv", noshow) -- move selected line up
keymap("v", "K", ":m '<-2<CR>gv=gv", noshow) -- move selected line down
keymap("", "n", "nzzzv", noshow)
keymap("", "N", "Nzzzv", noshow)

-- STAY IN INDENT MODE
keymap("v", "<", "<gv", noshow)
keymap("v", ">", ">gv", noshow)

-- FOLDING
keymap("", "<F8>", "zA", noshow)
keymap("", "<F9>", "zR", noshow)
keymap("", "ff", "za", noshow)
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "P", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- nvimlsp
		vim.lsp.buf.hover()
	end
end)

-- MARKS
keymap("n", "ma", "'Azz", noshow)
keymap("n", "'a", "mA", noshow)
keymap("n", "ms", "'Szz", noshow)
keymap("n", "'s", "mS", noshow)
keymap("n", "md", "'Dzz", noshow)
keymap("n", "'d", "mD", noshow)
keymap("n", "mf", "'Fzz", noshow)
keymap("n", "'f", "mF", noshow)
keymap("n", "ma", "'Azz", noshow)
keymap("n", "'g", "mG", noshow)
keymap("n", "mg", "'Gzz", noshow)
keymap("n", "'v", "mV", noshow)
keymap("n", "mb", "'Bzz", noshow)
keymap("n", "'r", "mR", noshow)
keymap("n", "mr", "'Rzz", noshow)
keymap("n", "'t", "mT", noshow)
keymap("n", "<leader>dma", ":delmarks A-Z0-9<CR>", noshow)

-- RESIZE WITH ARROWS
keymap("n", "<M-Up>", ":resize -2<CR>", noshow)
keymap("n", "<M-Down>", ":resize +2<CR>", noshow)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", noshow)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", noshow)

-- LSP
-- keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', noshow)
-- keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', noshow)
-- keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', noshow)
-- keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', noshow)
-- keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', noshow)
-- keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', noshow)
-- keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', noshow)
-- keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', noshow)
-- keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', noshow)
-- keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', noshow)
-- keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', noshow)

-- Custom
-- keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", noshow)
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noshow)
-- keymap("n", "Q", "<cmd>Bdelete!<CR>", noshow)
-- keymap("n", "<F1>", ":e ~/Notes/<cr>", noshow)
-- keymap("n", "<F3>", ":e .<cr>", noshow)
-- keymap("n", "<F4>", "<cmd>Telescope resume<cr>", noshow)
-- keymap("n", "<F5>", "<cmd>Telescope commands<CR>", noshow)
-- keymap( "n", "<F6>", [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]], noshow)
-- keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", noshow)
-- keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", noshow)
-- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", noshow)
-- keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", noshow)
-- keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], noshow)
-- keymap( "n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", noshow)
-- keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", noshow)
-- keymap("n", "<C-s>", "<cmd>vsplit<cr>", noshow)
-- keymap("n", "<C-z>", "<cmd>ZenMode<cr>", noshow)
-- keymap("n", "<c-n>", ":e ~/Notes/<cr>", noshow)
-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], noshow)
-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap('n', '<CR>', '<cmd>NeoZoomToggle<CR>', { noremap=true, silent=true, nowait=true })
