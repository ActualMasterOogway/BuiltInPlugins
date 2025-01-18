local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Plugin_0 = v1.ContextServices.Plugin;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function() --[[ Line: 10 ]] --[[ Name: useShareDialogModel ]]
    -- upvalues: l_Plugin_0 (copy), v2 (copy)
    local v5 = l_Plugin_0.use():get();
    local v6, v7 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v5 (copy), v7 (copy)
        local v8 = v5:OnSetItem("ShareDialogModel", v7);
        v7(v5:GetItem("ShareDialogModel"));
        return function() --[[ Line: 19 ]]
            -- upvalues: v8 (copy), v7 (ref)
            v8:Disconnect();
            v7(nil);
        end;
    end, {
        v5, 
        v7
    });
    return v6, v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v5 (copy)
        v5:Invoke("ShareAccess");
    end, {
        v5
    }), (v2.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v5 (copy)
        v5:Invoke("ShareDialogDismissed");
    end, {
        v5
    }));
end;