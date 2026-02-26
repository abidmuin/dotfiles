-- lua/plugins/comment.lua

return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("Comment").setup()
	end,
}

