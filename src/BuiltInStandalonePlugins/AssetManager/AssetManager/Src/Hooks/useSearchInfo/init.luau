local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v4) --[[ Line: 15 ]] --[[ Name: useSearchInfo ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy)
    local v5, v6 = l_useState_0(v4:getShowSearchOptions());
    local v7, v8 = l_useState_0(v4:getIsDefaultSearchState());
    local v9, v10 = l_useState_0(v4:getSearchTerm());
    local v11, v12 = l_useState_0(v4:getSearchOptions());
    local v13 = {
        ShowSearchOptions = v5, 
        SearchTerm = v9, 
        SearchOptions = v11, 
        IsDefaultSearchState = v7
    };
    l_useEffect_0(function() --[[ Line: 27 ]]
        -- upvalues: v4 (copy), v6 (copy)
        local v14 = v4.OnShowSearchOptionsChanged:Connect(v6);
        return function() --[[ Line: 30 ]]
            -- upvalues: v14 (copy)
            v14:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: v4 (copy), v10 (copy)
        local v15 = v4.OnSearchTermChanged:Connect(v10);
        return function() --[[ Line: 38 ]]
            -- upvalues: v15 (copy)
            v15:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 43 ]]
        -- upvalues: v4 (copy), v12 (copy)
        local v16 = v4.OnSearchOptionsChanged:Connect(v12);
        return function() --[[ Line: 46 ]]
            -- upvalues: v16 (copy)
            v16:Disconnect();
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 51 ]]
        -- upvalues: v4 (copy), v8 (copy)
        local v17 = v4.OnIsDefaultSearchStateChanged:Connect(v8);
        return function() --[[ Line: 54 ]]
            -- upvalues: v17 (copy)
            v17:Disconnect();
        end;
    end, {});
    return v13;
end;