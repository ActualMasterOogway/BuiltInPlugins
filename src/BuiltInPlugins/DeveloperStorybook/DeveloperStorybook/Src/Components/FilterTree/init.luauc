local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)
local RoactRodux = require(Main.Packages.RoactRodux)

local Framework = require(Main.Packages.Framework)

local UI = Framework.UI
local SearchBar = UI.SearchBar

local Foundation = require(Main.Packages.Foundation)
local View = Foundation.View

local Actions = Main.Src.Actions
local SetSearch = require(Actions.SetSearch)

local FilterTree = React.PureComponent:extend("FilterTree")

function FilterTree:init() end

function FilterTree:render()
	local props = self.props

	return React.createElement(View, {
		LayoutOrder = props.LayoutOrder,
		tag = "size-full-0 auto-y",
	}, {
		Search = React.createElement(SearchBar, {
			PlaceholderText = "Search...",
			Width = UDim.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.None,
			ShowSearchButton = false,
			ShowSearchIcon = true,
			OnTextChanged = props.setSearch,
		}),
	})
end

return RoactRodux.connect(nil, function(dispatch)
	return {
		setSearch = function(text: string)
			dispatch(SetSearch(text))
		end,
	}
end)(FilterTree)
