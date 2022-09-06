local status, lualine = pcall(require, 'lualine')
if (not status) then return end

-- local status, gps = pcall(require, 'nvim-gps')
-- if (not status) then return end

lualine.setup({
  options = { theme = 'gruvbox-material' },
  extensions = { 'nvim-tree' },
  -- sections = {
  --   lualine_c = {
  --     { gps.get_location, cond = gps.is_available },
  --   }
  -- }
})
