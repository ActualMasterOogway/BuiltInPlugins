local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.MainSwitchReducer);
local v3 = require(l_Parent_0.Src.Reducers.CustomPolicySwitchReducer);
local v4 = require(l_Parent_0.Src.Reducers.LanguagesReducer);
local v5 = require(l_Parent_0.Src.Reducers.CountryRegionReducer);
local v6 = require(l_Parent_0.Src.Reducers.PoliciesReducer);
return function() --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v5 (copy), v3 (copy), v6 (copy)
    return v1.combineReducers({
        MainSwitch = v2, 
        Languages = v4, 
        CountryRegion = v5, 
        CustomPolicySwitch = v3, 
        Policies = v6
    });
end;