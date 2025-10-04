vim.g.gruvbox_flat_style = "hard"

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

require("options")
require("keymaps")
require("autocommands")
require("lazy-bootstrap")
require("lazy-plugins")


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
