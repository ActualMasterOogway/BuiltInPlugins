local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: useCachedValue ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy)
    local v8, v9 = l_useState_0(v6);
    local v10 = l_useRef_0(true);
    local v11 = l_useCallback_0(function() --[[ Line: 14 ]]
        -- upvalues: v7 (copy), v10 (copy)
        task.delay(v7, function() --[[ Line: 15 ]]
            -- upvalues: v10 (ref)
            v10.current = false;
        end);
    end, {});
    l_useEffect_0(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v8 (copy), v10 (copy), v9 (copy), v11 (copy)
        if v6 ~= v8 and v10.current == false then
            v9(v6);
            v10.current = true;
            v11();
        end;
    end, {
        v6
    });
    l_useEffect_0(v11, {});
    return v8;
end;