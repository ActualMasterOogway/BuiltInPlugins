local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Parent_0.Core.Actions.SetLiveSearch);
return (v2.createReducer({
    searchTerm = "", 
    results = {}
}, {
    [v4.name] = function(v5, v6) --[[ Line: 18 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v5, {
            results = v6.results, 
            searchTerm = v6.searchTerm
        });
    end
}));