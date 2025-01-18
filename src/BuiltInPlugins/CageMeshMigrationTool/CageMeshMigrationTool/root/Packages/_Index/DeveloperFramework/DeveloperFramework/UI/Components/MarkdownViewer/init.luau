--[[
	MarkdownViewer takes a markdown string as input and displays the rich content using a combination of RichText and inline UI components.

	Required Props:
		string Markdown: Markdown string to be displayed

	Optional Props:
		table Map: Specifies components to draw markdown nodes
		callback LinkCallback: A function to call when a link is clicked (url: string) -> ()
		table WrapperProps: A table of props to pass to the Frame that wraps the whole markdown content
		table TextProps: A table of props to pass to text elements
]]

local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
local Highlighter = require(Framework.Util.Highlighter)
local HighlighterTypes = require(Framework.Util.Highlighter.Types)
local Dash = require(Framework.Parent.Dash)

local TextLabel = require(Framework.UI.Components.TextLabel)
local BulletList = require(Framework.UI.Components.BulletList)
local TextWithLinks = require(Framework.UI.Components.TextWithLinks)
local Separator = require(Framework.UI.Components.Separator)

local Parser = require(Framework.Util.Markdown.DEPRECATED_Parser)
local Mapper = require(Framework.Util.Markdown.Mapper)

local DefaultTextSize = 18
local DefaultFont = Enum.Font.BuilderSans

local HeaderSizeCoefficients: { [number]: number } = {
	[1] = 3,
	[2] = 2.5,
	[3] = 2,
	[4] = 1.5,
}

local function headerSize(level: number, baseSize): number
	return (HeaderSizeCoefficients[level] or 1) * baseSize
end

local function createLinkMap(links: { Mapper.LinkType }, linkCallback: Mapper.LinkCallbackType)
	local linkMap = {}
	for _, link in ipairs(links) do
		linkMap[`[{link.Text}]`] = {
			LinkText = link.Text,
			LinkCallback = function()
				linkCallback(link.Url)
			end,
		}
	end
	return linkMap
end

local function createTextWithLinks(
	text: string,
	links: { Mapper.LinkType },
	linkCallback: Mapper.LinkCallbackType,
	textProps: Mapper.TextPropsType,
	tags: string?
): React.ReactElement
	return React.createElement(TextWithLinks, {
		TextProps = {
			RichText = true,
			TextSize = textProps.TextSize,
			Font = textProps.Font,
			[React.Tag] = tags or "",
		},
		Text = text,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		LinkMap = createLinkMap(links, linkCallback),
	})
end

local function headingHandler(title: string, level: number, textProps: Mapper.TextPropsType): React.ReactElement
	return React.createElement(TextLabel, {
		Text = title,
		RichText = true,
		TextSize = headerSize(level, textProps.TextSize),
		Font = textProps.Font,
		[React.Tag] = "X-Fit Wrap Left Header",
	})
end

local function paragraphHandler(
	text: string,
	links: { Mapper.LinkType },
	linkCallback: Mapper.LinkCallbackType,
	textProps: Mapper.TextPropsType
): React.ReactElement
	-- Adding padding directly to TextWithLinks breaks links alignment with text, thus wrapper is used
	return React.createElement("Frame", {
		[React.Tag] = "X-Fit X-Transparent X-Row Paragraph",
	}, {
		createTextWithLinks(text, links, linkCallback, textProps, "Left"),
	})
end

local function codeHandler(
	code: string,
	syntax: string?,
	colorScheme: HighlighterTypes.TokenColors?,
	textProps: Mapper.TextPropsType
): React.ReactElement
	if syntax == "lua" then
		code = Highlighter.highlight(code, colorScheme)
	end
	return React.createElement("Frame", {
		[React.Tag] = "X-Fit X-Transparent CodeBlock",
	}, {
		CodeWrapper = React.createElement("Frame", {
			BackgroundColor3 = Highlighter.getTokenColor("background"),
			BackgroundTransparency = 0,
			[React.Tag] = "X-Fit",
		}, {
			Code = React.createElement(TextLabel, {
				TextColor3 = Highlighter.getTokenColor("iden"),
				Text = code,
				RichText = true,
				TextSize = textProps.TextSize,
				Font = Enum.Font.Code,
				[React.Tag] = "X-Fit X-Top X-Pad Wrap Left",
			}),
		}),
	})
end

local function rulerHandler(): React.ReactElement
	return React.createElement(Separator, {})
end

local function listHandler(
	items: { Mapper.ListItemType },
	linkCallback: Mapper.LinkCallbackType,
	textProps: Mapper.TextPropsType
): React.ReactElement
	local function makeTextItem(text: string, links: { Mapper.LinkType }): React.ReactElement
		return createTextWithLinks(text, links, linkCallback, textProps, "X-Fit Wrap Left")
	end

	local function makeBulletList(level: number, items: { Mapper.ListItemType }): React.ReactElement
		local children = {}
		local subchildren = {}
		for i = #items, 1, -1 do
			local item = items[i]
			if item.Level == level then
				if #subchildren > 0 then
					table.insert(
						children,
						1,
						React.createElement("Frame", {
							[React.Tag] = "X-Fit X-Column X-Transparent",
						}, {
							Item = makeTextItem(item.Text, item.Links),
							List = makeBulletList(level + 1, subchildren),
						})
					)
					subchildren = {}
				else
					table.insert(children, 1, makeTextItem(item.Text, item.Links))
				end
			else
				table.insert(subchildren, 1, item)
			end
		end
		return React.createElement(BulletList, {
			Items = children,
			TextWrapped = true,
		})
	end

	return makeBulletList(0, items)
end

local function linkCallback(url: string)
	print(`[Defaullt Link Callback]: URL [{url}] is clicked`)
end

local defaultMap: Mapper.MapType = {
	heading = headingHandler,
	paragraph = paragraphHandler,
	code = codeHandler,
	list = listHandler,
	ruler = rulerHandler,
}

export type Props = {
	Markdown: string,
	Map: Mapper.MapType?,
	LinkCallback: Mapper.LinkCallbackType?,
	WrapperProps: { [string]: any }?,
	CodeColorScheme: HighlighterTypes.TokenColors?,
	TextProps: Mapper.TextPropsType?,
}

local function MarkdownViewer(props: Props)
	local map = React.useMemo(function()
		return Dash.join(defaultMap, props.Map or {})
	end, { props.Map })

	local children = React.useMemo(function()
		local textProps: Mapper.TextPropsType = {
			TextSize = if props.TextProps and props.TextProps.TextSize
				then props.TextProps.TextSize
				else DefaultTextSize,
			Font = if props.TextProps and props.TextProps.Font then props.TextProps.Font else DefaultFont,
		}
		local blocks = Mapper.map(
			map,
			Parser.parse(props.Markdown),
			props.LinkCallback or linkCallback,
			props.CodeColorScheme,
			textProps
		)
		for i, block in ipairs(blocks) do
			block.LayoutOrder = i
		end
		return blocks
	end, { props.Markdown, props.LinkCallback, map, props.CodeColorScheme, props.TextProps })

	return React.createElement(
		"Frame",
		Dash.join({
			[React.Tag] = "X-Column X-FitY X-Transparent Component-Markdown",
		}, props.WrapperProps or {}),
		children
	)
end

return MarkdownViewer
