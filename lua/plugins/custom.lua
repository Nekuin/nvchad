local plugins = {
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      local is_windows = package.config:sub(1, 1) == "\\"
      local is_mac = vim.fn.has "mac" == 1
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      if not is_windows then
        if is_mac then
          vim.g.copilot_node_command = "/Users/simo/.nvm/versions/node/v22.13.1/bin/node"
        else
          vim.g.copilot_node_command = "/home/simo/.nvm/versions/node/v18.16.0/bin/node"
        end
      end
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    "phpactor/phpactor",
    build = "composer install --no-dev --optimize-autoloader",
    ft = "php",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatClose", "CopilotChatToggle", "CopilotChat" },
    config = function()
      require("CopilotChat").setup()
    end,
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

return plugins
