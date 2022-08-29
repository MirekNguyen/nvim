local dependency = pcall(require, 'saadparwaiz1/cmp_luasnip')
if (not dependency) then return end

local status, luasnip = pcall(require, 'luasnip.loaders.from_vscode')
if (not status) then return end
luasnip.lazyload()
