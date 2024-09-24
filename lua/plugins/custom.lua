local plugins = {
  {
    "tpope/vim-fugitive", lazy = false
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      vim.g.copilot_node_command = "/home/simo/.nvm/versions/node/v18.16.0/bin/node"
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    "phpactor/phpactor",
    build = "composer install --no-dev --optimize-autoloader",
    ft = "php",
  },
}

return plugins;
