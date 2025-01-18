local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)
local Types = require(Main.Src.Types)
local RoactRodux = require(Main.Packages.RoactRodux)

local Framework = require(Main.Packages.Framework)
local Dash = Framework.Dash
local findIndex = Dash.findIndex

local UI = Framework.UI
local Button = UI.Button
local Checkbox = UI.Checkbox
local SelectInput = UI.SelectInput
local Slider = UI.Slider
local Tooltip = UI.Tooltip
local Image = UI.Image

local Foundation = require(Main.Packages.Foundation)
local View = Foundation.View
local Text = Foundation.Text

local ThemeSwitcher = Framework.Style.ThemeSwitcher

local INPUT_WIDTH = 80
local SLIDER_WIDTH = 120
local SLIDER_HEIGHT = 36

local Actions = Main.Src.Actions
local Thunks = Main.Src.Thunks
local SelectTheme = require(Actions.SelectTheme)
local SelectPlatform = require(Actions.SelectPlatform)
local SetLive = require(Actions.SetLive)
local SetSettings = require(Actions.SetSettings)
local EmbedStorybook = require(Thunks.EmbedStorybook)
local GetStories = require(Thunks.GetStories)

local TopBar = React.PureComponent:extend("TopBar")

local THEMES = {
	"Default",
	"Light",
	"Dark",
}

local PLATFORM_STRING = "Default,Console,Desktop"
local ok, platforms = pcall(function()
	return game:GetFastString("DebugStorybookPlatformList")
end)
if ok then
	PLATFORM_STRING = platforms
end
local PLATFORMS = PLATFORM_STRING:split(",")

-- TODO (AleksandrSl 31/07/2024): Consider joining this and `local isRunningAsPlugin = typeof(props.Plugin:get().OpenScript) == "function"` check in InfoPanel
local isEmbedded = script:FindFirstAncestor("RunStorybook")

function TopBar:init()
	self.onToggleLive = function()
		self.props.setLive(not self.props.Live)
	end

	self.onToggleReducedMotion = function()
		local settings = {
			reducedMotion = not self.props.Settings.reducedMotion,
			preferredTransparency = self.props.Settings.preferredTransparency,
		}
		self.props.setSettings(settings)
	end

	self.onPreferredTransparencyChanged = function(value: number)
		local settings = {
			reducedMotion = self.props.Settings.reducedMotion,
			preferredTransparency = value,
		}
		self.props.setSettings(settings)
	end

	self.onEmbedStorybook = function()
		self.props.embedStorybook()
	end
end

function TopBar:render()
	local props = self.props

	return React.createElement("ScrollingFrame", {
		[React.Tag] = "X-RowM X-Middle X-PadS X-FitY",
		ScrollingDirection = Enum.ScrollingDirection.X,
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
	}, {
		UIFlexItem = React.createElement("UIFlexItem", {
			FlexMode = Enum.UIFlexMode.None,
		}),
		Collapse = React.createElement(Button, {
			Style = "Round",
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.fromOffset(32, 32),
			LayoutOrder = 2,
			OnClick = props.getStories,
		}, {
			Tooltip = React.createElement(Tooltip, {
				Text = "Collapse all stories",
			}),
			Icon = React.createElement(Image, {
				Size = UDim2.fromOffset(24, 24),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = "rbxasset://textures/DeveloperStorybook/Collapse.png",
			}),
		}),
		Embed = if not isEmbedded
			then React.createElement(Button, {
				Style = props.Embedded and "RoundPrimary" or "Round",
				Size = UDim2.fromOffset(32, 32),
				AnchorPoint = Vector2.new(1, 0),
				LayoutOrder = 4,
				OnClick = self.onEmbedStorybook,
			}, {
				Tooltip = React.createElement(Tooltip, {
					Text = "Embed Storybook in the place",
				}),
				Icon = React.createElement(Image, {
					Size = UDim2.fromOffset(24, 24),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = "rbxasset://textures/DeveloperStorybook/Embed.png",
				}),
			})
			else nil,
		Live = if not isEmbedded
			then React.createElement(Checkbox, {
				LayoutOrder = 5,
				Checked = props.Live,
				OnClick = self.onToggleLive,
				Text = "Live",
			})
			else nil,
		ThemeLabel = React.createElement(Text, {
			Text = "Theme:",
			LayoutOrder = 7,
			tag = "auto-xy text-align-x-left text-label-small",
		}),
		SelectTheme = React.createElement(SelectInput, {
			LayoutOrder = 8,
			Width = INPUT_WIDTH,
			SelectedIndex = findIndex(THEMES, function(theme)
				return theme == props.CurrentTheme
			end) or 1,
			Items = THEMES,
			OnItemActivated = props.selectTheme,
		}),
		PlatformLabel = React.createElement(Text, {
			Text = "Platform:",
			LayoutOrder = 9,
			tag = "auto-xy text-align-x-left text-label-small",
		}),
		SelectPlatform = React.createElement(SelectInput, {
			LayoutOrder = 10,
			Width = INPUT_WIDTH,
			SelectedIndex = findIndex(PLATFORMS, function(platform)
				return platform == props.Platform
			end) or 1,
			Items = PLATFORMS,
			OnItemActivated = props.selectPlatform,
		}),
		ReducedMotion = React.createElement(Checkbox, {
			LayoutOrder = 11,
			Checked = props.Settings.reducedMotion,
			OnClick = self.onToggleReducedMotion,
			Text = "Reduced Motion",
		}),
		PreferredTransparencyLabel = React.createElement(Text, {
			Text = "Preferred Transparency:",
			tag = "auto-xy text-align-x-left text-label-small",
			AnchorPoint = Vector2.new(0, 0),
			LayoutOrder = 12,
		}),
		PreferredTransparencySlider = React.createElement(View, {
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, SLIDER_WIDTH, 0, SLIDER_HEIGHT),
			LayoutOrder = 13,
		}, {
			Slider = React.createElement(Slider, {
				Min = 0,
				Max = 1,
				Value = props.Settings.preferredTransparency,
				OnValueChanged = self.onPreferredTransparencyChanged,
				VerticalDragTolerance = SLIDER_HEIGHT,
				ShowInput = true,
			}),
		}),
	})
end

return RoactRodux.connect(function(state)
	return {
		Embedded = state.Stories.embedded,
		CurrentTheme = state.Stories.theme,
		Live = state.Stories.live,
		Platform = state.Stories.platform,
		Settings = state.Stories.settings,
	}
end, function(dispatch)
	return {
		selectTheme = function(theme)
			ThemeSwitcher.setTheme(theme)
			dispatch(SelectTheme(theme))
		end,
		selectPlatform = function(platform)
			dispatch(SelectPlatform(platform))
		end,
		setLive = function(live: boolean)
			dispatch(SetLive(live))
		end,
		setSettings = function(settings: Types.Settings)
			dispatch(SetSettings(settings))
		end,
		embedStorybook = function()
			dispatch(EmbedStorybook())
		end,
		getStories = function()
			dispatch(GetStories())
		end,
	}
end)(TopBar)
