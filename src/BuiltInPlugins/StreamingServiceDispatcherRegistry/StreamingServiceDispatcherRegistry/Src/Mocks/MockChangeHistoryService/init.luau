local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy)
    local v3 = {};
    setmetatable(v3, {
        __index = function(_, _) --[[ Line: 13 ]] --[[ Name: __index ]]
            return function() --[[ Line: 14 ]]
                return {};
            end;
        end
    });
    v3.OnUndo = l_Signal_0.new();
    v3.OnRedo = l_Signal_0.new();
    return v3;
end;
return v2;