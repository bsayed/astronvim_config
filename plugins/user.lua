return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
    --   require("todo-comments").setup {
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --   }
    -- end
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
  },
  -- {
  --   "p00f/nvim-ts-rainbow",
  --   event = "User AstroFile",
  -- },
  {
    "nvim-neotest/neotest",
    ft = "go",
    dependencies = {
      "nvim-neotest/neotest-go",
      -- Your other test adapters here
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        -- your neotest config here
        adapters = {
          require "neotest-go",
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "User AstroFile",
  },
  {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    event = "BufWinEnter",
    config = function()
      require("auto-save").setup {
        -- The name of the augroup.
        augroup_name = "AutoSavePlug",

        -- The events in which to trigger an auto save.
        -- events = { "InsertLeave", "TextChanged" },
        events = { "InsertLeave", "BufLeave" },

        -- If you'd prefer to silence the output of `save_fn`.
        silent = false,

        -- If you'd prefer to write a vim command.
        save_cmd = nil,

        -- What to do after checking if auto save conditions have been met.
        save_fn = function()
          local config = require "auto-save.config"
          if config.save_cmd ~= nil then
            vim.cmd(config.save_cmd)
          -- elseif M.silent then
          --   vim.cmd "silent! w"
          else
            vim.cmd "w"
          end
        end,

        -- May define a timeout, or a duration to defer the save for - this allows
        -- for formatters to run, for example if they're configured via an autocmd
        -- that listens for `BufWritePre` event.
        timeout = nil,

        -- Define some filetypes to explicitly not save, in case our existing conditions
        -- don't quite catch all the buffers we'd prefer not to write to.
        exclude_ft = { "neo-tree" },
      }
    end,
  },
  -- {
  --   "Pocco81/auto-save.nvim",
  --   event = "User AstroFile",
  --   config = function()
  --     require("auto-save").setup {
  --       -- your config goes here
  --       -- or just leave it empty :)
  --       enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
  --       execution_message = {
  --         message = function() -- message to print on save
  --           return ("AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S")
  --         end,
  --         dim = 0.18, -- dim the color of `message`
  --         cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  --       },
  --       -- trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
  --       trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
  --       -- trigger_events = { "BufWinLeave" }, -- vim events that trigger auto-save. See :h events
  --       -- function that determines whether to save the current buffer or not
  --       -- return true: if buffer is ok to be saved
  --       -- return false: if it's not ok to be saved
  --       condition = function(buf)
  --         local fn = vim.fn
  --         local utils = require "auto-save.utils.data"
  --
  --         if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
  --           return true -- met condition(s), can save
  --         end
  --         return false -- can't save
  --       end,
  --       write_all_buffers = false, -- write all buffers when the current one meets `condition`
  --       debounce_delay = 5000, -- saves the file at most every `debounce_delay` milliseconds
  --       callbacks = {
  --         -- functions to be executed at different intervals
  --         enabling = nil, -- ran when enabling auto-save
  --         disabling = nil, -- ran when disabling auto-save
  --         before_asserting_save = nil, -- ran before checking `condition`
  --         before_saving = nil, -- ran before doing the actual save
  --         after_saving = nil, -- ran after doing the actual save
  --       },
  --     }
  --   end,
  -- },
  {
    "simrat39/symbols-outline.nvim",
    event = "User AstroFile",
    config = function() require("symbols-outline").setup() end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    event = "User AstroFile",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    event = "User AstroFile",
    version = "*",
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "User AstroFile",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim", -- Optional
      "nvim-telescope/telescope.nvim", -- Optional
    },
    opts = { lsp = { auto_attach = true } },
  },
  {
    "chaoren/vim-wordmotion",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    version = "*",
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    event = "User AstroFile",
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping["<C-Right>"] = cmp.mapping(
        function(_)
          vim.api.nvim_feedkeys(
            vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
            "n",
            true
          )
        end
      )
      opts.experimental = { ghost_text = false }
      return opts
    end,
  },
  {
    "github/copilot.vim",
    event = "BufRead",
    config = function() vim.cmd "source ~/.config/nvim/extra_conf.vim" end,
  },
}

-- TODO: test
