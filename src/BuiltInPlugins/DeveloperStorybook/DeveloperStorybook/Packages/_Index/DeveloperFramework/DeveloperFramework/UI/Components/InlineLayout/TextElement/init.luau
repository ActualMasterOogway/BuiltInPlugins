local Framework = script:FindFirstAncestor("UI").Parent

local BaseTextElement = require(Framework.UI.Components.InlineLayout.BaseTextElement)
local TextLabel = require(Framework.UI.Components.TextLabel)
type BaseTextElementProps = BaseTextElement.BaseTextElementProps

local TextElement = {}

-- TODO: Update when we have TextLabel props type
function TextElement.new(props: BaseTextElementProps)
	return BaseTextElement.new(TextLabel, props)
end

return TextElement
