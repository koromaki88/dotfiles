return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
		},
		{
			"<leader>sv",
			function()
				require("fzf-lua").grep_visual()
			end,
			mode = "v",
		},
		{
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").buffers()
			end,
		},
		{
			"<leader>sd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").helptags()
			end,
		},
		{
			"<leader>ss",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
		},
		{
			"<leader>sw",
			function()
				require("fzf-lua").lsp_live_workspace_symbols()
			end,
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").resume()
			end,
		},
		{
			"<leader>so",
			function()
				require("fzf-lua").oldfiles()
			end,
		},
	},
	opts = {},
	---@diagnostic enable: missing-fields
}
