require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Disable Middle Mouse Button Paste in Neovim/NvChad
map('n', '<Button2>', '<NOP>', { desc = 'Disable Middle Click Paste' })
map('v', '<Button2>', '<NOP>', { desc = 'Disable Middle Click Paste (Visual)' })
map('i', '<Button2>', '<NOP>', { desc = 'Disable Middle Click Paste (Insert)' })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
