local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    mainSwitchEnabled = false
}, {
    OnPlayerEmulationEnabledChanged = function(v2, v3) --[[ Line: 8 ]] --[[ Name: OnPlayerEmulationEnabledChanged ]]
        -- upvalues: v1 (copy)
        local l_enabled_0 = v3.enabled;
        return v1.Dictionary.join(v2, {
            mainSwitchEnabled = l_enabled_0
        });
    end
});