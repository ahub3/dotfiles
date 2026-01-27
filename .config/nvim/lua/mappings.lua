require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- disables middle mouse paste in normal, insert, and visual modes
-- for single and double clicks, will paste if triple clicked
-- For Normal, Insert, and Visual modes
map('n', '<MiddleMouse>', '<Nop>', { silent = true }) -- Normal Mode
map('i', '<MiddleMouse>', '<Nop>', { silent = true }) -- Insert Mode
map('v', '<MiddleMouse>', '<Nop>', { silent = true }) -- Visual Mode

-- Also map multi-clicks if your system sends them (optional, but thorough)
map('n', '<2-MiddleMouse>', '<Nop>', { silent = true })
map('i', '<2-MiddleMouse>', '<Nop>', { silent = true })
map('v', '<2-MiddleMouse>', '<Nop>', { silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
