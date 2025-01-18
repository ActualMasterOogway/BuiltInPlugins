local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
local v5 = require(l_Actions_0.SetTutorialLimits);
return v3.createReducer({
    assetIds = nil, 
    positionOverride = nil, 
    scriptWarningOverride = false
}, {
    [v5.name] = function(_, v7) --[[ Line: 15 ]]
        return {
            assetIds = v7.assetIds, 
            positionOverride = v7.positionOverride, 
            scriptWarningOverride = v7.scriptWarningOverride
        };
    end
});