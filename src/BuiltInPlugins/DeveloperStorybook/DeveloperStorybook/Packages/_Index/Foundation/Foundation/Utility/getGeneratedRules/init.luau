local Foundation = script:FindFirstAncestor("Foundation")

local Theme = require(Foundation.Enums.Theme)
local Device = require(Foundation.Enums.Device)
type Theme = Theme.Theme
type Device = Device.Device

local function getGeneratedRules(theme: Theme, device: Device, colorUpdate: boolean): any
	local themeRules, sizeRules
	local commonRules = require(Foundation.Generated.StyleRules.Common)

	if colorUpdate then
		if theme == Theme.Dark then
			themeRules = require(Foundation.Generated.StyleRules["Dark-Foundation"])
		elseif theme == Theme.Light then
			themeRules = require(Foundation.Generated.StyleRules["Light-Foundation"])
		end
	else
		if theme == Theme.Dark then
			themeRules = require(Foundation.Generated.StyleRules["Dark-UIBlox"])
		elseif theme == Theme.Light then
			themeRules = require(Foundation.Generated.StyleRules["Light-UIBlox"])
		end
	end

	if device == Device.Console then
		sizeRules = require(Foundation.Generated.StyleRules.Console)
	else
		sizeRules = require(Foundation.Generated.StyleRules.Desktop)
	end

	if not themeRules or not sizeRules or not commonRules then
		return {}
	end

	local combinedRules = table.clone(sizeRules)

	for key, value in commonRules do
		combinedRules[key] = value
	end

	for key, value in themeRules do
		combinedRules[key] = value
	end

	return combinedRules
end

return getGeneratedRules
