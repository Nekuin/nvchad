require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-d>", "<C-d>zz", { desc = "C-d + zz" })
map("n", "<C-u>", "<C-u>zz", { desc = "C-u + zz" })
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
