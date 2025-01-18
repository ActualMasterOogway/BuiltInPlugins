local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.ContextMenuHelper);
local v3 = require(l_Util_0.CreatorInfoHelper);
local v4 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v5 = require(l_Parent_0.Core.Types.Category);
local v6 = require(l_Parent_0.Core.Util.PageInfoHelper);
local _ = function(v7, v8) --[[ Line: 11 ]] --[[ Name: nameForValueInEnum ]]
    local l_v7_EnumItems_0 = v7:GetEnumItems();
    for _, v11 in ipairs(l_v7_EnumItems_0) do
        if v11.Value == v8 then
            return v11.Name;
        end;
    end;
end;
return function(v13, v14, v15, v16, v17) --[[ Line: 23 ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v6 (copy), v2 (copy)
    return function(v18) --[[ Line: 24 ]]
        -- upvalues: v13 (copy), v5 (ref), v4 (ref), v17 (copy), v3 (ref), v6 (ref), v2 (ref), v15 (copy), v14 (copy), v16 (copy)
        local v19 = false;
        local v20 = false;
        local l_Asset_0 = v13.Asset;
        local l_Id_0 = l_Asset_0.Id;
        local l_TypeId_0 = l_Asset_0.TypeId;
        local v24 = v18:getState();
        local v25 = v24.assets or {};
        local v26 = v24.pageInfo or {};
        local v27 = v25.manageableAssets[tostring(l_Id_0)];
        local v28 = v26.categoryName or v5.DEFAULT.name;
        local v29 = v24.packages.permissionsTable or {};
        local v30 = v5.categoryIsPackage(v28);
        if v30 then
            local v31 = true;
            if v29[l_Id_0] ~= v4.EditKey then
                v31 = v29[l_Id_0] == v4.OwnKey;
            end;
            v27 = v31;
        end;
        local l_v17_0 = v17;
        local l_position_0 = v13.Context.position;
        local v34 = nil;
        v34 = if l_v17_0.toolboxTab == v5.CREATIONS_KEY then v13.Creator.Type else v3.backendToClient(v13.Creator.Type);
        local v35 = {};
        local l_EnumItems_0 = Enum.AssetType:GetEnumItems();
        local v37;
        for _, v39 in ipairs(l_EnumItems_0) do
            if v39.Value == l_TypeId_0 then
                v37 = v39.Name;
                v19 = true;
            end;
            if v19 then
                break;
            end;
        end;
        if not v19 then
            v37 = nil;
        end;
        v19 = false;
        v35.Category = v37;
        v35.SortType = l_v17_0.sort;
        v35.CreatorId = v13.Creator.Id;
        local l_CreatorType_0 = Enum.CreatorType;
        l_EnumItems_0 = v34;
        local l_l_CreatorType_0_EnumItems_0 = l_CreatorType_0:GetEnumItems();
        for _, v43 in ipairs(l_l_CreatorType_0_EnumItems_0) do
            if v43.Value == l_EnumItems_0 then
                v37 = v43.Name;
                v20 = true;
            end;
            if v20 then
                break;
            end;
        end;
        if not v20 then
            v37 = nil;
        end;
        v20 = false;
        v35.CreatorType = v37;
        v35.SearchKeyword = l_v17_0.searchKeyword;
        v35.Position = l_position_0;
        v35.SearchId = l_v17_0.searchId;
        v35.ViewInBrowser = true;
        v37 = v13.Creator and v13.Creator.Id or nil;
        l_CreatorType_0 = v6.getCategoryForPageInfo(v26);
        v2.tryCreateContextMenu(v15, l_Id_0, l_TypeId_0, v27, v14, v16, v30, l_CreatorType_0, v35, v37);
    end;
end;