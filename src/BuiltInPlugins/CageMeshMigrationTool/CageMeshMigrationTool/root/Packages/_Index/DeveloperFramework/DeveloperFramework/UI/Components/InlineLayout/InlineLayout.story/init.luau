local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
local InlineLayout = require(Framework.UI.Components.InlineLayout)
local TextElement = require(Framework.UI.Components.InlineLayout.TextElement)
local LinkElement = require(Framework.UI.Components.InlineLayout.LinkElement)
local ImageElement = require(Framework.UI.Components.InlineLayout.ImageElement)

return {
	stories = {
		Default = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						LayoutOrder = 2,
						Text = "Very long text Very long textVery long textVery long textVery long textVery long textVery long textVery long textVery long textVery long text",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
				},
			})
		end,
		DefaultUTF8 = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						LayoutOrder = 2,
						Text = "Очень длинный текст Очень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текст",
						TextSize = 16,
						Font = Enum.Font.BuilderSans,
					}),
				},
			})
		end,
		SeveralTextElements = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						Text = "Very long text Very long textVery long textVery long textVery long textVery long textVery long textVery long textVery long textVery long text. ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					TextElement.new({
						Text = "Очень длинный текст Очень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текстОчень длинный текст. ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					TextElement.new({
						Text = "Sehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange TextSehr lange Text",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
				},
			})
		end,
		WithLinks = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						Text = "Very long text Very long textVery long textVery long textVery long textVery long textVery long textVery long textVery long textVery long text. ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					LinkElement.new({
						OnClick = function()
							print("link clicked")
						end,
						Text = "Sehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange TextSehr lange Text. ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					TextElement.new({
						Text = "雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
				},
			})
		end,
		WithRichText = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						Text = "Very long text Very long textVery long textVery long textVery long textVery long textVery long textVery long textVery long textVery long text. ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
						TextStyle = {
							Bold = true,
						},
					}),
					LinkElement.new({
						OnClick = function()
							print("link clicked")
						end,
						Text = "Sehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange TextSehr lange Text.",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
						TextStyle = {
							Italic = true,
						},
					}),
					TextElement.new({
						Text = " 雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨 ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
						TextStyle = {
							Strike = true,
						},
					}),
				},
			})
		end,
		WithImage = function()
			return React.createElement(InlineLayout, {
				Elements = {
					TextElement.new({
						Text = "Very long text Very long textVery long textVery long textVery long textVery long textVery long textVery long textVery long textVery long text ",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					LinkElement.new({
						OnClick = function()
							print("link clicked")
						end,
						Text = "Sehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange Text Sehr lange TextSehr lange TextSehr lange Text",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
					ImageElement.new({
						Image = "rbxasset://textures/ui/common/robux_color@2x.png",
						Size = UDim2.fromOffset(100, 100),
					}),
					TextElement.new({
						Text = " 雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨雨",
						TextSize = 18,
						Font = Enum.Font.BuilderSans,
					}),
				},
			})
		end,
	},
}
