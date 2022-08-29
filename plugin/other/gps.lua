local dependency = pcall(require, 'nvim-treesitter')
if (not dependency) then return end

local status, gps = pcall(require, 'nvim-gps')
if (not status) then return end

gps.setup()
