require("mason").setup()

vim.lsp.config("ruby_lsp", {
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(vim.fs.root(fname, ".git"))
	end,
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"jdtls",
		"rust_analyzer",
		"clangd",
		"cmake",
		"ansiblels",
		"asm_lsp",
		"bashls",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"gopls",
		"gradle_ls",
		"graphql",
		"groovyls",
		"html",
		"hls",
		"jsonls",
		"kotlin_language_server",
		"marksman",
		"opencl_ls",
		"spectral",
		"perlnavigator",
		"pylsp",
		"svelte",
		"taplo",
		"tailwindcss",
		"terraformls",
		"vuels",
		"lemminx",
		"yamlls",
		"zls",
		"ruby_lsp",
	},
	automatic_enable = true,
})
require("null-ls").setup()
require("mason-null-ls").setup({
	automatic_setup = true,
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

local function filter_out_rvm(result)
	local home = vim.fn.expand("~")
	local rvm_path = home .. "/.rvm"

	local filtered = vim.tbl_filter(function(item)
		return not item.filename:find(rvm_path, 1, true)
	end, result.items)

	if #filtered == 0 then
		vim.notify("No definitions found outside ~/.rvm", vim.log.levels.WARN)
		return
	end

	vim.fn.setqflist({}, " ", {
		title = result.title,
		items = filtered,
	})

	local win = vim.api.nvim_get_current_win()
	local from = { vim.fn.bufnr("%"), vim.fn.line("."), vim.fn.col("."), 0 }
	local tagname = vim.fn.expand("<cword>")
	vim.fn.settagstack(win, { items = { { tagname = tagname, from = from } } }, "t")

	if #filtered == 1 then
		vim.cmd.cfirst()
	else
		vim.cmd.copen()
	end
end

local on_attach = function(ev)
	local bufnr = ev.buf

	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = bufnr })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

	if vim.bo[bufnr].filetype == "ruby" then
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition({ on_list = filter_out_rvm })
		end, { buffer = bufnr })
	else
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = on_attach,
})
