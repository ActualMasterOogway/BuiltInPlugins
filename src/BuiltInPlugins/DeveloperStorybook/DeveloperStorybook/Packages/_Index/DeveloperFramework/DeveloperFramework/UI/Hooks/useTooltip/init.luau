--!strict
--[[
	useTooltip is a hook that creates a tooltip an attaches it to a specific widget URI.
]]
local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
local ReactRoblox = require(Framework.Util.ReactRoblox)

local Types = require(Framework.Types)
type StudioUri = Types.StudioUri

local joinTags = require(Framework.Styling.joinTags)

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef

local ContextServices = require(Framework.ContextServices)
local Design = ContextServices.Design
local Plugin = ContextServices.Plugin

local Util = require(Framework.Util)
local counter = Util.counter
local TooltipSettings = require(script.TooltipSettings)

local FFlagUseTooltipSizeAttachmentFixes = require(Framework.SharedFlags.getFFlagUseTooltipSizeAttachmentFixes)()

type FIXME = any

local TOTAL_HORIZONTAL_PADDING = 12
local ICON_SIZE = 24

export type UseTooltipProps = {
	Uri: StudioUri,
	Icon: string?,
	Title: string?,
	Text: string?,
	Shortcuts: { string }?,
	Location: AttachmentLocation?,
}

export type AttachmentLocation = "Above" | "Below" | "Left" | "Right"

export type Props = UseTooltipProps & {
	Design: StyleSheet?,
	OnResize: (size: Vector2) -> (),
	-- TODO Remove when FFlagUseTooltipSizeAttachmentFixes is retired
	DEPRECATED_OnResize: (frame: Frame) -> (),
}

local function stringifyShortcuts(shortcuts: { string })
	local result = ""
	for i, shortcut in ipairs(shortcuts) do
		if i > 1 then
			result = result .. ", "
		end
		result = result .. shortcut
	end
	return result
end

local function getFrameSize(size: Vector2, textRef, titleRef, hasIcon: boolean): Vector2
	local largestSize = 0
	if textRef.current then
		largestSize = textRef.current.AbsoluteSize.X
	end
	if titleRef.current then
		largestSize = math.max(largestSize, titleRef.current.AbsoluteSize.X)
	end
	if hasIcon then
		largestSize += ICON_SIZE
	end
	size = Vector2.new(math.min(size.X, largestSize) + TOTAL_HORIZONTAL_PADDING, size.Y)
	return size
end

local function performDebouncedAction(delayTime: number, action: () -> ())
	TooltipSettings.uniqueTooltipId += 1
	local currentId = TooltipSettings.uniqueTooltipId
	delay(delayTime, function()
		if TooltipSettings.uniqueTooltipId == currentId then
			action()
		end
	end)
end

local function Tooltip(props: Props)
	local frameRef = useRef(nil :: Frame?)
	local textRef = useRef(nil :: TextLabel?)
	local titleRef = useRef(nil :: Frame?)
	local count = counter()
	useEffect(function()
		if FFlagUseTooltipSizeAttachmentFixes then
			if frameRef.current then
				local size = getFrameSize(frameRef.current.AbsoluteSize, textRef, titleRef, props.Icon ~= nil)
				props.OnResize(size)
			end
		elseif props.DEPRECATED_OnResize then
			if frameRef.current then
				props.DEPRECATED_OnResize(frameRef.current)
			end
		end
	end, { props.Title, props.Text, props.Icon })

	return React.createElement("Frame", {
		ref = frameRef,
		[React.Change.AbsoluteSize] = function(frame: Frame)
			if FFlagUseTooltipSizeAttachmentFixes then
				local size = getFrameSize(frame.AbsoluteSize, textRef, titleRef, props.Icon ~= nil)
				props.OnResize(size)
			else
				props.DEPRECATED_OnResize(frame)
			end
		end,
		[React.Tag] = (if FFlagUseTooltipSizeAttachmentFixes
			then "TooltipBackground X-RowSpace50 X-FitY X-PadTooltip X-Middle"
			else "TooltipBackground X-RowSpace50 X-Fit X-PadTooltip X-Middle") :: FIXME,
		Size = if FFlagUseTooltipSizeAttachmentFixes then UDim2.new(0, 1000, 0, 0) else nil, -- Set to very large size so text is able to wrap correctly.
	}, {
		Icon = if props.Icon
			then React.createElement("ImageLabel", {
				Image = props.Icon,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(ICON_SIZE, ICON_SIZE),
				LayoutOrder = count(),
			})
			else nil,
		Content = React.createElement("Frame", {
			LayoutOrder = count(),
			[React.Tag] = "Role-Surface X-Fit X-ColumnSpace25",
		}, {
			TitleFrame = React.createElement("Frame", {
				ref = if FFlagUseTooltipSizeAttachmentFixes then titleRef else nil,
				LayoutOrder = count(),
				[React.Tag] = "Role-Surface X-Fit X-RowSpace50",
			}, {
				Title = if props.Title
					then React.createElement("TextLabel", {
						LayoutOrder = count(),
						Text = props.Title,
						[React.Tag] = "X-Fit Text-Title",
					})
					else nil,
				Shortcuts = if props.Shortcuts
					then React.createElement("TextLabel", {
						LayoutOrder = count(),
						Text = stringifyShortcuts(props.Shortcuts),
						[React.Tag] = "X-Fit Text-Label",
					})
					else nil,
			}),
			Text = if props.Text
				then React.createElement("TextLabel", {
					ref = if FFlagUseTooltipSizeAttachmentFixes then textRef else nil,
					LayoutOrder = count(),
					Text = props.Text,
					[React.Tag] = joinTags(
						"Text-Label X-Fit",
						if FFlagUseTooltipSizeAttachmentFixes then "TooltipTextBounds" else nil
					),
				})
				else nil,
		}),
		StyleLink = React.createElement("StyleLink", {
			StyleSheet = props.Design,
		}),
	})
