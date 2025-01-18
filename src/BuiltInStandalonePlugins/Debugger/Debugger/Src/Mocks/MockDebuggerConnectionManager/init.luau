local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.getAvailableConnection = function(_) --[[ Line: 8 ]] --[[ Name: getAvailableConnection ]]
    return nil;
end;
v2.new = function() --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    local v4 = {
        ConnectionStarted = l_Signal_0.new(), 
        ConnectionEnded = l_Signal_0.new(), 
        FocusChanged = l_Signal_0.new()
    };
    setmetatable(v4, v2);
    return v4;
end;
return v2;