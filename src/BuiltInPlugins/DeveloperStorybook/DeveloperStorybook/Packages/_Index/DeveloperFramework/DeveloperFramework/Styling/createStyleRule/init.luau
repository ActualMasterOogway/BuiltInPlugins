local types = require(script.Parent.types)
type StyleProperties = types.StyleProperties

local shouldOrderStyleRulesByInsertion = require(script.Parent.shouldOrderStyleRulesByInsertion)

local FFlagDevFrameworkCreateStyleRuleAcceptNil = game:DefineFastFlag("DevFrameworkCreateStyleRuleAcceptNil", false)
local FFlagStyleRulePriorityOrderRefactor = game:GetFastFlag("StyleRulePriorityOrderRefactor")

local function splitInstancePropertiesFromStyleProperties(properties: StyleProperties?)
	if properties then
		local instanceProperties = {
			Priority = properties.StyleRule_Priority,
		}
		properties.StyleRule_Priority = nil
		return {
			InstanceProperties = instanceProperties,
			StyleProperties = properties,
		}
	end
	return nil
end

local function createStyleRule(
	selector: string,
	properties: StyleProperties?,
	children: { StyleRule | false | nil }?,
	tokens: { [string]: any }?
): StyleRule
	local style = Instance.new("StyleRule")
	style.Name = if selector == "" then "Default" else selector
	style.Selector = selector

	if FFlagStyleRulePriorityOrderRefactor then
		local splitProperties = splitInstancePropertiesFromStyleProperties(properties)
		if splitProperties then
			local ok, msg = pcall(function()
				style:SetProperties(splitProperties.StyleProperties)
			end)
			if not ok then
				warn(`Failed to load properties for StyleRule: {selector}`)
				warn(msg)
			end

			if splitProperties.InstanceProperties.Priority then
				ok, msg = pcall(function()
					style.Priority = splitProperties.InstanceProperties.Priority
				end)
				if not ok then
					warn(`Failed to set priority for StyleRule: {selector}`)
					warn(msg)
				end
			end
		end
	elseif properties then
		if properties.StyleRule_Priority ~= nil then
			warn(
				`StyleRule_Priority property used without FFlagStyleRulePriorityOrderRefactor enabled for StyleRule: {selector}`
			)
			properties.StyleRule_Priority = nil
		end

		local ok, msg = pcall(function()
			style:SetProperties(properties)
		end)
		if not ok then
			warn(`Failed to load properties for StyleRule: {selector}`)
			warn(msg)
		end
	end

	if children then
		local hasOnlyZeros
		if not pcall(function()
			hasOnlyZeros = shouldOrderStyleRulesByInsertion(children)
		end) then
			error(`Zero priorities mixed with non-zero priorities in StyleRule children for StyleRule: {selector}`)
		end
		for i, styleRule in children do
			if FFlagDevFrameworkCreateStyleRuleAcceptNil then
				if not styleRule then
					continue
				end
			end

			if FFlagStyleRulePriorityOrderRefactor and hasOnlyZeros then
				styleRule.Priority = i - 1
			end
			styleRule.Parent = style
		end
	end
	if tokens then
		for name, value in tokens do
			style:SetAttribute(name, value)
		end
	end
	return style
end

return createStyleRule
