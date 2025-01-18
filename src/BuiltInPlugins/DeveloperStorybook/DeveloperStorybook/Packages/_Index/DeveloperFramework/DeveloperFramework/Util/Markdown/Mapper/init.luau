local Framework = script.Parent.Parent.Parent
local React = require(Framework.Util.React)
local Parser = require(Framework.Util.Markdown.DEPRECATED_Parser)
local HighlighterTypes = require(Framework.Util.Highlighter.Types)

local Mapper = {}

export type ListItemType = {
	Text: string,
	Level: number,
	Symbol: string,
}

export type LinkType = Parser.LinkType
export type LinkCallbackType = (string) -> ()
export type TextPropsType = {
	TextSize: number,
	Font: Enum.Font,
}

export type MapType = {
	heading: (title: string, level: number, textProps: TextPropsType) -> React.ReactElement,
	paragraph: (
		text: string,
		links: { LinkType },
		linkCallback: LinkCallbackType,
		textProps: TextPropsType
	) -> React.ReactElement,
	code: (
		code: string,
		syntax: string?,
		colorScheme: HighlighterTypes.TokenColors?,
		textProps: TextPropsType
	) -> React.ReactElement,
	list: (items: { ListItemType }, linkCallback: LinkCallbackType, textProps: TextPropsType) -> React.ReactElement,
	ruler: () -> React.ReactElement,
}

function Mapper.map(
	map: MapType,
	blocks,
	linkCallback: LinkCallbackType,
	colorScheme: HighlighterTypes.TokenColors?,
	textProps: TextPropsType
): { React.ReactElement }
	local elements = {}
	for blockType, block in blocks do
		if blockType == Parser.BlockType.Heading then
			table.insert(elements, map.heading(block.Text, block.Level, textProps))
		elseif blockType == Parser.BlockType.Paragraph then
			table.insert(elements, map.paragraph(block.Text, block.Links, linkCallback, textProps))
		elseif blockType == Parser.BlockType.Code then
			table.insert(elements, map.code(block.Code, block.Syntax, colorScheme, textProps))
		elseif blockType == Parser.BlockType.List then
			table.insert(elements, map.list(block.Lines, linkCallback, textProps))
		elseif blockType == Parser.BlockType.Ruler then
			table.insert(elements, map.ruler())
		end
	end
	return elements
end

return Mapper
