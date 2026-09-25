return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
				group = vim.api.nvim_create_augroup("VimtexCurrentFileMain", { clear = true }),
				pattern = "*.tex",
				callback = function(args)
					local file = args.file

					if file == "" then
						return
					end

					if args.event == "BufNewFile" then
						vim.b[args.buf].vimtex_main = vim.fn.fnamemodify(file, ":p")
						return
					end

					local ok, lines = pcall(vim.fn.readfile, file, "", 300)
					if not ok then
						return
					end

					for i = 1, math.min(#lines, 5) do
						if lines[i]:lower():match("tex%s*root") then
							return
						end
					end

					local has_documentclass = false
					local has_document = false
					for _, line in ipairs(lines) do
						if line:match("^%s*\\documentclass") and not line:match("{subfiles}") and not line:match("{standalone}") then
							has_documentclass = true
						end
						if line:match("^%s*\\begin%s*{%s*document%s*}") then
							has_document = true
						end
						if has_documentclass and has_document then
							vim.b[args.buf].vimtex_main = vim.fn.fnamemodify(file, ":p")
							return
						end
					end
				end,
			})

			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_quickfix_mode = 0

			if vim.fn.has("macunix") == 1 then
				if vim.fn.isdirectory("/Applications/Skim.app") == 1 then
					vim.g.vimtex_view_method = "skim"
				else
					vim.g.vimtex_view_method = "general"
					vim.g.vimtex_view_general_viewer = "open"
				end
			end
		end,
	},
}
