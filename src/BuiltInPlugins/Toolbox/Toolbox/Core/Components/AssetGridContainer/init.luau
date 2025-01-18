local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_map_0 = require(l_Packages_0.LuauPolyfill).Array.map;
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.getStartupAssetId);
local v7 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v8 = require(l_Parent_0.Core.Types.Category);
local v9 = require(l_Parent_0.Core.Types.LayoutMode);
local v10 = require(l_Parent_0.Core.Components.AssetGrid);
local v11 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v12 = require(l_Parent_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_Parent_0.Core.Components.Audio.AudioScroller);
local v14 = require(l_Parent_0.Core.Components.AssetTable.AssetTable);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v16 = require(l_Parent_0.Core.Components.InfoBanner);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v19 = require(l_Actions_0.GetAssets);
local v20 = require(l_Actions_0.SetAssetPreview);
local v21 = require(l_Parent_0.Core.Thunks.GetAssetPreviewDataForStartup);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v24 = require(l_Parent_0.Core.ContextServices.Settings);
local v25 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v26 = require(l_Parent_0.Core.Networking.Requests.NextPageRequest);
local v27 = require(l_Parent_0.Core.Networking.Requests.PostAssetCheckPermissions);
local v28 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v29 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v30 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local v31 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v32 = v2.PureComponent:extend("AssetGridContainer");
v32.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v32.init = function(v33, v34) --[[ Line: 115 ]] --[[ Name: init ]]
    v33.requestNextPage = function() --[[ Line: 116 ]]
        -- upvalues: v34 (copy), v33 (copy)
        local l_networkInterface_0 = v34.Network.networkInterface;
        local v36 = v33.props.Settings:get("Plugin");
        v33.props.nextPage(l_networkInterface_0, v36);
    end;
    v33.setAssetPreview = function(v37) --[[ Line: 122 ]]
        -- upvalues: v34 (copy)
        local l_Id_0 = v37.Asset.Id;
        v34.getAssets({
            v37
        });
        v34.setAssetPreview(true, l_Id_0);
    end;
    v33.logImpression = function(v39, v40, v41, v42) --[[ Line: 128 ]]
        -- upvalues: v33 (copy)
        local l_props_0 = v33.props;
        if l_props_0.LogAssetImpression then
            return l_props_0.LogAssetImpression(v39, v42, v40, v41, l_props_0.ParentAbsoluteSize, l_props_0.ParentAbsolutePosition);
        else
            return nil;
        end;
    end;
