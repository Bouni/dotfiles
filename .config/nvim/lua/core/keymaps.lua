vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

require("key-menu").set("n", "<Space>")
require("key-menu").set("n", "g")

-- clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlight" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete single char without copy" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "increment" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement" })

-- window management
require("key-menu").set("n", "<leader>s", { desc = "split" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "split windows equal width & height" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle split window maximization" })

require("key-menu").set("n", "<leader>t", { desc = "tabs" })
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "toggle NvimTree" })

keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end)

-- telescope
keymap.set(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files<cr>",
	{ desc = "find files within current working directory, respects .gitignore" }
)
keymap.set(
	"n",
	"<leader>fs",
	"<cmd>Telescope live_grep<cr>",
	{ desc = "find string in current working directory as you type" }
)
keymap.set(
	"n",
	"<leader>fc",
	"<cmd>Telescope grep_string<cr>",
	{ desc = "find string under cursor in current working directory" }
)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "list open buffers in current neovim instance" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "list available help tags" })

-- telescope git commands (not on youtube nvim video)
require("key-menu").set("n", "<leader>g", { desc = "Telescope git commands" })
keymap.set(
	"n",
	"<leader>gc",
	"<cmd>Telescope git_commits<cr>",
	{ desc = "list all git commits (use <cr> to checkout) ['gc' for git commits]" }
)
keymap.set(
	"n",
	"<leader>gfc",
	"<cmd>Telescope git_bcommits<cr>",
	{ desc = "list git commits for current file/buffer (use <cr> to checkout) ['gfc' for git file commits]" }
)
keymap.set(
	"n",
	"<leader>gb",
	"<cmd>Telescope git_branches<cr>",
	{ desc = "list git branches (use <cr> to checkout) ['gb' for git branch]" }
)
keymap.set(
	"n",
	"<leader>gs",
	"<cmd>Telescope git_status<cr>",
	{ desc = "list current changes per file with diff preview ['gs' for git status]" }
)
