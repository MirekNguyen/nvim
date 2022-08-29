local dependency = pcall(require, 'plenary.nvim')
if (not dependency) then return end

local status, diffview = pcall(require, 'diffview')
if (not status) then return end

diffview.setup()
