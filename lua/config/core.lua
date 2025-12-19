local set = vim.opt

--> nose
--set.laststatus = 3
set.wildmenu = true
--set.tabline = '%t%M'

--> numbers
set.number = true
set.relativenumber = true

--> aparience
set.cursorline = true
set.virtualedit = 'onemore'
set.showmode = false
--set.signcolumn = 'yes'
set.termguicolors = true

--> tabs & indentation
set.tabstop = 2
set.softtabstop = 0
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.showtabline = 1

--> disable or enable mouse
--> set.mouse = ''

set.backspace = 'indent,eol,start'

--> text-wrap
set.wrap = false 

--> updatetime
set.updatetime = 300

--> backup
set.backup = false
set.writebackup = false

--vim.api.nvim_command('packadd nvim-treesitter')
--vim.o.tabline = '%!v:lua.my_tabline()'

-- function RefreshLualine()
--   local venv = os.getenv("VIRTUAL_ENV") or "NO ENV"
--   require('lualine').refresh() -- Esto forzará la actualización de Lualine
-- end

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "CmdlineEnter"}, {
--   callback = function()
--     -- Refresca la barra de estado para que se muestre el entorno actualizado
--     require('lualine').refresh()
--   end
-- })
