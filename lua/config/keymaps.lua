vim.g.mapleader = ' '
local map = vim.keymap

--> Generals
map.set('i', 'jk', '<ESC>', { silent = true })
map.set('n', '<leader>nh', ':nohl<CR>', { silent = true })
map.set('n', '<C-s>', ':silent w<CR>', { silent = true })
map.set('n', '<leader>q', ':silent q<CR>', { silent = true })

--> Window manager
map.set('n', '<leader>sv', '<C-w>v') -- vsplit
map.set('n', '<leader>sh', '<C-w>s') -- hsplit
map.set('n', '<leader>se', '<C-w>v') -- equal split
map.set('n', '<leader>sc', ':close<Cr>') -- close split
map.set('n', '<leader>sm', ':MaximizerToggle<CR>', { silent = true }) -- maximize window

--> Tabs
map.set('n', '<leader>nt', ':tabnew<Cr>', { silent = true }) -- new tab
map.set('n', '<leader>tn', ':tabnext<Cr>', { silent = true }) -- previous tab
map.set('n', '<leader>tp', ':tabprevious<Cr>', { silent = true }) -- next tab

--> NvimTree
map.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

--> ToggleTerm
map.set('n', '<leader>ñ', ':ToggleTerm 1<CR>', { silent = true })
map.set('n', '<leader>2', ':ToggleTerm 2 <CR>', { silent = true })

--> Rest
--map.set('n', '<leader>rr', ':lua require("rest-nvim").run()<CR>', { noremap = true, silent = true})
map.set('n', '<leader>rr', ':rightbelow vert Rest run<CR>', { noremap = true, silent = true })
map.set('n', '<leader>pp', ':rightbelow vert Rest open<CR>', { noremap = true, silent = true })
map.set('n', '<leader>ll', ':rightbelow vert Rest logs<CR>', { noremap = true, silent = true})

-- Js Formatter
vim.api.nvim_set_keymap('n', '<C-f>', ' :CocCommand prettier.forceFormatDocument<CR>', { noremap = true, silent = true })
