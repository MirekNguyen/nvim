return {
  "saghen/blink.cmp",
  event = { "InsertCharPre" },
  version = '*',
  dependencies = "rafamadriz/friendly-snippets",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink", score_offset = 2000 },
      },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      trigger = {
        show_on_insert_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
      },
      menu = {
        border = "single",
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon" }, { "kind" } },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = "single",
        },
      },
    },
  },
}
