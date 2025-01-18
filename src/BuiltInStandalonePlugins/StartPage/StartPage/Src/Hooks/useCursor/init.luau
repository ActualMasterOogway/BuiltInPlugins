local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Contexts.CursorPriority);
local l_Mouse_0 = v1.ContextServices.Mouse;
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
return function(v9) --[[ Line: 22 ]] --[[ Name: useCursor ]]
    -- upvalues: l_Mouse_0 (copy), l_useContext_0 (copy), v3 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy)
    local v10 = l_Mouse_0.use();
    local v11 = l_useContext_0(v3);
    local v12 = l_useRef_0(false);
    local v13 = l_useCallback_0(function() --[[ Line: 29 ]]
        -- upvalues: v12 (copy), v10 (copy), v9 (copy), v11 (copy)
        v12.current = true;
        v10:__pushCursor(v9, v11);
    end, {
        v12, 
        v10, 
        v9, 
        v11
    });
    local v14 = l_useCallback_0(function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy), v10 (copy), v11 (copy)
        v12.current = false;
        v10:__popCursor(v11);
    end, {
        v12, 
        v10, 
        v11
    });
    l_useEffect_0(function() --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v10 (copy), v11 (copy)
        return function() --[[ Line: 44 ]]
            -- upvalues: v12 (ref), v10 (ref), v11 (ref)
            if v12.current then
                v10:__popCursor(v11);
            end;
        end;
    end, {
        v12, 
        v10, 
        v11
    });
    return v13, v14;
end;