--!strict
local Framework = script:FindFirstAncestor("UI").Parent

local Dash = require(Framework.Parent.Dash)

local FFlagDevFrameworkRibbonHooks = require(Framework.SharedFlags.getFFlagDevFrameworkRibbonHooks)()

local hooks = {
	useDialog = require(script.useDialog),
	useDialogDetailsAction = require(script.useDialogDetailsAction),
	useDialogWidget = require(script.useDialogWidget),
}

if FFlagDevFrameworkRibbonHooks then
	hooks = Dash.join(hooks, {
		TooltipSettings = require(script.useTooltip.TooltipSettings),
		useMenu = require(script.useMenu),
		useTooltip = require(script.useTooltip),
		useWidgets = require(script.useWidgets),
	})
end

return hooks
