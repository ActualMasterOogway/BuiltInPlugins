local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
return v2.createReducer({
    allPolicies = {}, 
    allPolicySortedKeys = {}, 
    policySettingStatus = {}, 
    policyListItemsModuleExpanded = true
}, {
    LoadAllPolicyValues = function(v4, v5) --[[ Line: 12 ]] --[[ Name: LoadAllPolicyValues ]]
        -- upvalues: v1 (copy)
        local l_allPolicies_0 = v5.allPolicies;
        local l_allPolicySortedKeys_0 = v5.allPolicySortedKeys;
        return v1.Dictionary.join(v4, {
            allPolicies = l_allPolicies_0, 
            allPolicySortedKeys = l_allPolicySortedKeys_0
        });
    end, 
    UpdatePolicySettingStatus = function(v8, v9) --[[ Line: 22 ]] --[[ Name: UpdatePolicySettingStatus ]]
        -- upvalues: l_deepJoin_0 (copy)
        local l_policySettingStatus_0 = v9.policySettingStatus;
        return l_deepJoin_0(v8, {
            policySettingStatus = l_policySettingStatus_0
        });
    end, 
    UpdatePolicySettingListItemsModuleExpanded = function(v11, v12) --[[ Line: 30 ]] --[[ Name: UpdatePolicySettingListItemsModuleExpanded ]]
        -- upvalues: l_deepJoin_0 (copy)
        local l_policyListItemsModuleExpanded_0 = v12.policyListItemsModuleExpanded;
        return l_deepJoin_0(v11, {
            policyListItemsModuleExpanded = l_policyListItemsModuleExpanded_0
        });
    end
});