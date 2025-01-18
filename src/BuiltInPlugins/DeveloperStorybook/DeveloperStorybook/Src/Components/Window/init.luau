local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)

local Framework = require(Main.Packages.Framework)

local UI = Framework.UI
local SplitPane = UI.SplitPane

local FilterTree = require(Main.Src.Components.FilterTree)
local StoryTree = require(Main.Src.Components.StoryTree)
local TopBar = require(Main.Src.Components.TopBar)
local InfoPanel = require(Main.Src.Components.InfoPanel)

local Foundation = require(Main.Packages.Foundation)
local useStyleTags = Foundation.Hooks.useStyleTags
local View = Foundation.View

local function ContentPanel()
	return React.createElement(View, {
		tag = "col flex-fill size-full-full",
	}, {
		React.createElement(TopBar, {
			LayoutOrder = 1,
		}),
		React.createElement(InfoPanel, {
			LayoutOrder = 2,
		}),
	})
end

type SideBarProps = {
	topPadding: number?,
}

local function SideBar(props: SideBarProps)
	local padding = props.topPadding or 0
	return React.createElement(View, {
		Position = UDim2.new(0, 0, 0, padding),
		Size = UDim2.new(1, 0, 1, -padding),
		tag = "padding-small col gap-medium flex-fill bg-surface-100",
	}, {
		FilterInput = React.createElement(FilterTree, {
			LayoutOrder = 1,
		}),
		Tree = React.createElement(StoryTree, {
			LayoutOrder = 2,
		}),
	})
end

function Window(props: { sideBarPadding: number? })
	local tag = useStyleTags("bg-surface-0")

	local paneSizes, setPaneSizes = React.useState({
		UDim.new(0, 300),
		UDim.new(1, -300),
	})

	return React.createElement(SplitPane, {
		ClampSize = true,
		UseDeficit = true,
		MinSizes = {
			UDim.new(0, 100),
			UDim.new(0, 100),
		},
		OnSizesChange = setPaneSizes,
		Sizes = paneSizes,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		[React.Tag] = tag,
	}, {
		React.createElement(SideBar, {
			topPadding = props.sideBarPadding,
		}),
		React.createElement(ContentPanel),
	})
end

return Window
