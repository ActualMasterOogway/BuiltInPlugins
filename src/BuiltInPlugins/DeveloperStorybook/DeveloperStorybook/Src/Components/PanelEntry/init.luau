--[[
	An entry in the InfoPanel with a header and automatic size from contents.

	Required Props:
		string Header: The header text of this component.

	Optional Props:
		string Description: A description which displays beneath the header.
		number LayoutOrder: The sort order of this component.
]]

local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)
local Framework = require(Main.Packages.Framework)

local Dash = Framework.Dash
local mapOne = Dash.mapOne

local joinTags = Framework.Styling.joinTags

local Foundation = require(Main.Packages.Foundation)
local View = Foundation.View
local Text = Foundation.Text

local PanelEntry = React.PureComponent:extend("InfoPanel")

function PanelEntry:render()
	local props = self.props
	local header = props.Header
	local description = props.Description
	local layoutOrder = props.LayoutOrder
	local size = props.Size

	local contentChildren = props.children
	local hasChild = contentChildren and mapOne(contentChildren)
	local hasDescription = typeof(description) == "string" and description ~= ""

	local children = {
		Name = React.createElement(Text, {
			LayoutOrder = 1,
			Text = header,
			tag = joinTags(
				"text-wrap size-full-0 auto-y text-align-x-left",
				if props.IsTitle then "text-heading-medium" else "text-heading-small"
			),
		}),
		Description = hasDescription and React.createElement(Text, {
			LayoutOrder = 2,
			Text = description,
			tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left",
		}),
		Content = hasChild and React.createElement(View, {
			LayoutOrder = 3,
			tag = "size-full-0 padding-medium col gap-medium auto-y",
		}, contentChildren),
	}
	return React.createElement(View, {
		LayoutOrder = layoutOrder,
		Size = size,
		tag = "size-full-0 padding-medium col gap-medium auto-y",
	}, children)
end

return PanelEntry
