local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Framework).Dash.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetCount);
local v5 = {
    Count = 0
};
return v1.createReducer(v5, {
    [v4.name] = function(v6, v7) --[[ Line: 21 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v6, {
            Count = v7.count
        });
    end
});