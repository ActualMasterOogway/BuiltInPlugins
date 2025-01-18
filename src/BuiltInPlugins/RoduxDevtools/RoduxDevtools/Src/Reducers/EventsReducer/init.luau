local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.UpdateEvents);
local v5 = require(l_Actions_0.ClearEvents);
return (v1.createReducer({}, {
    [v4.name] = function(v6, v7) --[[ Line: 17 ]]
        -- upvalues: v2 (copy)
        local l_events_0 = v7.events;
        return v2.join(v6, l_events_0);
    end, 
    [v5.name] = function(_, _) --[[ Line: 22 ]]
        return {};
    end
}));