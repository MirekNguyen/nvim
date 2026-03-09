local progress_handle

return {
  "wojciech-kulik/xcodebuild.nvim",
  ft = { "swift" },
  dependencies = {
    "ibhagwan/fzf-lua",
    "folke/snacks.nvim",
    "MunifTanjim/nui.nvim",
    {
      "j-hui/fidget.nvim",
      config = function()
        local fidget = require("fidget")
        fidget.setup({
          notification = {
            window = {
              normal_hl = "String", -- Base highlight group in the notification window
              winblend = 0,         -- Background color opacity in the notification window
              border = "rounded",   -- Border around the notification window
              zindex = 45,          -- Stacking priority of the notification window
              max_width = 0,        -- Maximum width of the notification window
              max_height = 0,       -- Maximum height of the notification window
              x_padding = 1,        -- Padding from right edge of window boundary
              y_padding = 1,        -- Padding from bottom edge of window boundary
              align = "bottom",     -- How to align the notification window
              relative = "editor",  -- What the notification window position is relative to
            },
          },
        })
      end,
    }
  },
  keys = {
    {
      "<leader>i",
      "<cmd>XcodebuildPicker<cr>",
      desc = "Overview of xcodebuild commands",
    },
    {
      "<leader>o",
      "<cmd>XcodebuildBuildRun<cr>",
      desc = "Xcode build and run",
    },
  },
  opts = {
    show_build_progress_bar = false,
    logs = {
      notify = function(message, severity)
        local fidget = require("fidget")
        if progress_handle then
          progress_handle.message = message
          if not message:find("Loading") then
            progress_handle:finish()
            progress_handle = nil
            if vim.trim(message) ~= "" then
              fidget.notify(message, severity)
            end
          end
        else
          fidget.notify(message, severity)
        end
      end,
      notify_progress = function(message)
        local progress = require("fidget.progress")

        if progress_handle then
          progress_handle.title = ""
          progress_handle.message = message
        else
          progress_handle = progress.handle.create({
            message = message,
            lsp_client = { name = "xcodebuild.nvim" },
          })
        end
      end,
    },
  },
}
