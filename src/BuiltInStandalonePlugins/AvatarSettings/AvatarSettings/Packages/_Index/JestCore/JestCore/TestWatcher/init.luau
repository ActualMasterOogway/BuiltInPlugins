local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local l_default_0 = require(l_Parent_0.Emittery).default;
local v5 = setmetatable({}, {
    __index = l_default_0
});
v5.__index = v5;
v5.new = function(v6) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v5 (copy)
    local v7 = setmetatable(l_default_0.new(), v5);
    local l_isWatchMode_0 = v6.isWatchMode;
    v7.state = {
        interrupted = false
    };
    v7._isWatchMode = l_isWatchMode_0;
    return v7;
end;
v5.setState = function(v9, v10) --[[ Line: 40 ]] --[[ Name: setState ]]
    -- upvalues: v2 (copy), l_Object_0 (copy)
    return v2.resolve():andThen(function() --[[ Line: 41 ]]
        -- upvalues: l_Object_0 (ref), v9 (copy), v10 (copy)
        l_Object_0.assign(v9.state, v10);
        v9:emit("change", v9.state):expect();
    end);
end;
v5.isInterrupted = function(v11) --[[ Line: 47 ]] --[[ Name: isInterrupted ]]
    return v11.state.interrupted;
end;
v5.isWatchMode = function(v12) --[[ Line: 51 ]] --[[ Name: isWatchMode ]]
    return v12._isWatchMode;
end;
v3.default = v5;
return v3;