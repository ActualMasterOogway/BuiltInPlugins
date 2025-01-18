local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SetMyGroups);
local v6 = require(l_Actions_0.SetAssetGroupData);
local v7 = {
    assetGroupData = {}, 
    groupsArray = {}
};
return v3.createReducer(v7, {
    [v5.name] = function(v8, v9) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            groupsArray = v9.groupsArray
        });
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 21 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            assetGroupData = v11.assetGroupData
        });
    end
});