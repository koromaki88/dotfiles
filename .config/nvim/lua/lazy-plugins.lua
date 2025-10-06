-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically

	require("kickstart.plugins.gitsigns"),
	require("kickstart.plugins.which-key"),
	require("kickstart.plugins.telescope"),
	require("kickstart.plugins.lspconfig"),
	require("kickstart.plugins.conform"),
	require("kickstart.plugins.blink-cmp"),
	require("kickstart.plugins.gruvbox-flat"),
	require("kickstart.plugins.todo-comments"),
	require("kickstart.plugins.mini"),
	require("kickstart.plugins.treesitter"),
	require("kickstart.plugins.render-markdown"),
	require("kickstart.plugins.nvim-colorizer"),
	require("kickstart.plugins.nvim-autopairs"),
	require("kickstart.plugins.nvim-ts-autotag"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
