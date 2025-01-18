local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ExampleAction);
return (v1.createReducer({
    DefaultStateObject = ""
}, {
    [v4.name] = function(v5, v6) --[[ Line: 26 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v5, {
            DefaultStateObject = v6.something
        });
    end
}));