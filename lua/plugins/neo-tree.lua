return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		open_files_do_not_replace_types = { "Trouble", "qf", "edgy" },
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					-- '.git',
					-- '.DS_Store',
					-- 'thumbs.db',
				},
				never_show = {},
			},
		},
		window = {
			width = 25,
		},
	},
}
