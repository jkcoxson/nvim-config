return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if vim.fn.has("win32") == 1 then
				-- cc/gcc/clang on this machine all resolve to Cygwin, which links the
				-- compiled parsers against cygwin1.dll. Loading that runtime into the
				-- native x64 nvim.exe makes treesitter parsers segfault or spin (hang).
				-- Force the clean MinGW-w64 compiler (native PE, links msvcrt/ucrt only).
				-- macOS is unaffected (clang there is fine).
				require("nvim-treesitter.install").compilers = { "x86_64-w64-mingw32-gcc" }
			end
			return opts
		end,
	},
}
