local Framework = script:FindFirstAncestor("UI").Parent
local rule = require(Framework.Styling.createStyleRule)

return rule(".Component-ExpandablePane", {}, {
	rule("> .Header > .Arrow", {
		Image = "$ArrowRightImage",
		Size = UDim2.fromOffset(16, 16),
	}),
	rule(".Expanded > .Header > .Arrow", {
		Image = "$ArrowDownImage",
	}),
}, {
	ArrowSize = 16,
	Spacing = 10,
})
