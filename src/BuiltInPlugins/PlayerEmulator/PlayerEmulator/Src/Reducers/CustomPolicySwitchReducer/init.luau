local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
return v2.createReducer({
    customPolicySwitchEnabled = false, 
    customPolicySwitchActive = false, 
    customPoliciesEnabled = false
}, {
    OnCustomPolicySwitchEnabledChanged = function(v4, v5) --[[ Line: 12 ]] --[[ Name: OnCustomPolicySwitchEnabledChanged ]]
        -- upvalues: v1 (copy)
        local l_enabled_0 = v5.enabled;
        return v1.Dictionary.join(v4, {
            customPolicySwitchEnabled = l_enabled_0
        });
    end, 
    OnCustomPolicyEnabledChanged = function(v7, v8) --[[ Line: 20 ]] --[[ Name: OnCustomPolicyEnabledChanged ]]
        -- upvalues: v1 (copy)
        local l_enabled_1 = v8.enabled;
        return v1.Dictionary.join(v7, {
            customPoliciesEnabled = l_enabled_1
        });
    end, 
    OnEmulatedCountryRegionChanged = function(v10, v11) --[[ Line: 28 ]] --[[ Name: OnEmulatedCountryRegionChanged ]]
        -- upvalues: l_PlayerEmulatorService_0 (copy), v1 (copy)
        local l_countryRegionCode_0 = v11.countryRegionCode;
        local v13 = l_PlayerEmulatorService_0:regionCodeWillHaveAutomaticNonCustomPolicies(l_countryRegionCode_0);
        return v1.Dictionary.join(v10, {
            customPolicySwitchActive = v13
        });
    end
});