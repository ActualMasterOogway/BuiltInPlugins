--[[
    (USES STYLESHEETS, REQUIRES CHANGES)
	A button that displays a dropdown menu with options for a list and grid view,
	and an optional slider for setting the grid size. Passes the selected view type
	and grid size to the parent component through callbacks. Note that the parent
	component is responsible for managing the rendering of the list vs. grid.

	For now, the only view types it expects are list and grid, so we use a bool flag.

	By default does not label the view type icons, but can be configured to do so.

	Required Props:
		callback OnGridTileSizeChanged: Called when the grid size slider changes.
		callback OnViewTypeSelected: Called when the view type is selected.
		ViewType | number Default: The default viewtype to use

	Optional Props:
		boolean HideSlider: Whether to hide the grid size slider.
		boolean HideLabels: Whether to hide labels for the view type icons.
		number DefaultGridTileSize: Sets the default slider value.
		number MinGridTileSize: The minimum grid size value.
		number MaxGridTileSize: The maximum grid size value.
		number LayoutOrder: The LayoutOrder of the component.
]]

local Framework = script:FindFirstAncestor("UI").Parent

local ContextServices = require(Framework.ContextServices)
local Localization = ContextServices.Localization

local React = if Framework.Parent:FindFirstChild("React") then require(Framework.Parent.React) else ""
local hasTag = require(Framework.Styling.hasTag)
local joinTags = require(Framework.Styling.joinTags)

local Resources = require(Framework.Resources)
local LOCALIZATION_PROJECT_NAME = Resources.LOCALIZATION_PROJECT_NAME

local Dash = require(Framework.Parent.Dash)

local Pane = require(Framework.UI.Components.Pane)
local SelectInput = require(Framework.UI.Components.SelectInput)
local ViewTypeButton = require(Framework.UI.Components.ViewTypeButton)
local ViewType = require(Framework.UI.Components.ViewTypeButton.ViewType)

local useState = React.useState

local styles = require(script.styles)

local getFFlagDevFrameworkViewTypeSelectorUpdate =
	require(Framework.SharedFlags.getFFlagDevFrameworkViewTypeSelectorUpdate)
local getFFlagDevFrameworkViewTypeSelectorIcons =
	require(Framework.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons)

export type ViewType = ViewType.ViewType

export type Props = {
	OnGridTileSizeChanged: (gridTileSize: number) -> (),
	OnViewTypeSelected: (viewType: ViewType) -> (),
	Default: ViewType | number,
	HideSlider: boolean?,
	HideLabels: boolean?,
	DefaultGridTileSize: number?,
	MinGridTileSize: number?,
	MaxGridTileSize: number?,
	LayoutOrder: number?,
}

type InputItem = {
	Id: any,
	Label: string,
}

local function getViewTypeAsString(viewType: ViewType): string
	local switch = {
		[ViewType.List] = "List",
		[ViewType.Grid] = "Grid",
		[ViewType.Unsupported] = "Unsupported",
	}
	return switch[viewType] or "Unsupported"
end

local function createInputItems(localization: any): { InputItem }
	local viewTypes = ViewType.allValues()
	table.remove(viewTypes, ViewType.Unsupported.rawValue())
	return Dash.map(viewTypes, function(viewType: ViewType)
		return {
			Id = viewType,
			Label = localization:getProjectText(
				LOCALIZATION_PROJECT_NAME,
				"ViewTypeSelector",
				getViewTypeAsString(viewType)
			),
		}
	end)
end

local function ViewTypeSelector(props: Props)
	assert(React ~= "", "You must be using non-legacy React in order to use ViewTypeSelector")
	local localization = Localization:use()
	local tags = props[React.Tag] or ""
	local items = createInputItems(localization)

	local default = if type(props.Default) == "number" then ViewType.fromRawValue(props.Default) else props.Default
	local selectedId, setSelectedId = useState(default or ViewType.List)

	local function renderItem(item: InputItem, index: number, activated: (InputItem) -> ())
		local isGrid = item.Id == ViewType.Grid
		local viewTypeTag = if isGrid then "Grid" else ""
		local iconTag = if props.HideLabels and props.HideSlider then "Icon" else ""
		return React.createElement(ViewTypeButton, {
			ViewType = item.Id,
			Text = if not props.HideLabels then item.Label else "",
			GridTileSize = props.DefaultGridTileSize,
			OnGridTileSizeChanged = if isGrid then props.OnGridTileSizeChanged else nil,
			OnClick = activated,
			LayoutOrder = index,
			MinGridTileSize = props.MinGridTileSize,
			MaxGridTileSize = props.MaxGridTileSize,
			HasSlider = not props.HideSlider and item.Id == ViewType.Grid,
			[React.Tag] = `{viewTypeTag} {iconTag}`,
		})
	end

	local iconOnly = hasTag(props[React.Tag], "IconOnly")
	local expandIcon = nil
	if getFFlagDevFrameworkViewTypeSelectorIcons() then
		if selectedId == ViewType.Grid then
			expandIcon = "Grid"
		else
			expandIcon = "List"
		end
	else
		if iconOnly then
			if selectedId == ViewType.Grid then
				expandIcon = styles:GetAttribute("GridIcon")
			else
				expandIcon = styles:GetAttribute("ListIcon")
			end
		end
	end

	return React.createElement(Pane, {
		LayoutOrder = props.LayoutOrder,
		[React.Tag] = joinTags(
			`Component-ViewTypeSelector`,
			if not getFFlagDevFrameworkViewTypeSelectorIcons() then nil else expandIcon,
			tags
		),
	}, {
		Input = React.createElement(SelectInput, {
			ExpandIcon = if not getFFlagDevFrameworkViewTypeSelectorIcons()
					and getFFlagDevFrameworkViewTypeSelectorUpdate()
				then expandIcon
				else nil,
			Items = items,
			Icons = if not getFFlagDevFrameworkViewTypeSelectorIcons()
				then {
					styles:GetAttribute("ListIcon"),
					styles:GetAttribute("GridIcon"),
				}
				else nil,
			UseAutoWidth = true, -- dropdown menu items currently size manually based on props
			Size = if getFFlagDevFrameworkViewTypeSelectorUpdate() and iconOnly
				then styles:GetAttribute("SizeIconOnly")
				else styles:GetAttribute("SizeDefault"), -- SelectInput is wrapped by a Pane that only changes size if set manually through props
			HideText = true,
			LayoutOrder = props.LayoutOrder,
			OnRenderItem = renderItem,
			SelectedId = if getFFlagDevFrameworkViewTypeSelectorUpdate()
				then selectedId
				else (props.Default or ViewType.List),
			OnItemActivated = function(item: InputItem)
				if getFFlagDevFrameworkViewTypeSelectorUpdate() then
					setSelectedId(item.Id)
				end
				props.OnViewTypeSelected(item.Id)
			end,
			ShowSelection = if getFFlagDevFrameworkViewTypeSelectorUpdate() then not iconOnly else nil,
			[React.Tag] = if not getFFlagDevFrameworkViewTypeSelectorIcons() then nil else `{expandIcon} HasIcon`,
		}),
	})
end

return ViewTypeSelector
