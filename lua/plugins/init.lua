return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Telescope",
    opts = function()
      local telescope = require "telescope"
      local actions = require "telescope.actions"

      -- Load NvChad's default config
      local default_opts = require "nvchad.configs.telescope" or {}

      -- Windows-specific fnameescape fix
      local is_windows = vim.fn.has "win64" == 1 or vim.fn.has "win32" == 1
      local vimfnameescape = vim.fn.fnameescape
      local winfnameescape = function(path)
        local escaped_path = vimfnameescape(path)
        if is_windows then
          local need_extra_esc = path:find "[%[%]`%$~]"
          local esc = need_extra_esc and "\\\\" or "\\"
          escaped_path = escaped_path:gsub("\\[%(%)%^&;]", esc .. "%1")
          if need_extra_esc then
            escaped_path = escaped_path:gsub("\\\\['` ]", "\\%1")
          end
        end
        return escaped_path
      end

      local select_default = function(prompt_bufnr)
        vim.fn.fnameescape = winfnameescape
        local result = actions.select_default(prompt_bufnr, "default")
        vim.fn.fnameescape = vimfnameescape
        return result
      end

      -- Custom telescope configuration
      local custom_opts = {
        defaults = {
          mappings = {
            i = {
              ["<cr>"] = select_default,
            },
            n = {
              ["<cr>"] = select_default,
            },
          },
        },
      }

      -- Merge the configs (NvChad + custom settings)
      local final_opts = vim.tbl_deep_extend("force", default_opts, custom_opts)

      -- Apply the final telescope setup
      telescope.setup(final_opts)
      return final_opts
    end,
  },
}
