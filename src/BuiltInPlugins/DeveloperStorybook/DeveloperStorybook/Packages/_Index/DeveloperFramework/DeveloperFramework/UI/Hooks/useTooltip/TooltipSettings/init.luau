local FFlagFixTooltipShowDelay = game:GetFastFlag("FixTooltipShowDelay")

local TooltipSettings = {
	showDelay = if FFlagFixTooltipShowDelay then 0.3 else 1,
	hideDelay = 0.3,
	uniqueTooltipId = 0,
	disableAllTooltips = false,
}

function TooltipSettings.cancelShowTooltip()
	TooltipSettings.uniqueTooltipId += 1
end

return TooltipSettings
