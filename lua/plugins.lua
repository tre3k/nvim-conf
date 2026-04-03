-- Плагины

-- Функция проверки существования файла
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- [ vim-plug ] менеджер плагинов
local os_home = os.getenv('HOME')
local vim_plug_path = os_home .. '/.local/share/nvim/site/autoload/plug.vim'
local vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

-- Если не существует, то скачиваем
if not file_exists(vim_plug_path) then
   os.execute('curl -fLo ' .. vim_plug_path .. ' --create-dirs ' .. vim_plug_url)
end

-- Иницилизация vim-plug из примера с
-- https://github.com/junegunn/vim-plug?tab=readme-ov-file#
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/seoul256.vim.git
Plug('junegunn/seoul256.vim')

-- Any valid git URL is allowed
Plug('https://github.com/junegunn/vim-easy-align.git')

-- Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug('fatih/vim-go', { ['tag'] = '*' })

-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug('nsf/gocode', { ['rtp'] = 'vim' })

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

-- On-demand loading: loaded when a file with a specific file type is opened
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })

Plug('preservim/tagbar', { ['rtp'] = 'plugin' })

-- Unmanaged plugin (manually installed and updated)
--Plug('~/my-prototype-plugin')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
-- vim.cmd('silent! colorscheme seoul256')
