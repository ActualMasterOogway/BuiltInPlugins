local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v4 = {};
local v5 = setmetatable({}, {
    __index = l_Error_0
});
v5.__index = v5;
v5.new = function(v6, v7, v8) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), l_Boolean_0 (copy), v5 (copy)
    local l_stackTraceLimit_0 = l_Error_0.stackTraceLimit;
    if v8 ~= nil and v8 ~= 0 then
        l_Error_0.stackTraceLimit = math.max(v8, l_Boolean_0.toJSBoolean(l_stackTraceLimit_0) and l_stackTraceLimit_0 or 10);
    end;
    local v10 = setmetatable(l_Error_0.new(v6), v5);
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v10, v7);
    end;
    l_Error_0.stackTraceLimit = l_stackTraceLimit_0;
    return v10;
end;
v4.default = v5;
return v4;