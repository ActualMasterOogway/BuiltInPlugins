--[[
	(USES STYLESHEETS, REQUIRES CHANGES)
	This component will be deprecated in future in favor of a stylesheet for the plain ImageLabel instance.
	An image.

	Optional Props:
		string Image: The image asset itself.
		UDim2 Size: size of the image
		Color3 ImageColor3: The color tint of the image.
		Vector2 AnchorPoint: The anchor point of the image.
		UDim2 Position: position of the image
		number Rotation: rotation of the image
		Enum.ScaleType ScaleType: The SaleType of the image (Fit, Crop, etc).
		Style Style: The style with which to render this component.
		StyleModifier StyleModifier: The StyleModifier index into Style.
		Enum.SizeConstraint SizeConstraint: the direction(s) that the image can be resized in.
		number LayoutOrder: LayoutOrder of the component.
		Stylizer Stylizer: A Stylizer ContextItem, which is provided via withContext.
		Vector2 ImageRectSize: partial pixel size of the image
		Vector2 ImageRectOffset: pixel offset for rendering part of image
		callback OnMouseEnter: function that's called when the mouse enters the image
		callback OnMouseLeave: function that's called when the mouse leaves the image
		number BackgroundTransparency: The transparency of the Image.

	Style Values:
		Vector2 AnchorPoint: The anchor point of the image.
		Color3 Color: The color tint of the image.
		number Transparency: The transparency of the image.
		string Image: The image asset itself.
		Enum.ScaleType ScaleType: The SaleType of the image (Fit, Crop, etc).
		Rect SliceCenter: The SliceCenter rect of the image, if it is ScaleType Slice.
		UDim2 Size: size of the image
		UDim2 Position: position of the image
		Vector2 ImageRectSize: partial pixel size of the image
		Vector2 ImageRectOffset: pixel offset for rendering part of image
]]

local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)
local ContextServices = require(Framework.UI.ContextServices)
local withContext = ContextServices.withContext
local prioritize = require(Framework.Util.prioritize)

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

local React = if Framework.Parent:FindFirstChild("React") then require(Framework.Parent.React) else nil
local supportsStyleSheets = require(Framework.Styling.supportsStyleSheets)
local joinTags = require(Framework.Styling.joinTags)

local Typecheck = require(Framework.Util.Typecheck)

local Image = Roact.PureComponent:extend("Image")
Typecheck.wrap(Image, script)

function Image:render()
	local props = self.props
	local style = if supportsStyleSheets then (props.Style or {}) else props.Stylizer
	local tags = if supportsStyleSheets then props[React.Tag] else nil

	local color = props.ImageColor3 or style.Color
	local transparency = style.Transparency
	local image = props.Image or style.Image
	local imageRectSize = prioritize(props.ImageRectSize, style.ImageRectSize)
	local imageRectOffset = prioritize(props.ImageRectOffset, style.ImageRectOffset)
	local scaleType = prioritize(props.ScaleType, style.ScaleType)
	local sizeConstraint = props.SizeConstraint
	local sliceCenter = style.SliceCenter
	local anchorPoint = props.AnchorPoint or style.AnchorPoint
	local position = props.Position or style.Position or (if supportsStyleSheets then nil else UDim2.new(0, 0, 0, 0))
	local size = props.Size or style.Size or (if supportsStyleSheets then nil else UDim2.new(1, 0, 1, 0))
	local layoutOrder = props.LayoutOrder
	local rotation = props.Rotation or style.Rotation
	local onMouseEnter = props.OnMouseEnter
	local onMouseLeave = props.OnMouseLeave

	return Roact.createElement(
		"ImageLabel",
		join(
			{
				AnchorPoint = anchorPoint,
				Size = size,
				Position = position,
				BackgroundTransparency = 1,
				ImageTransparency = transparency,
				ImageColor3 = color,
				BorderSizePixel = 0,
				Rotation = rotation,
				Image = image,
				ImageRectSize = imageRectSize,
				ImageRectOffset = imageRectOffset,
				ScaleType = scaleType,
				SliceCenter = sliceCenter,
				SizeConstraint = sizeConstraint,
				LayoutOrder = layoutOrder,
				[Roact.Event.MouseEnter] = onMouseEnter,
				[Roact.Event.MouseLeave] = onMouseLeave,
			},
			if supportsStyleSheets
				then {
					[React.Tag] = joinTags("Component-Image", tags),
				}
				else nil
		),
		props[Roact.Children]
	)
end

if not supportsStyleSheets then
	Image = withContext({
		Stylizer = ContextServices.Stylizer,
	})(Image)
end

return Image
