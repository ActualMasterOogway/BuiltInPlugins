local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.Signal);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local l_v2_0 = v2;
    local v4 = v1.new();
    return {
        get = function() --[[ Line: 12 ]] --[[ Name: get ]]
            -- upvalues: l_v2_0 (ref)
            return l_v2_0;
        end, 
        set = function(v5) --[[ Line: 15 ]] --[[ Name: set ]]
            -- upvalues: l_v2_0 (ref), v4 (copy)
            l_v2_0 = v5;
            v4:Fire();
        end, 
        changed = v4
    };
end;