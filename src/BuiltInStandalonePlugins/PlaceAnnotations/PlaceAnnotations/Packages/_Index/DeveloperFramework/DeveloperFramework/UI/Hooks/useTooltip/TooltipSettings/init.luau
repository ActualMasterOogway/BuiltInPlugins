local v0 = {
    showDelay = game:GetFastFlag("FixTooltipShowDelay") and 0.3 or 1, 
    hideDelay = 0.3, 
    uniqueTooltipId = 0, 
    disableAllTooltips = false
};
v0.cancelShowTooltip = function() --[[ Line: 10 ]] --[[ Name: cancelShowTooltip ]]
    -- upvalues: v0 (copy)
    local l_v0_0 = v0;
    l_v0_0.uniqueTooltipId = l_v0_0.uniqueTooltipId + 1;
end;
return v0;