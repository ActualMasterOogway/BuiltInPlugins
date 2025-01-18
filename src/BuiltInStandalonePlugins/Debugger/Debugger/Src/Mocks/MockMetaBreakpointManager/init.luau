local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy)
    local v3 = {};
    setmetatable(v3, v2);
    v3.MetaBreakpointAdded = l_Signal_0.new();
    v3.MetaBreakpointAdded:Connect(function(v4) --[[ Line: 13 ]]
        -- upvalues: v3 (copy)
        v3.MockMetaBreakpointsById[v4.Id] = v4;
    end);
    v3.MetaBreakpointChanged = l_Signal_0.new();
    v3.MetaBreakpointSetChanged = l_Signal_0.new();
    v3.MetaBreakpointRemoved = l_Signal_0.new();
    v3.MockMetaBreakpointsById = {};
    v3.MockSetMetaBreakpointById = function(v5, v6) --[[ Line: 21 ]]
        -- upvalues: v3 (copy)
        v3.MockMetaBreakpointsById[v5] = v6;
    end;
    v3.deletedBreakpoints = {};
    return v3;
end;
v2.RemoveBreakpointById = function(v7, v8) --[[ Line: 29 ]] --[[ Name: RemoveBreakpointById ]]
    v7.deletedBreakpoints[v8] = true;
end;
v2.GetBreakpointById = function(v9, v10) --[[ Line: 33 ]] --[[ Name: GetBreakpointById ]]
    return v9.MockMetaBreakpointsById[v10];
end;
return v2;