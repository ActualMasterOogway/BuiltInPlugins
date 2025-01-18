local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)() then
    return require(l_script_FirstAncestor_0.Packages.Framework).UI.Hooks.TooltipSettings;
else
    local v1 = {
        showDelay = game:GetFastFlag("FixTooltipShowDelay") and 0.3 or 1, 
        hideDelay = 0.3, 
        uniqueTooltipId = 0, 
        disableAllTooltips = false
    };
    v1.cancelShowTooltip = function() --[[ Line: 18 ]] --[[ Name: cancelShowTooltip ]]
        -- upvalues: v1 (copy)
        local l_v1_0 = v1;
        l_v1_0.uniqueTooltipId = l_v1_0.uniqueTooltipId + 1;
    end;
    return v1;
end;