local wk = require("which-key")
wk.register({
	c = {
		name = "insert chunk",
		b = { "o```{bash}<cr>```<esc>O", "bash" },
		j = { "o```{julia}<cr>```<esc>O", "julia" },
		p = { "o```{python}<cr>```<esc>O", "python" },
		r = { "o```{r}<cr>```<esc>O", "r" }
	},
	q = {
		name = "quarto",
		a = { ":QuartoActivate<cr>", "activate" },
		e = { ":lua require'otter'.export()<cr>", "export" },
		E = { ":lua require'otter'.export(true)<cr>", "export (overwrite)" },
		p = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
		q = { ":lua require'quarto'.quartoClosePreview()<cr>", "close preview" },
		h = { ":QuartoHelp ", "help" },
		r = { ":QuartoSendAbove<cr>", "run (to cursor)" },
		R = { ":QuartoSendAll<cr>", "run (all)" },
	},

}, { prefix = "<localleader>" })

-- NOTE: will this work?
vim.b.molten_auto_open_output = true
