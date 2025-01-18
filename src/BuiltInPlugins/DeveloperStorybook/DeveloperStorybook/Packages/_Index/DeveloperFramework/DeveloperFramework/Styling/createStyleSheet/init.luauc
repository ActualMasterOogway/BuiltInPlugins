local shouldOrderStyleRulesByInsertion = require(script.Parent.shouldOrderStyleRulesByInsertion)

local FFlagStyleRulePriorityOrderRefactor = game:GetFastFlag("StyleRulePriorityOrderRefactor")

local function createStyleSheet(
	name: string,
	rules: { StyleRule? }?,
	tokens: { [string]: any }?,
	derives: { StyleSheet }?
)
	local sheet = Instance.new("StyleSheet")
	sheet.Name = name
	if tokens then
		for name, token in tokens do
			sheet:SetAttribute(name, token)
		end
	end
	if rules then
		local hasOnlyZeros
		if not pcall(function()
			hasOnlyZeros = shouldOrderStyleRulesByInsertion(rules)
		end) then
			error(`Zero priorities mixed with non-zero priorities in StyleRule children for StyleSheet: {name}`)
		end
		for i, style in rules do
			if FFlagStyleRulePriorityOrderRefactor and hasOnlyZeros then
				style.Priority = i - 1
			end
			style.Parent = sheet
		end
	end
	if derives then
		sheet:SetDerives(derives)
	end
	return sheet
end

return createStyleSheet
