local M = {}

M.commands = {
	-- `%` represent the current file name
	-- file type
	cpp = {
		-- command(s) to excute
		"makefile",
		"lua require('nvterm.terminal').send('g++ % && ./a.out %', 'horizontal')",
	},
	python = {
		"lua require('nvterm.terminal').send('python3 %', 'horizontal')",
	},
	javascript = {
		"lua require('nvterm.terminal').send('bun %', 'horizontal')",
	},
	sh = {
		"lua require('nvterm.terminal').send('bash %', 'horizontal')",
	},
	vim = {
		"source %",
		-- in new tab
	},
	lua = {
		"luafile %",
	},
	markdown = {
		"MarkdownPreview",
	},
	php = "lua require('nvterm.terminal').send('php %', 'horizontal')",
	go = "lua require('nvterm.terminal').send('go run %', 'horizontal')",
}

return M
