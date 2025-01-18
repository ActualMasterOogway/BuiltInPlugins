local Framework = script:FindFirstAncestor("UI").Parent

local StyleKey = require(Framework.Style.StyleKey)

local StyleModifier = require(Framework.Util.StyleModifier)

local BAR_HEIGHT = 6

return {
	KnobColor = StyleKey.DialogMainButton,
	KnobSize = Vector2.new(18, 18),
	BackgroundStyle = {
		Background = StyleKey.SliderBackground,
		CornerRadius = UDim.new(0, 8),
		Size = UDim2.new(1, 0, 0, BAR_HEIGHT),
	},
	ForegroundStyle = {
		Background = StyleKey.DialogMainButton,
		Color = StyleKey.DialogMainButton,
		CornerRadius = UDim.new(0, 8),
		[StyleModifier.Disabled] = {
			Background = StyleKey.DialogMainButtonDisabled,
			Color = StyleKey.DialogMainButtonDisabled,
		},
	},
}
