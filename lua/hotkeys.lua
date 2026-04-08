-- Комбинации клавиш
-- :nmap <KEY> :command<CR>
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<F4>', ':NERDTreeToggle<CR>', default_opts)
map('n', '<F6>', ':TagbarToggle<CR>', default_opts)
map('n', '<F5>', ':Telescope<CR>', default_opts)
