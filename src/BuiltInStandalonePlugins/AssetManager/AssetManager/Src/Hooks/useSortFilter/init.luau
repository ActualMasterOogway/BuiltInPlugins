local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4) --[[ Line: 8 ]] --[[ Name: useSortFilter ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v5, v6 = l_useState_0(v4:getSorts());
    local v7, v8 = l_useState_0(v4:getFilters());
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v6 (copy), v8 (copy)
        local v11 = v4.OnSortFilterChanged:Connect(function(v9, v10) --[[ Line: 13 ]]
            -- upvalues: v6 (ref), v8 (ref)
            v6(v9);
            v8(v10);
        end);
        return function() --[[ Line: 18 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {});
    return v5, v7;
end;