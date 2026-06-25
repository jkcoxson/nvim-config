-- LazyVim's python extra pins `branch = "regexp"`, but venv-selector merged that
-- rewrite back into `main` and now raises an ERROR notification on every Python
-- file open telling you to switch. Track `main` as the plugin instructs.
return {
	"linux-cultist/venv-selector.nvim",
	branch = "main",
}
