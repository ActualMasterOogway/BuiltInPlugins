local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
return function(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: useAssetDataModelInvokeConnection ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v1.ContextServices.Plugin:use():get();
    local v7 = v2.useMemo(function() --[[ Line: 9 ]]
        -- upvalues: v4 (copy)
        return v4;
    end, v5);
    v2.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (copy), v7 (copy)
        local v8 = v6:OnInvoke(v3, v7);
        return function() --[[ Line: 16 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {
        v6, 
        v3, 
        v7
    });
end;