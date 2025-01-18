local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4) --[[ Line: 8 ]] --[[ Name: useColumns ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v5, v6 = l_useState_0(v4:getVisibleProperties());
    local v7, v8 = l_useState_0(v4:getColumnWidths());
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v6 (copy)
        local v9 = v4.OnVisiblePropertiesChanged:Connect(v6);
        return function() --[[ Line: 15 ]]
            -- upvalues: v9 (copy)
            v9:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 20 ]]
        -- upvalues: v4 (copy), v8 (copy)
        local v10 = v4.OnColumnWidthsChanged:Connect(v8);
        return function() --[[ Line: 23 ]]
            -- upvalues: v10 (copy)
            v10:Disconnect();
        end;
    end, {});
    return v5, v7;
end;