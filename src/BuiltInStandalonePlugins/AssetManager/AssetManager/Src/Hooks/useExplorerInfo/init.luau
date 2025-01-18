local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v5, v6) --[[ Line: 17 ]] --[[ Name: useExplorerInfo ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local _, v8 = l_useState_0(v5:getUser().Name);
    local v9, v10 = l_useState_0(v6:getSelection());
    local v11, _ = l_useState_0(v6:getExpansion());
    local v13, v14 = l_useState_0(v6:getExplorerItems());
    local v15, v16 = l_useState_0(v6:getShowScopeOptions());
    l_useEffect_0(function() --[[ Line: 25 ]]
        -- upvalues: v6 (copy), v16 (copy)
        local v17 = v6.OnShowScopeOptionsChanged:Connect(v16);
        return function() --[[ Line: 28 ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v5 (copy), v8 (copy)
        local v18 = v5.OnUsernameFetched:Connect(v8);
        return function() --[[ Line: 35 ]]
            -- upvalues: v18 (copy)
            v18:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v6 (copy), v14 (copy)
        local v19 = v6.OnExplorerItemsChanged:Connect(v14);
        return function() --[[ Line: 42 ]]
            -- upvalues: v19 (copy)
            v19:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 47 ]]
        -- upvalues: v5 (copy), v10 (copy)
        local v20 = v5.OnSelectionChanged:Connect(v10);
        return function() --[[ Line: 49 ]]
            -- upvalues: v20 (copy)
            v20:Disconnect();
        end;
    end, {});
    return {
        ShowScopeOptions = v15, 
        Items = v13, 
        Selection = v9, 
        Expansion = v11
    };
end;