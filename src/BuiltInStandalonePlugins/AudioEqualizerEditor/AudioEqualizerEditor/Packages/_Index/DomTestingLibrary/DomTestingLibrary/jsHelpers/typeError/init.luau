local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy)
    return (setmetatable({
        name = "TypeError", 
        message = v3 or "", 
        stack = debug.traceback(nil, 2)
    }, l_Error_0));
end;
return v2;