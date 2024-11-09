local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

local nvim_dap = {
	"mfussenegger/nvim-dap",
	config = function()
    vim.fn.sign_define('DapBreakpoint', {text='•', texthl='red', linehl='', numhl=''})

		local dap = require("dap")

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					name = "Launch file",
					type = "pwa-node",
					request = "launch",
					program = "${file}", -- single file
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				{
					name = "Attach",
					type = "pwa-node",
					request = "attach",
					processId = require("dap.utils").pick_process, -- nodejs processes
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				{
					name = "NestJs",
					type = "pwa-node",
					request = "attach",
					-- processId = require("dap.utils").pick_process, -- nodejs processes
					port = 9229,
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				}
			}
		end
	end,
	dependencies = {
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
			version = "1.*",
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			opts = {
				debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
				adapters = {
					"pwa-node",
				},
			},
		},
	},
}

return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "js", "node2", "php" },
			automatic_installation = true,
			handlers = {},
		},
		lazy = false,
		keys = {
		  { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
		  { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    }
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>du", "<cmd>lua require('dapui').toggle()<CR>" },
			{ "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
			{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>" },
			{ "<leader>d>", "<cmd>DapContinue<CR>" },
		},
		dependencies = {
			nvim_dap,
			"nvim-neotest/nvim-nio",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
	},
	{ "folke/neodev.nvim", opts = { library = { plugins = { "nvim-dap-ui" }, types = true } } },
}
