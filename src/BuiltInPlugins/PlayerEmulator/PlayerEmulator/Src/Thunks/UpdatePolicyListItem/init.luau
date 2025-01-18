local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Actions.UpdatePolicySettingStatus);
return function(v5, v6, v7) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), l_PlayerEmulatorService_0 (copy), v4 (copy)
    return function(v8) --[[ Line: 9 ]]
        -- upvalues: v5 (copy), v2 (ref), v6 (copy), v7 (copy), v3 (ref), l_PlayerEmulatorService_0 (ref), v4 (ref)
        local v9 = v8:getState();
        local l_allPolicies_0 = v9.Policies.allPolicies;
        local l_policySettingStatus_0 = v9.Policies.policySettingStatus;
        if l_allPolicies_0[v5] ~= nil and v2.List.find(l_allPolicies_0[v5], v6) ~= nil then
            if v2.List.find(l_policySettingStatus_0[v5], v6) then
                l_policySettingStatus_0[v5] = v2.List.removeValue(l_policySettingStatus_0[v5], v6);
            else
                table.insert(l_policySettingStatus_0[v5], v6);
            end;
            v7:SetSetting(v3.POLICY_SETTING_KEY, l_policySettingStatus_0);
            l_PlayerEmulatorService_0:SetEmulatedPolicyInfo(l_policySettingStatus_0);
            v8:dispatch(v4(l_policySettingStatus_0));
        end;
    end;
end;