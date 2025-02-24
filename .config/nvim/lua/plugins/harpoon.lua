local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "[A]dd to [H]arpoon" })
		vim.keymap.set("n", "<leader>hh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Toggle [H]arpoon Menu" })

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				harpoon:list():select(i)
			end)
		end
	end,
}
