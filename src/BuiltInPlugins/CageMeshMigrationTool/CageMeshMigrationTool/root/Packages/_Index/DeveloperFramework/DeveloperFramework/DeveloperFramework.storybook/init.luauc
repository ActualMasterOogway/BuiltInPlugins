--[[
	The DeveloperFramework storybook allows the Storybook plugin to discover the
	component stories in the library.

	- Stories of dependent libraries in Packages/_Index are excluded
	- The StoryMiddleware is used
	- Each story is decorated with the DocParser documentation, if available
]]
local Framework = script.Parent
local StoryMiddleware = require(Framework.UI.Stories.StoryMiddleware)
local DocParser = require(Framework.Util.Typecheck.DocParser)

return {
	name = "Developer Framework",
	exclude = { "_Index" },
	storyRoots = { Framework },
	mapStory = StoryMiddleware,
	mapDefinition = function(definition)
		local parser = DocParser.new(definition.name, definition.source.Parent)
		local ok, result = pcall(function()
			return parser:parse()
		end)
		if ok then
			definition.docs = result
			definition.summary = result.Summary
		end
		return definition
	end,
}
