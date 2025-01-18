local Framework = script:FindFirstAncestor("UI").Parent
local rule = require(Framework.Styling.createStyleRule)

local SharedFlags = require(Framework.SharedFlags)
local FFlagDevFrameworkFixTextInputWidth = SharedFlags.getFFlagDevFrameworkFixTextInputWidth()

return rule(".Component-TextInput", {}, {
	rule(".Input", {
		ClipsDescendants = true,
	}),
	rule(">> TextBox", {
		Font = Enum.Font.SourceSans,
		TextXAlignment = Enum.TextXAlignment.Left,
		PlaceholderTextColor3 = "$TextDisabled",
		TextColor3 = "$TextPrimary",
		TextSize = "$InputTextSize",
	}),
	rule(".Compact >> TextBox", {
		TextSize = "$CompactInputTextSize",
	}),
	rule(".PropertyCellError >> TextBox", {
		TextColor3 = "$TextError",
	}),
}, {
	ExtraComponentSpacing = 8,
	Size = UDim2.new(1, 0, 0, 32),
	InputTextSize = 18,
	CompactInputTextSize = 14,
	HorizontalComponentSpacing = if FFlagDevFrameworkFixTextInputWidth then 10 else 8,
	VerticalComponentSpacing = if FFlagDevFrameworkFixTextInputWidth then 5 else 4,
})
