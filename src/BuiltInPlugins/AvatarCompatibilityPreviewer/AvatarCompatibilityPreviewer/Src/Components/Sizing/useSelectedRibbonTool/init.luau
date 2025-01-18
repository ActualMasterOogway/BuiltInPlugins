local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
return function() --[[ Line: 10 ]] --[[ Name: useSelectedRibbonTool ]]
    -- upvalues: v2 (copy), v3 (copy), l_RunService_0 (copy)
    local v4 = v2.ContextServices.Plugin:use():get();
    local v5 = v3.useCallback(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        return v4:GetSelectedRibbonTool();
    end, {
        v4
    });
    local v6, v7 = v3.useState(v5);
    v3.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: l_RunService_0 (ref), v7 (copy), v5 (copy)
        local v8 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 21 ]]
            -- upvalues: v7 (ref), v5 (ref)
            v7(v5());
        end);
        return function() --[[ Line: 25 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {
        v4
    });
    return v6;
end;