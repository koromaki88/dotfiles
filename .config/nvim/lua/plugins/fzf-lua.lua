return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	config = function()
		local fzf = require("fzf-lua")
		vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "Live Grep" })
		vim.keymap.set("v", "<leader>sv", fzf.grep_visual, { desc = "Visual Grep" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "Search Resume" })
		vim.keymap.set("n", "<leader>sd", fzf.lsp_document_symbols, { desc = "Search Document Symbols" })
		vim.keymap.set("n", "<leader>sd", fzf.lsp_live_workspace_symbols, { desc = "Search Workspace Symbols" })
		vim.keymap.set("n", "<leader>so", fzf.oldfiles, { desc = "Search Recent Files" })
		vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "Search Buffers" })
	end,
	opts = {},
}
