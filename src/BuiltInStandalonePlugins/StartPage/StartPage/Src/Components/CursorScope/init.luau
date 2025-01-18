local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_Mouse_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Mouse;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useContext_0 = v2.useContext;
local l_useEffect_0 = v2.useEffect;
local v5 = require(l_script_FirstAncestor_0.Src.Contexts.CursorPriority);
return function(v6) --[[ Line: 22 ]] --[[ Name: CursorScope ]]
    -- upvalues: l_Mouse_0 (copy), l_useContext_0 (copy), v5 (copy), l_useEffect_0 (copy), v2 (copy)
    local v7 = l_Mouse_0.use();
    local v8 = l_useContext_0(v5);
    l_useEffect_0(function() --[[ Line: 26 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7:__pushCursor("Arrow", v8 + 1);
        return function() --[[ Line: 28 ]]
            -- upvalues: v7 (ref), v8 (ref)
            v7:__popCursor(v8 + 1);
        end;
    end, {
        v7, 
        v8
    });
    return v2.createElement(v5.Provider, {
        value = v8 + 1
    }, v6.children);
end;