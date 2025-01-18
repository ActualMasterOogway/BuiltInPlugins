local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: useAsync ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState({
        state = "loading"
    });
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy), v2 (copy)
        v5({
            state = "loading"
        });
        local v6 = task.spawn(function() --[[ Line: 23 ]]
            -- upvalues: v5 (ref), v2 (ref)
            v5({
                state = "ok", 
                value = v2()
            });
        end);
        return function() --[[ Line: 30 ]]
            -- upvalues: v6 (copy)
            task.cancel(v6);
        end;
    end, v3);
    return v4;
end;