end

local panelGlobal = nil
local root = nil
local function loadTooltipPanel(plugin: Plugin)
	if panelGlobal then
		return panelGlobal
	end
	panelGlobal = plugin:CreateQWidgetPluginGui("Tooltip", {
		Id = "Tooltip",
		InitialEnabled = false,
		MinSize = Vector2.new(50, 50),
		Modal = false,
		Tooltip = true,
		Resizable = true,
		Size = Vector2.new(220, 224),
		Title = "Tooltip",
	})
	panelGlobal.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	root = ReactRoblox.createRoot(panelGlobal)
	return panelGlobal
end

local function showTooltip(plugin: Plugin, props: UseTooltipProps, design: StyleSheet?)
	local panel = loadTooltipPanel(plugin)
	local pluginUri = plugin:GetUri()
	local panelUri = join(pluginUri, {
		Category = "Panels",
		ItemId = "Tooltip",
	})
	local Panels = plugin:GetPluginComponent("Panels") -- :: Panels: this type does not exist in DF, but does in GE
	-- Draw the React UI for the Tooltip
	root:render(React.createElement(
		Tooltip,
		join(props, {
			Design = design,
			OnResize = if FFlagUseTooltipSizeAttachmentFixes
				then function(size: Vector2)
					Panels:SetSizeAsync(panelUri, size)
				end
				else nil,
			DEPRECATED_OnResize = if FFlagUseTooltipSizeAttachmentFixes
				then nil
				else function(frame: Frame)
					Panels:SetSizeAsync(panelUri, frame.AbsoluteSize)
				end,
		} :: Props)
	))

	local targetAnchorPoint = Vector2.new(0, 1)
	local subjectAnchorPoint = Vector2.new(0, 0)

	if FFlagUseTooltipSizeAttachmentFixes and props.Location then
		if props.Location == "Above" then
			targetAnchorPoint = Vector2.new(0, 0) -- target's top left
			subjectAnchorPoint = Vector2.new(0, 1) -- our bottom left
		elseif props.Location == "Below" then
			targetAnchorPoint = Vector2.new(0, 1) -- target's bottom left
			subjectAnchorPoint = Vector2.new(0, 0) -- our top left
		elseif props.Location == "Left" then
			targetAnchorPoint = Vector2.new(0, 0) -- target's top left
			subjectAnchorPoint = Vector2.new(1, 0) -- our top right
		elseif props.Location == "Right" then
			targetAnchorPoint = Vector2.new(1, 0) -- target's top right
			subjectAnchorPoint = Vector2.new(0, 0) -- our top left
		end
	end

	-- Position the Tooltip beneath the widget
	Panels:SetAttachmentAsync(panelUri, {
		TargetWidgetUri = props.Uri,
		TargetAnchorPoint = targetAnchorPoint,
		SubjectAnchorPoint = subjectAnchorPoint,
		Offset = Vector2.new(0, 0),
	})
	-- Debounce displaying the tooltip
	performDebouncedAction(TooltipSettings.showDelay, function()
		panel.Enabled = true
	end)
end

local function hideTooltip(plugin: Plugin)
	-- Debounce hiding the tooltip
	performDebouncedAction(TooltipSettings.hideDelay, function()
		local panel = loadTooltipPanel(plugin)
		panel.Enabled = false
		root:render(nil)
	end)
end

local function useTooltip(props: UseTooltipProps)
	local pluginContext = Plugin.use()
	local designContext = Design.use()
	local active = useRef(false)
	local memo = { props.Uri, props.Title, props.Icon, props.Text } :: { any }

	local show = useCallback(function()
		-- Ensure tooltip isn't already showing for this use
		if active.current then
			return
		end
		-- Ensure tooltips are enabled
		if TooltipSettings.disableAllTooltips then
			return
		end
		-- Ensure there actually is a tooltip to display
		if not props.Text then
			return
		end
		active.current = true
		local plugin = pluginContext:get()
		local design = designContext:get()
		showTooltip(plugin, props, design)
	end, memo)

	local hide = useCallback(function()
		-- Ensure tooltip is showing for this use
		if not active.current then
			return
		end
		active.current = false
		local plugin = pluginContext:get()
		hideTooltip(plugin)
	end, memo)
	return show, hide
end

return useTooltip
