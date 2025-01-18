local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.UpdateSearchTerm);
return (v1.createReducer("", {
    [v3.name] = function(_, v5) --[[ Line: 15 ]]
        return v5.searchTerm;
    end
}));