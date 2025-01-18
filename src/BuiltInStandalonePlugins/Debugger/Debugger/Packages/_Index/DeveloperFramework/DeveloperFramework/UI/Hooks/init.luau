local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkRibbonHooks)();
local v3 = {
    useDialog = require(script.useDialog), 
    useDialogDetailsAction = require(script.useDialogDetailsAction), 
    useDialogWidget = require(script.useDialogWidget)
};
if v2 then
    v3 = v1.join(v3, {
        TooltipSettings = require(script.useTooltip.TooltipSettings), 
        useMenu = require(script.useMenu), 
        useTooltip = require(script.useTooltip), 
        useWidgets = require(script.useWidgets)
    });
end;
return v3;