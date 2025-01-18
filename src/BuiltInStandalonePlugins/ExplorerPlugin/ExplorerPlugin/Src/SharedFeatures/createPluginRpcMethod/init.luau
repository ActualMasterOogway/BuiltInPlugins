local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 12 ]] --[[ Name: createPluginRpcMethod ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v1 (copy)
    local l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 = l_script_FirstAncestor_0:FindFirstAncestorWhichIsA("Plugin");
    local v4 = false;
    if l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 ~= nil then
        v4 = l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0:IsA("Plugin");
    end;
    assert(v4, "Couldn't find plugin");
    return {
        fire = function(...) --[[ Line: 16 ]] --[[ Name: fire ]]
            -- upvalues: l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 (copy), v2 (copy)
            l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0:Invoke(v2, ...);
        end, 
        listen = function(v5) --[[ Line: 20 ]] --[[ Name: listen ]]
            -- upvalues: l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 (copy), v2 (copy)
            local v6 = l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0:OnInvoke(v2, v5);
            return function() --[[ Line: 23 ]]
                -- upvalues: v6 (copy)
                v6:Disconnect();
            end;
        end, 
        useListenToGuest = l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0.HostDataModelType == Enum.StudioDataModelType.Standalone and function(v7, v8) --[[ Line: 34 ]]
            -- upvalues: v1 (ref), l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 (copy), v2 (copy)
            local v9 = v1.useMemo(function() --[[ Line: 35 ]]
                -- upvalues: v7 (copy)
                return v7;
            end, v8);
            v1.useEffect(function() --[[ Line: 39 ]]
                -- upvalues: v9 (copy), l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0 (ref), v2 (ref)
                local v10 = l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0:OnInvoke(v2, v9);
                return function() --[[ Line: 23 ]]
                    -- upvalues: v10 (copy)
                    v10:Disconnect();
                end;
            end, {
                l_l_script_FirstAncestor_0_FirstAncestorWhichIsA_0, 
                v9
            });
        end or function() --[[ Line: 43 ]]
            error("useListenToGuest called from guest DM");
        end
    };
end;