local Framework = script:FindFirstAncestor("UI").Parent

local StyleKey = require(Framework.Style.StyleKey)

local StyleModifier = require(Framework.Util.StyleModifier)

local Image = require(Framework.UI.Components.Image)

return {
	Padding = 6,
	ImageSize = UDim2.new(0, 20, 0, 20),
	BackgroundStyle = {
		Background = Image,
		BackgroundStyle = {
			Image = "rbxasset://textures/GameSettings/RadioButton.png",
			Color = StyleKey.MainBackground,
		},
		[StyleModifier.Selected] = {
			BackgroundStyle = {
				Image = "rbxasset://textures/GameSettings/RadioButton.png",
				Color = StyleKey.MainBackground,
			},
			Foreground = Image,
			ForegroundStyle = {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png",
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0.4, 0, 0.4, 0),
			},
		},
		[StyleModifier.Disabled] = {
			BackgroundStyle = {
				Image = "rbxasset://textures/GameSettings/RadioButton.png",
				Color = StyleKey.MainBackground,
			},
		},
		[StyleModifier.Indeterminate] = {
			BackgroundStyle = {
				Image = "rbxasset://textures/GameSettings/RadioButton.png",
				Color = StyleKey.MainBackground,
			},
			Foreground = Image,
			ForegroundStyle = {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = StyleKey.RadioButtonDisabledImage,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0.4, 0, 0.4, 0),
			},
		},
	},
}
