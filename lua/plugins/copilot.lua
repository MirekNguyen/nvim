return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true, -- auto refresh panel
      layout = {
        position = "right", -- | top | left | right
        ratio = 0.4,    -- width of the panel, when position is left or right
      },
    },
    suggestion = {
      enabled = true,   -- enable suggestions
      auto_trigger = true, -- automatically show suggestions
      accept = false,   -- disable built-in keymapping
      keymap = {
        accept = "<C-f>",
        next = "<C-;>",
        prev = "<C-'>",
        dismiss = "<C-\\>",
      },
    },
  },
}
