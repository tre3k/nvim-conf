-- Опции
local opt = vim.opt

opt.number = true                      -- Выводить номера строк
opt.autoindent = true                  -- Автоматически делать отступы
opt.showtabline = 2                    -- Всегда отображать tabbar
opt.colorcolumn = "80"                 -- Отображать границу на 80ом символе

vim.g.airline_theme = 'alduin'
