return {
  "glepnir/dashboard-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local config = {}

    config.mru = {
        label = " Recent Files",
        limit = 10,
    }

    config.project = {
        label = " Recent Projects",
        limit = 10,
    }

    config.shortcut = {
        {
            desc = " 󰈔  File/path ",
            action = "Telescope oldfiles find_command=fd,--hidden",
            group = "@string",
            key = "f",
        },
        {
            desc = "   Quit ",
            action = "q!",
            group = "@variable.builtin",
            key = "q",
        },
    }

    config.week_header = { enable = true }
    config.footer = { "", "󰛨  Dala what you must" }
    config.packages = { enable = true }

    require("dashboard").setup({
        theme = "hyper",
        config = config,
    })
  end
}

