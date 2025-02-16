--[[
	A rectangular drop shadow that appears at the edges of an element.
	The children of the DropShadow appear within padding equal to the value of Radius.

	Optional Props:
		Enum.AutomaticSize AutomaticSize: Automatic sizing for the component.
		UDim2 Size: The size of the component.
		Style Style: The style with which to render this component.
		StyleModifier StyleModifier: The StyleModifier index into Style.
		number ZIndex: The render index of the shadow - should be behind the element it shadows.
		Stylizer Stylizer: A Stylizer ContextItem, which is provided via withContext.

	Style Values:
		Color3 Color: The color of the shadow.
		string Image: The image asset to use - this must be square and in a format amenable
			to 9-slice scaling. See textures/StudioSharedUI/dropShadow.png for an example.
		number ImageSize: The size of the image edges, in pixels.
		Vector2 Offset: The offset of the shadow.
		number Radius: The radius of the shadow, in pixels.
		number Transparency: The transparency of the shadow (ranges from 0 to 1).
]]
local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)
local ContextServices = require(Framework.UI.ContextServices)
local withContext = ContextServices.withContext
local t = require(Framework.Util.Typecheck.t)
local Typecheck = require(Framework.Util.Typecheck)

local DropShadow = Roact.PureComponent:extend("DropShadow")
Typecheck.wrap(DropShadow, script)

function DropShadow:render()
	local props = self.props
	local zIndex = props.ZIndex

	local style = props.Stylizer
	local color = style.Color

	local offset = style.Offset or Vector2.new()
	local transparency = style.Transparency
	assert(t.optional(t.numberConstrained(0, 1))(transparency), "Transparency must be nil or between 0 and 1")

	local image = style.Image
	local imageSize = style.ImageSize
	assert(t.numberPositive(imageSize), "ImageSize must be a positive number")
	local radius = style.Radius or 0
	local sliceSize = imageSize / 2
	-- Prevent a pixel artefact around the content
	local sliceScale = (radius + 1) / sliceSize
	local sliceCenter = Rect.new(sliceSize, sliceSize, sliceSize, sliceSize)

	local children = props[Roact.Children] or {}

	return Roact.createElement("ImageLabel", {
		Size = props.Size or UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = props.AutomaticSize,
		Position = UDim2.new(0.5, offset.X, 0.5, offset.Y),
		ZIndex = zIndex,

		BackgroundTransparency = 1,
		BorderSizePixel = 0,

		Image = image,
		ImageColor3 = color,
		ImageTransparency = transparency,

		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = sliceCenter,
		SliceScale = sliceScale,
	}, {
		ShadowPadding = Roact.createElement("UIPadding", {
			PaddingTop = UDim.new(0, radius),
			PaddingBottom = UDim.new(0, radius),
			PaddingLeft = UDim.new(0, radius),
			PaddingRight = UDim.new(0, radius),
		}),
		Roact.createFragment(children),
	})
end

DropShadow = withContext({
	Stylizer = ContextServices.Stylizer,
})(DropShadow)

return DropShadow
