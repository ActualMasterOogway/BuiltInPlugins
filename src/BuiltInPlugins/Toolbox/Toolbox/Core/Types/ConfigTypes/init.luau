local l_Util_0 = script.Parent.Parent.Parent.Core.Util;
local v1 = require(l_Util_0.AssetConfigConstants);
local v2 = require(l_Util_0.ScreenSetup);
local v3 = require(l_Util_0.Images);
local v4 = {};
local v5 = {
    name = "GET_ASSET_DETAIL_FAILURE", 
    trigger = "FailToGetAssetDetail", 
    action = "CloseAssetConfig"
};
local v6 = {
    name = "SET_ASSET_PRICE_FAILURE", 
    trigger = "FailToSetPrice", 
    action = "ShowPriceFailReason"
};
local v7 = {
    name = "SET_ASSET_THUMBNAIL_FAILURE", 
    trigger = "FaileToSetIcon", 
    action = "ShowThumbnailFailReason"
};
v4.NetworkErrors = {
    [v5.name] = v5, 
    [v6.name] = v6, 
    [v7.name] = v7
};
v4.GET_ASSET_DETAIL_FAILURE_ACTION = "CloseAssetConfig";
local v8 = {
    name = v1.SIDE_TABS.General, 
    image = v3.GENERAL_SIDE_TAB
};
local v9 = {
    name = v1.SIDE_TABS.Versions, 
    image = v3.VERSIONS_SIDE_TAB
};
local v10 = {
    name = v1.SIDE_TABS.Sales, 
    image = v3.SALES_SIDE_TAB
};
local v11 = {
    name = v1.SIDE_TABS.Override
};
local v12 = {
    name = v1.SIDE_TABS.Permissions, 
    image = v3.PERMISSIONS_SIDE_TAB
};
v4.OWNER_TYPES = {
    User = 1, 
    Group = 2
};
v4.getAssetconfigContent = function(_, v14, v15, v16, v17) --[[ Line: 61 ]] --[[ Name: getAssetconfigContent ]]
    -- upvalues: v8 (copy), v12 (copy), v2 (copy), v9 (copy), v4 (copy), v10 (copy)
    local v18 = {
        v8
    };
    if v16 and v17 then
        v18[#v18 + 1] = v12;
    end;
    if v15 == Enum.AssetType.Model and v2.queryParam(v14, v15, v2.keys.SHOW_VERSIONS_TAB) then
        v18[#v18 + 1] = v9;
    end;
    if v17 and v17.typeId == v4.OWNER_TYPES.Group then
        return v18;
    else
        if v2.queryParam(v14, v15, v2.keys.SHOW_SALES_TAB) then
            v18[#v18 + 1] = v10;
        end;
        return v18;
    end;
end;
v4.isGeneral = function(_, v20) --[[ Line: 88 ]] --[[ Name: isGeneral ]]
    -- upvalues: v8 (copy)
    return v20 == v8;
end;
v4.isVersions = function(_, v22) --[[ Line: 92 ]] --[[ Name: isVersions ]]
    -- upvalues: v9 (copy)
    return v22 == v9;
end;
v4.isSales = function(_, v24) --[[ Line: 96 ]] --[[ Name: isSales ]]
    -- upvalues: v10 (copy)
    return v24 == v10;
end;
v4.isOverride = function(_, v26) --[[ Line: 100 ]] --[[ Name: isOverride ]]
    -- upvalues: v11 (copy)
    return v26 == v11;
end;
v4.isPermissions = function(_, v28) --[[ Line: 104 ]] --[[ Name: isPermissions ]]
    -- upvalues: v12 (copy)
    return v28 == v12;
end;
v4.getOverrideTab = function(_) --[[ Line: 108 ]] --[[ Name: getOverrideTab ]]
    -- upvalues: v11 (copy)
    return v11;
end;
v4.getGeneralTab = function(_) --[[ Line: 112 ]] --[[ Name: getGeneralTab ]]
    -- upvalues: v8 (copy)
    return v8;
end;
v4.getDefualtTab = function(_) --[[ Line: 116 ]] --[[ Name: getDefualtTab ]]
    -- upvalues: v8 (copy)
    return v8;
end;
return v4;