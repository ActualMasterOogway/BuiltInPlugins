local l_inspect_0 = require(script.Parent.Parent.util).inspect;
return function() --[[ Line: 4 ]]
    -- upvalues: l_inspect_0 (copy)
    local v1 = {};
    local v2 = 0;
    local function _() --[[ Line: 8 ]] --[[ Name: indent ]]
        -- upvalues: v2 (ref)
        return string.rep("  ", v2);
    end;
    v1.log = function(v4, ...) --[[ Line: 12 ]] --[[ Name: log ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v5 = nil;
        v5 = if typeof(v4) == "string" then string.format(v4, ...) else l_inspect_0(v4);
        print(string.rep("  ", v2) .. v5);
    end;
    v1.info = function(v6, ...) --[[ Line: 22 ]] --[[ Name: info ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v7 = nil;
        v7 = if typeof(v6) == "string" then string.format(v6, ...) else l_inspect_0(v6);
        print(string.rep("  ", v2) .. v7);
    end;
    v1.warn = function(v8, ...) --[[ Line: 32 ]] --[[ Name: warn ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v9 = nil;
        v9 = if typeof(v8) == "string" then string.format(v8, ...) else l_inspect_0(v8);
        warn(string.rep("  ", v2) .. v9);
    end;
    v1.error = function(v10, ...) --[[ Line: 42 ]] --[[ Name: error ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v11 = nil;
        v11 = if typeof(v10) == "string" then string.format(v10, ...) else l_inspect_0(v10);
        warn(string.rep("  ", v2) .. v11);
    end;
    v1.group = function(v12, ...) --[[ Line: 54 ]] --[[ Name: group ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v13 = nil;
        v13 = if typeof(v12) == "string" then string.format(v12, ...) else l_inspect_0(v12);
        print(string.rep("  ", v2) .. v13);
        v2 = v2 + 1;
    end;
    v1.groupCollapsed = function(v14, ...) --[[ Line: 65 ]] --[[ Name: groupCollapsed ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v15 = nil;
        v15 = if typeof(v14) == "string" then string.format(v14, ...) else l_inspect_0(v14);
        print(string.rep("  ", v2) .. v15);
        v2 = v2 + 1;
    end;
    v1.groupEnd = function() --[[ Line: 77 ]] --[[ Name: groupEnd ]]
        -- upvalues: v2 (ref)
        if v2 > 0 then
            v2 = v2 - 1;
        end;
    end;
    return v1;
end;