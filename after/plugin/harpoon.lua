--[[
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>n", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_files(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_files(2) end)
vim.keymap.set("n", "<C-g>", function() ui.nav_files(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_files(4) end)
--]]
