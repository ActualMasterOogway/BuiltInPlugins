local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_keys_0 = require(l_Parent_0.Dash).keys;
local v2 = require(script.Parent.PreviewConstants);
local v4 = {
    IsValidTabKey = function(v3) --[[ Line: 14 ]] --[[ Name: IsValidTabKey ]]
        -- upvalues: v2 (copy)
        return v3 ~= v2.TABS_KEYS.None;
    end
};
v4.getTabInfo = function(v5) --[[ Line: 18 ]] --[[ Name: getTabInfo ]]
    -- upvalues: v4 (copy), v2 (copy)
    return v4.IsValidTabKey(v5) and v2.TABS_INFO[v5] or nil;
end;
v4.isTabMultiSelect = function(v6) --[[ Line: 23 ]] --[[ Name: isTabMultiSelect ]]
    -- upvalues: v2 (copy)
    return v2.TABS_INFO[v6].IsMultiSelect;
end;
local function v7(v8, v9, v10) --[[ Line: 28 ]] --[[ Name: getAllPrebuiltIdsInternal ]]
    -- upvalues: v7 (copy)
    v9 = v9 or {};
    for v11, v12 in pairs(v8) do
        if v11 == v10 then
            for _, v14 in pairs(v12) do
                v9[v14] = true;
            end;
        elseif type(v12) == "table" then
            v7(v12, v9, v10);
        end;
    end;
    return v9;
end;
v4.getAllAssetIds = function() --[[ Line: 44 ]] --[[ Name: getAllAssetIds ]]
    -- upvalues: v7 (copy), v2 (copy), l_keys_0 (copy)
    local v15 = v7(v2.TABS_INFO, nil, "AssetIds");
    return l_keys_0(v15);
end;
v4.getAllBundleIds = function() --[[ Line: 50 ]] --[[ Name: getAllBundleIds ]]
    -- upvalues: v7 (copy), v2 (copy), l_keys_0 (copy)
    local v16 = v7(v2.TABS_INFO, nil, "BundleIds");
    return l_keys_0(v16);
end;
v4.getTabs = function() --[[ Line: 55 ]] --[[ Name: getTabs ]]
    -- upvalues: v2 (copy)
    return v2.TABS_INFO;
end;
v4.getTabsForAvatarEditing = function() --[[ Line: 59 ]] --[[ Name: getTabsForAvatarEditing ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v17 = {};
    for v18, v19 in pairs(v4.getTabs()) do
        if v18 ~= v2.TABS_KEYS.Avatars then
            v17[v18] = v19;
        end;
    end;
    return v17;
end;
v4.getTabsForClothesEditing = function() --[[ Line: 69 ]] --[[ Name: getTabsForClothesEditing ]]
    -- upvalues: v4 (copy)
    return v4.getTabs();
end;
v4.shouldTabShowTransparency = function(v20) --[[ Line: 73 ]] --[[ Name: shouldTabShowTransparency ]]
    -- upvalues: v4 (copy), v2 (copy)
    return v4.IsValidTabKey(v20) and v20 ~= v2.TABS_KEYS.Animations;
end;
v4.shouldTabShowPlaybackSlider = function(v21) --[[ Line: 77 ]] --[[ Name: shouldTabShowPlaybackSlider ]]
    -- upvalues: v4 (copy), v2 (copy)
    return v4.IsValidTabKey(v21) and v21 == v2.TABS_KEYS.Animations;
end;
return v4;