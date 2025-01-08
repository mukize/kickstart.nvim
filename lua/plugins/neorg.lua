return {
    "nvim-neorg/neorg",
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},

                ["core.concealer"] = {
                    config = {
                        -- icon_preset = "diamond",
                        -- icons = {
                        --     delimiter = { strong = { icon = "=" }, weak = { icon = "-" } }
                        -- }
                    }
                },
                ["core.export"] = {},
                ["core.summary"] = {},
                ["core.todo-introspector"] = {},
                ["core.dirman"] = { config = { workspaces = { notes = "~/notes", } } },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    }
                },

                ["core.integrations.treesitter"] = {},
                ["core.integrations.nvim-cmp"] = {},
            }
        })
    end
}