end;
v32.didMount = function(v44) --[[ Line: 150 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy)
    local v45 = tonumber((v6()));
    if v45 then
        local l_props_1 = v44.props;
        l_props_1.getAssetPreviewDataForStartup(v45, l_props_1.TryInsert, l_props_1.Localization, l_props_1.Network.networkInterface, v44.setAssetPreview);
    end;
end;
v32.render = function(v47) --[[ Line: 166 ]] --[[ Name: render ]]
    -- upvalues: v29 (copy), v8 (copy), v2 (copy), v16 (copy), v11 (copy), l_map_0 (copy), v13 (copy), v28 (copy), v9 (copy), v14 (copy), v30 (copy), v10 (copy), v31 (copy)
    local l_props_2 = v47.props;
    local v49 = if v29() then l_props_2.IXP else nil;
    local l_allAssetCount_0 = l_props_2.allAssetCount;
    local l_isLoading_0 = l_props_2.isLoading;
    local l_assetIds_0 = l_props_2.assetIds;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_RenderTopContent_0 = l_props_2.RenderTopContent;
    local l_Size_0 = l_props_2.Size;
    local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
    local l_OnAssetPreviewButtonClicked_0 = l_props_2.OnAssetPreviewButtonClicked;
    local l_TryInsert_0 = l_props_2.TryInsert;
    local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
    local v61 = if v29() then v8.getTabForCategoryName(l_props_2.categoryName) == v8.INVENTORY else nil;
    if (not l_allAssetCount_0 or l_allAssetCount_0 <= 0) and not l_isLoading_0 then
        return v2.createElement(v16, {
            Position = l_props_2.NoResultsPosition, 
            Text = l_props_2.Localization:getText("General", "InfoBannerText"), 
            ZIndex = 2
        });
    else
        if v8.categoryIsPackage(l_props_2.categoryName) and #l_assetIds_0 ~= 0 then
            local v62 = {};
            local v63 = 1;
            while v63 < v11.MaxPackageAssetIdsForHighestPermissionsRequest and l_assetIds_0[v63] ~= nil do
                local v64 = l_assetIds_0[v63];
                if not v47.props.currentUserPackagePermissions[v64] then
                    table.insert(v62, v64);
                end;
                v63 = v63 + 1;
            end;
            if #v62 ~= 0 then
                v47.props.dispatchPostAssetCheckPermissions(v47.props.Network.networkInterface, v62);
            end;
        end;
        if v8.categoryIsAudio(l_props_2.categoryName) then
            local v66 = l_map_0(l_props_2.assetIds, function(v65) --[[ Line: 215 ]]
                -- upvalues: l_props_2 (copy)
                return l_props_2.idToAssetMap[v65];
            end);
            return v13.Generator({
                Assets = v66, 
                CanInsertAsset = l_CanInsertAsset_0, 
                FetchNextPage = v47.requestNextPage, 
                Loading = false, 
                LogImpression = v47.logImpression, 
                OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_props_2.TryOpenAssetConfig
            });
        elseif v28(v49) and l_props_2.layoutMode == v9.ListView and v61 then
            local v68 = l_map_0(l_props_2.assetIds, function(v67) --[[ Line: 234 ]]
                -- upvalues: l_props_2 (copy)
                return l_props_2.idToAssetMap[v67];
            end);
            return v2.createElement(v14, {
                Assets = v68, 
                CanInsertAsset = l_CanInsertAsset_0, 
                FetchNextPage = v47.requestNextPage, 
                LogImpression = v47.logImpression, 
                OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                OnSearchByCreator = if v30() then l_props_2.OnSearchByCreator else nil, 
                ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_props_2.TryOpenAssetConfig
            });
        else
            return v2.createElement(v10, {
                AssetIds = l_assetIds_0, 
                AssetMap = l_props_2.idToAssetMap, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                RenderTopContent = l_RenderTopContent_0, 
                RequestNextPage = v47.requestNextPage, 
                Size = l_Size_0, 
                CanInsertAsset = l_CanInsertAsset_0, 
                LogAssetImpression = l_props_2.LogAssetImpression, 
                OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_0, 
                OnSearchByCreator = if v31() then l_props_2.OnSearchByCreator else nil, 
                ParentAbsolutePosition = l_props_2.ParentAbsolutePosition, 
                ParentSize = l_props_2.ParentAbsoluteSize, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0
            });
        end;
    end;
end;
v32 = v12(v32);
v32 = l_withContext_0({
    IXP = if v29() then v7 else nil, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v24, 
    Network = v25
})(v32);
return v3.connect(function(v69, _) --[[ Line: 283 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v8 (copy), v29 (copy)
    v69 = v69 or {};
    local v71 = v69.assets or {};
    local v72 = v69.pageInfo or {};
    local v73 = v72.categoryName or v8.DEFAULT.name;
    return {
        allAssetCount = #v71.idsToRender, 
        assetIds = v71.idsToRender or {}, 
        categoryName = v73, 
        currentUserPackagePermissions = v69.packages.permissionsTable or {}, 
        idToAssetMap = v71.idToAssetMap, 
        isLoading = v71.isLoading or false, 
        layoutMode = if v29() then v72.layoutMode else nil
    };
end, function(v74) --[[ Line: 300 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v27 (copy), v21 (copy), v19 (copy), v26 (copy), v20 (copy)
    return {
        dispatchPostAssetCheckPermissions = function(v75, v76) --[[ Line: 302 ]] --[[ Name: dispatchPostAssetCheckPermissions ]]
            -- upvalues: v74 (copy), v27 (ref)
            v74(v27(v75, v76));
        end, 
        getAssetPreviewDataForStartup = function(v77, v78, v79, v80, v81) --[[ Line: 305 ]] --[[ Name: getAssetPreviewDataForStartup ]]
            -- upvalues: v74 (copy), v21 (ref)
            v74(v21(v77, v78, v79, v80, v81));
        end, 
        getAssets = function(v82) --[[ Line: 308 ]] --[[ Name: getAssets ]]
            -- upvalues: v74 (copy), v19 (ref)
            return v74(v19(v82));
        end, 
        nextPage = function(v83, v84) --[[ Line: 311 ]] --[[ Name: nextPage ]]
            -- upvalues: v74 (copy), v26 (ref)
            v74(v26(v83, v84));
        end, 
        setAssetPreview = function(v85, v86) --[[ Line: 314 ]] --[[ Name: setAssetPreview ]]
            -- upvalues: v74 (copy), v20 (ref)
            return v74(v20(v85, v86));
        end
    };
end)(v32);