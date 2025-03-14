local M = {}

M.git_colors = {
	GitAdd = "#A1C281",
	GitChange = "#74ADEA",
	GitDelete = "#FE747A",
}
M.lsp_signs = { Error = "✖ ", Warn = "! ", Hint = "󰌶 ", Info = " " }

M.lsp_kinds = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Copilot = " ",
	Namespace = " ",
	Package = " ",
	String = " ",
	Number = " ",
	Boolean = " ",
	Array = " ",
	Object = " ",
	Key = " ",
	Null = " ",
}

M.mason_packages = {
	"bash-language-server",
	"clangd",
	"css-lsp",
	"eslint-lsp",
	"graphql-language-service-cli",
	"html-lsp",
	"lua-language-server",
	"markdownlint",
	"prettier",
	"tailwindcss-language-server",
}

M.lsp_servers = {
	"bashls",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"tailwindcss",
}

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

function M.warn(msg, notify_opts)
	vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
	vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
	vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

--- Toggle an option with optional values and feedback.
---@param option string: The option to toggle.
---@param silent boolean?: If true, suppress feedback messages.
---@param values table?: If provided, toggle between these two values.
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return M.info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
	end

	vim.opt_local[option] = not vim.opt_local[option]:get()

	if not silent then
		if vim.opt_local[option]:get() then
			M.info("Enabled " .. option, { title = "Option" })
		else
			M.warn("Disabled " .. option, { title = "Option" })
		end
	end
end

M.diagnostics_active = true

function M.toggle_diagnostics()
	M.diagnostics_active = not M.diagnostics_active
	if M.diagnostics_active then
		vim.diagnostic.show()
		M.info("Enabled Diagnostics", { title = "Lsp" })
	else
		vim.diagnostic.hide()
		M.warn("Disabled Diagnostics", { title = "Lsp" })
	end
end

M.quickfix_active = false

function M.toggle_quickfix()
	M.quickfix_active = not M.quickfix_active
	if M.quickfix_active then
		vim.diagnostic.setloclist()
	else
		vim.cmd([[ lclose ]])
	end
end

return M
