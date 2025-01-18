local Framework = script:FindFirstAncestor("UI").Parent
local rule = require(Framework.Styling.createStyleRule)

return rule(".Component-Markdown", {}, {
	rule(">> .Header ::UIPadding", {
		PaddingTop = UDim.new(0, 20),
	}),
	rule(">> .Paragraph ::UIPadding", {
		PaddingTop = UDim.new(0, 10),
	}),
	rule(">> .List ::UIPadding", {
		PaddingTop = UDim.new(0, 30),
	}, {
		rule(">> .ListItem ::UIPadding", {
			PaddingTop = UDim.new(0, 20),
		}),
	}),
	rule(">> .CodeBlock ::UIPadding", {
		PaddingTop = UDim.new(0, 10),
		PaddingBottom = UDim.new(0, 10),
	}),
})
