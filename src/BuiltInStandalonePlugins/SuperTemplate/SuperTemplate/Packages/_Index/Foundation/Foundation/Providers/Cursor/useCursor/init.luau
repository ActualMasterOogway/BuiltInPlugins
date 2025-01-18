local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v5 = require(script.Parent.getCursorKey);
local v6 = require(script.Parent.CursorContext);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
return function(v8) --[[ Line: 20 ]] --[[ Name: useCursor ]]
    -- upvalues: v4 (copy), v2 (copy), v6 (copy), v5 (copy), v3 (copy)
    local v9 = v4();
    local v10 = v2.useContext(v6);
    local l_refCache_0 = v10.refCache;
    local l_setMountedCursors_0 = v10.setMountedCursors;
    local v13 = v2.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v8 (copy), v5 (ref), v9 (copy)
        if typeof(v8) == "table" then
            return v5(v9, v8.radius, v8.offset, v8.borderWidth);
        elseif v8 == nil then
            return v5(v9);
        else
            return v8;
        end;
    end, {
        v8, 
        v9
    });
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: l_setMountedCursors_0 (copy), v13 (copy), v3 (ref)
        l_setMountedCursors_0(function(v14) --[[ Line: 37 ]]
            -- upvalues: v13 (ref), v3 (ref)
            if v14[v13] == nil then
                return v3.Dictionary.union(v14, {
                    [v13] = true
                });
            else
                return v14;
            end;
        end);
    end, {
        v13
    });
    return l_refCache_0[v13];
end;