require("conform").setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

-- function copy()
-- 	if vim.v.event.operator == 'y' and (vim.v.event.regname == '+' or vim.v.event.regname == '') then
-- 		require('osc52').copy_register(vim.v.event.regname)
-- 	end
-- end
-- vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
