--[[
	Base abstract inline element implementation that can split the text so it fits the provided width.
	It creates as many elements as needed to split the text so it fit, the element used is provided through contstructor.
	Supports utf8, but only if the symbols consist from one code point.

	Relies on the TextService to calculate text width, so won't work in the contexts where it's not available.

	Example:

	-- TextElement now can be used in InlineLayout.
	function TextElement.new(props)
		return BaseTextElement.new(TextLabel, props)
	end
]]
local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
type ReactElement<T> = React.Element<T>

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

export type BaseTextElementTextStyle = {
	Bold: boolean?,
	Italic: boolean?,
	Strike: boolean?,
}

export type BaseTextElementProps = {
	AutomaticSize: Enum.AutomaticSize?,
	Font: Font?,
	TextSize: number?,
	Text: string?,
	TextStyle: BaseTextElementTextStyle?,
}

local BaseTextElement = {}
BaseTextElement.__index = BaseTextElement

function BaseTextElement.new(Element, props)
	local self = setmetatable({}, BaseTextElement)
	self.props = props
	self.Element = Element
	return self
end

local TextService = game:GetService("TextService")

BaseTextElement.TextService = game:GetService("TextService")

function BaseTextElement:_setTextService(TextService)
	self.TextService = TextService
end

function BaseTextElement:getWidth()
	return self:_getWidth(self.props.Text)
end

local function getRichText(text: string, props: BaseTextElementTextStyle): string
	local richText = text
	if props.Bold then
		richText = `<b>{text}</b>`
	end
	if props.Italic then
		richText = `<i>{text}</i>`
	end
	if props.Strike then
		richText = `<s>{text}</s>`
	end
	return richText
end

function BaseTextElement:_getWidth(text: string)
	local params = Instance.new("GetTextBoundsParams")
	params.Font = Font.fromEnum(self.props.Font)
	params.Size = self.props.TextSize
	params.Text = text
	if self.props.TextStyle then
		params.Text = getRichText(text, self.props.TextStyle)
		params.RichText = true
	end
	return TextService:GetTextBoundsAsync(params).X
end

-- Returns index of the last byte of a codepoint located by the specified index
function codepointEnd(str: string, index: number): number
	local nextOffset = utf8.offset(str, index + 1)

	return if nextOffset then nextOffset - 1 else #str
end

local STEP = 1

function BaseTextElement:split(width: number)
	local length = utf8.len(self.props.Text)
	if length == nil then
		warn("Failed to get string length, it is probably malformed or non utf8")
		return self
	end
	-- Overall algorithm is
	-- 1. Do a rough approximation by assuming all glyphs have the same length
	local splitBy = math.max(math.floor(length * width / self:getWidth()), 1)
	local headText, headEndOffset
	local step, nextStep = nil

	local breakWhile = 0
	while breakWhile < 100 do
		-- 2. Travel up/down the string by the STEP constant until the direction has changed.
		--    If the text was initially longer than needed, we stop when it's no longer longer.
		--    We presume that getting exact the same length is almost impossible.
		--    Thus we finish when the direction changed.
		-- We take symbols from the start up to the splitBy index including it
		headEndOffset = codepointEnd(self.props.Text, splitBy)
		headText = string.sub(self.props.Text, 1, headEndOffset)
		local headTextWidth = self:_getWidth(headText)
		nextStep = if headTextWidth > width then -STEP else STEP

		if step and step ~= nextStep then
			-- 3. If we were travelling to the end of the string, rollback last step
			--    so we always have the resulting text less or equal to the desired width
			if nextStep < 0 then
				splitBy += nextStep
				headEndOffset = codepointEnd(self.props.Text, splitBy)
				headText = string.sub(self.props.Text, 1, headEndOffset)
			end
			break
		end
		step = nextStep
		splitBy += step
		breakWhile += 1
	end

	local tailText = string.sub(self.props.Text, headEndOffset + 1)

	-- The first element can be just updated with the new text, if dire need of small perf improvements.
	-- We are not making a copy of the props, so shoudn't rely on property being used by only one component
	-- e.g. passing a ref will be broken.
	return BaseTextElement.new(self.Element, join(self.props, { Text = headText })),
		BaseTextElement.new(self.Element, join(self.props, { Text = tailText }))
end

function BaseTextElement:render(id: string | number)
	local text = self.props.Text
	local hasRichText = false
	if self.props.TextStyle then
		hasRichText = true
		text = getRichText(self.props.Text, self.props.TextStyle)
	end
	return React.createElement(
		self.Element,
		Dash.join(self.props, { id = id, Text = text, RichText = hasRichText, AutomaticSize = Enum.AutomaticSize.XY })
	)
end

return BaseTextElement
