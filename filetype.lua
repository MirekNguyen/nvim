vim.filetype.add({
	extension = {
		http = "http",
	},
})

vim.filetype.add({
	pattern = {
		["Chart%.ya?ml"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		[".*/values.*%.ya?ml"] = "helm",
	},
})

vim.filetype.add({
	pattern = {
		[".*playbook.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
		[".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
		[".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
		[".*/inventory/.*%.ini"] = "yaml.ansible",
		[".*/site%.ya?ml"] = "yaml.ansible",
		[".*/inventory%.ya?ml"] = "yaml.ansible",
	},
})

vim.filetype.add({
	pattern = {
		["compose.*%.ya?ml"] = "yaml.docker-compose",
		["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
	},
})
