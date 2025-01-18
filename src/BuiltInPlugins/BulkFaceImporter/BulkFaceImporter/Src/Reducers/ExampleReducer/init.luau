local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ExampleAction);
return (v1.createReducer({
    DefaultStateObject = ""
}, {
    [v4.name] = function(v5, v6) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            DefaultStateObject = v6.something
        });
    end
}));