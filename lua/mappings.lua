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

map("n", "<leader>ap", "<cmd>:CopilotChatToggle<cr>", { desc = "CopilotChatToggle" })

map("n", "<leader>s", ':%s/<C-r><C-w>//g<Left><Left>', {desc = "Search and replace"})
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
