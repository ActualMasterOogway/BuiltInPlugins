local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Src.Actions.NetworkError);
local v5 = {
    networkError = nil, 
    networkErrorAction = nil
};
return v3.createReducer(v5, {
    [v4.name] = function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            networkError = v7.response, 
            networkErrorAction = v7.networkErrorAction
        });
    end
});