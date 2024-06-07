vim.keymap.set("v", "<localleader>e", ":<C-u>MoltenEvaluateVisual<CR>gv",
	{ silent = true, desc = "evaluate visual selection" })

local wk = require("which-key")
wk.register({
	c = {
		name = "cell",
		c = { ":lua require('notebook-navigator').comment_cell()<cr>", "comment" },
		r = { ":lua require('notebook-navigator').run_cells_below()<cr>", "run (below)" },
		R = { ":lua require('notebook-navigator').run_all_cells()<cr>", "run (all)" },
	},
	e = {
		name = "evaluate",
		c = { ":lua require('notebook-navigator').run_and_move()<cr>", "cell (and move)" },
		C = { ":lua require('notebook-navigator').run_cell()<cr>", "cell (inplace)" },
		e = { ":MoltenEvaluateOperator<cr>", "operator" },
		l = { ":MoltenEvaluateLine<cr>", "line" },
		r = { ":MoltenReevaluateCell<cr>", "re-eval (cell)" },
		R = { ":MoltenReevaluateAll<cr>", "re-eval (all)" },
	},
	m = {
		name = "molten",
		i = { ":MoltenInit<cr>", "init" },
		I = { ":MoltenInitKernelFile<cr>", "init (kernel file)" },
		d = { ":MoltenDeinit<cr>", "de-init" },
		l = { ":MoltenLoad<cr>", "de-init" },
		r = { ":MoltenRestart<cr>", "de-init" },
		s = { ":MoltenSave<cr>", "save" },
	},
	o = {
		name = "output",
		d = { ":MoltenDelete<cr>", "delete" },
		e = { ":MoltenEnterOutput<cr>", "enter" },
		h = { ":MoltenHideOutput<cr>", "hide" },
		i = { ":MoltenImportOutput<cr>", "import" },
		s = { ":MoltenShowOutput<cr>", "show" },
		x = { ":MoltenExportOutput<cr>", "export" },
	},

}, { prefix = " m" })
