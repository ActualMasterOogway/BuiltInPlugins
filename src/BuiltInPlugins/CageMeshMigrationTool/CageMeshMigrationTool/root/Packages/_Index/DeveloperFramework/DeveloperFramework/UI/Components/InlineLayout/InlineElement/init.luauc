--[[
	Base abstract inline element implementation for non splittable non text nodes.
	Your element must be given a Width as a prop.

	Example:

	-- TextElement now can be used in InlineLayout.
	function ImageElement.new(props)
		return InlineElement.new(Image, props)
	end
]]
local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
type ReactElement<T> = React.Element<T>

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

export type InlineElement = {
	props: { [any]: any },
	getWidth: (self: InlineElement, credit: number) -> number,
	split: (self: InlineElement, width: number) -> (InlineElement, InlineElement),
	render: (self: InlineElement, id: string | number) -> (),
}

local InlineElement = {}
InlineElement.__index = InlineElement

function InlineElement.new(Element, props)
	local self = setmetatable({}, InlineElement)
	self.props = props
	self.Element = Element
	return self
end

function InlineElement:getWidth()
	return self.props.Size.Width.Offset
end

function InlineElement:split()
	return InlineElement.new(self.Element, join(self.props))
end

function InlineElement:render(id)
	return React.createElement(self.Element, Dash.assign(self.props, { id = id }))
end

return InlineElement
