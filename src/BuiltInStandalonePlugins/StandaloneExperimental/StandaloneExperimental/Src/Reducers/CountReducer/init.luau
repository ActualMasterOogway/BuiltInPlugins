local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Framework).Dash.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetCount);
return v1.createReducer({
    Count = 0
}, {
    [v4.name] = function(v5, v6) --[[ Line: 18 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v5, {
            Count = v6.count
        });
    end
});