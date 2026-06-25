-- On Windows, don't let Mason auto-install a tool whose required toolchain isn't
-- on PATH: the install fails on every startup and spams the hit-enter prompt.
-- This is dynamic — once you install the toolchain (e.g. Go) and restart, the
-- tool is auto-installed again with no further config changes. macOS is untouched.
if vim.fn.has("win32") ~= 1 then
	return {}
end

-- tool -> executable that must exist for Mason to be able to build it
local requires = {
	-- Go toolchain
	delve = "go",
	gofumpt = "go",
	goimports = "go",
	-- Node/npm
	prettier = "npm",
	["markdown-toc"] = "npm",
	["markdownlint-cli2"] = "npm",
	-- Python/pip
	black = "python",
	sqlfluff = "python",
}

return {
	"mason-org/mason.nvim",
	opts = function(_, opts)
		opts.ensure_installed = vim.tbl_filter(function(tool)
			local need = requires[tool]
			return not need or vim.fn.executable(need) == 1
		end, opts.ensure_installed or {})
	end,
}
