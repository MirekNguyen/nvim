local dependency = pcall(require, 'nvim-web-devicons')
if (not dependency) then return end

local status, trouble = pcall(require, 'trouble')
if (not status) then return end

trouble.setup()
