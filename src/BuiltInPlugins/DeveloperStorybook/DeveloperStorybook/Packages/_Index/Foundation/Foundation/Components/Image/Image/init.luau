local Foundation = script:FindFirstAncestor("Foundation")
local Packages = Foundation.Parent
local Flags = require(Foundation.Utility.Flags)

local React = require(Packages.React)
local Cryo = require(Packages.Cryo)
local ReactIs = require(Packages.ReactIs)
local FoundationImages = require(Packages.FoundationImages)

local Interactable = require(Foundation.Components.Interactable)
local Images = FoundationImages.Images
type ImageSetImage = FoundationImages.ImageSetImage
local getScaledSlice = require(script.Parent.ImageSet.getScaledSlice)

local Types = require(Foundation.Components.Types)
local withDefaults = require(Foundation.Utility.withDefaults)
local useDefaultTags = require(Foundation.Utility.useDefaultTags)
local withGuiObjectProps = require(Foundation.Utility.withGuiObjectProps)
local useStyledDefaults = require(Foundation.Utility.useStyledDefaults)
local indexBindable = require(Foundation.Utility.indexBindable)
local GuiObjectChildren = require(Foundation.Utility.GuiObjectChildren)
type ColorStyle = Types.ColorStyle

local useStyleTags = require(Foundation.Providers.Style.useStyleTags)

type StateChangedCallback = Types.StateChangedCallback
type Bindable<T> = Types.Bindable<T>

export type Slice = {
	center: Rect?,
	scale: number?,
}

export type ImageRect = {
	offset: Bindable<Vector2>?,
	size: Bindable<Vector2>?,
}

type ImageProps = {
	slice: Slice?,
	imageRect: ImageRect?,
	imageStyle: ColorStyle?,

	Image: Bindable<string>?,
	ResampleMode: Bindable<Enum.ResamplerMode>?,
	ScaleType: Bindable<Enum.ScaleType>?,
	TileSize: Bindable<UDim2>?,
} & Types.GuiObjectProps & Types.CommonProps

local defaultProps = {
	AutoLocalize = false,
	AutoButtonColor = false,
	BorderSizePixel = 0,
	isDisabled = false,
}

local defaultTags = "gui-object-defaults"

local function Image(imageProps: ImageProps, ref: React.Ref<GuiObject>?)
	local defaultPropsWithStyles = if Flags.FoundationStylingPolyfill
		then useStyledDefaults("Image", imageProps.tag, defaultTags, defaultProps)
		else nil
	local props = withDefaults(
		imageProps,
		(if Flags.FoundationStylingPolyfill then defaultPropsWithStyles else defaultProps) :: typeof(defaultProps)
	)

	local isInteractable = props.onStateChanged ~= nil or props.onActivated ~= nil

	local image = props.Image
	local imageValue = if ReactIs.isBinding(image) then (image :: React.Binding<string>):getValue() else image :: string

	local isFoundationImage = imageValue ~= nil and imageValue:match("^%w+://.*$") == nil
	local asset = if isFoundationImage then Images[imageValue] else nil

	local imageRectOffset, imageRectSize = nil, nil
	if props.imageRect then
		imageRectOffset = props.imageRect.offset
		imageRectSize = props.imageRect.size
	end
	if asset then
		image = asset.Image
		imageRectOffset = asset.ImageRectOffset
		imageRectSize = asset.ImageRectSize
	end

	local sliceCenter, sliceScale, scaleType = nil, nil, props.ScaleType
	if props.slice then
		sliceCenter, sliceScale = props.slice.center, props.slice.scale
		if isFoundationImage then
			sliceCenter, sliceScale = getScaledSlice(sliceCenter, sliceScale)
		end
		scaleType = Enum.ScaleType.Slice
	end

	local tagsWithDefaults = useDefaultTags(props.tag, defaultTags)
	local tag = useStyleTags(tagsWithDefaults)

	local engineComponent = if isInteractable then "ImageButton" else "ImageLabel"

	local engineComponentProps = withGuiObjectProps(props, {
		AutoButtonColor = if engineComponent == "ImageButton" then props.AutoButtonColor else nil,
		Image = image,
		ImageColor3 = if props.imageStyle then indexBindable(props.imageStyle, "Color3") else nil,
		ImageTransparency = if props.imageStyle then indexBindable(props.imageStyle, "Transparency") else nil,
		ImageRectOffset = imageRectOffset,
		ImageRectSize = imageRectSize,
		ResampleMode = props.ResampleMode,
		ScaleType = scaleType,
		SliceCenter = sliceCenter,
		SliceScale = sliceScale,
		TileSize = props.TileSize,

		ref = ref,
		[React.Tag] = tag,
	})

	local component = if isInteractable then Interactable else engineComponent

	local componentProps = if isInteractable
		then Cryo.Dictionary.union(engineComponentProps, {
			component = engineComponent,
			onActivated = props.onActivated,
			onStateChanged = props.onStateChanged,
			stateLayer = props.stateLayer,
			isDisabled = props.isDisabled,
		})
		else engineComponentProps

	return React.createElement(component, componentProps, GuiObjectChildren(props))
end

return React.memo(React.forwardRef(Image))
