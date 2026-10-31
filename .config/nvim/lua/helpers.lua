local function send_makeprg_to_tmux()
	local cwd = vim.fn.getcwd()
	local tmux_cmd = vim.o.makeprg
	if tmux_cmd == "" then
		print("makeprg is empty")
		return
	end

	-- Build the tmux command to find a pane in the same cwd
	local find_pane_cmd = string.format(
		[[
        tmux list-panes -a -F '#{pane_id} #{pane_current_path} #{pane_active}' | \
        awk '$2=="%s" && $3=="0" {print $1; exit}'
    ]],
		cwd
	)

	local handle = io.popen(find_pane_cmd)
	local pane_id = handle:read("*a"):gsub("%s+", "")
	handle:close()

	if pane_id == "" then
		return
		-- -- No pane in cwd found, create a horizontal split and run
		-- os.execute(string.format("tmux split-window -h -c %q", cwd))
		-- -- Get the newly created pane id
		-- local handle2 = io.popen("tmux display-message -p '#{pane_id}'")
		-- pane_id = handle2:read("*a"):gsub("%s+", "")
		-- handle2:close()
	end

	-- Send the makeprg command to that pane
	local send_cmd = string.format("tmux send-keys -t %s %q Enter", pane_id, tmux_cmd)
	os.execute(send_cmd)
end

vim.keymap.set("n", "<leader><CR>", function()
	send_makeprg_to_tmux()
end)
-- vim.api.nvim_set_keymap("n", "<leader><CR>", , { noremap = true, silent = true })
