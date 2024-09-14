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
		local dap = require("dap")

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- single file
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process, -- nodejs processes
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
				},
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
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		opts = {},
		dependencies = {
			nvim_dap,
			"nvim-neotest/nvim-nio",
		},
	},
}
