local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v4.Components;
local l_ScrollableGrid_0 = l_Components_0.ScrollableGrid;
local l_AssetThumbnailTiles_0 = l_Components_0.AssetThumbnailTiles;
local l_AccessoryAndBodyToolShared_0 = v4.Util.AccessoryAndBodyToolShared;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local v12 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v12.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_deepCopy_0 = l_Util_0.deepCopy;
local v19 = require(l_Parent_0.Src.Thunks.UpdatePreviewAssetsSelected);
local v20 = require(l_Parent_0.Src.Thunks.GetPrebuiltAssetsInfo);
local l_EditingItemContext_0 = v4.Contexts.EditingItemContext;
local l_AssetServiceWrapper_0 = v4.Contexts.AssetServiceWrapper;
local v23 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Util.ShowDialog);
local v25 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v26 = v1.PureComponent:extend("PreviewGrid");
l_Typecheck_0.wrap(v26, script);
local function _(v27) --[[ Line: 62 ]] --[[ Name: getSelectedIds ]]
    -- upvalues: v3 (copy)
    local l_props_0 = v27.props;
    local v29 = l_props_0.SelectedAssets[l_props_0.SelectedTab] or {};
    return v3.List.toSet(v29);
end;
local function _(v31, v32) --[[ Line: 72 ]] --[[ Name: getUserAddedAssets ]]
    local l_UserAddedAssets_0 = v31.props.UserAddedAssets;
    return l_UserAddedAssets_0 and l_UserAddedAssets_0[v32] or {};
end;
v26.init = function(v35) --[[ Line: 79 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v25 (copy), v23 (copy)
    v35.gridRef = v1.createRef();
    v35.onThumbnailClick = function(v36, v37) --[[ Line: 82 ]]
        -- upvalues: v35 (copy), v25 (ref), v23 (ref)
        v35.props.UpdatePreviewAssetsSelected(v36, not v37);
        if not v37 then
            local l_SelectedTab_0 = v35.props.SelectedTab;
            local l_PrebuiltAssetsInfo_0 = v35.props.PrebuiltAssetsInfo;
            local l_Analytics_0 = v35.props.Analytics;
            local v41 = l_PrebuiltAssetsInfo_0[v36] == nil;
            if not v25.FirstAction then
                v25.FirstAction = v23.ACTIONS.Preview;
                l_Analytics_0:getHandler("FirstAction")(v25.FirstAction);
            end;
            l_Analytics_0:getHandler("PreviewAssetSelected")(v41, l_SelectedTab_0, v36, true);
        end;
    end;
end;
local function v49(v42, v43) --[[ Line: 98 ]] --[[ Name: getUserAddedAssetIds ]]
    local l_UserAddedAssets_1 = v42.props.UserAddedAssets;
    local v45 = l_UserAddedAssets_1 and l_UserAddedAssets_1[v43] or {};
    local v46 = {};
    for _, v48 in ipairs(v45) do
        table.insert(v46, v48.uniqueId);
    end;
    return v46;
end;
local function v71(v50, v51) --[[ Line: 110 ]] --[[ Name: combineAssetInfo ]]
    -- upvalues: l_deepCopy_0 (copy), l_PreviewConstantsInterface_0 (copy), v49 (copy), l_PreviewConstants_0 (copy), v3 (copy)
    local l_props_1 = v50.props;
    local l_SearchFilter_0 = l_props_1.SearchFilter;
    local l_CategoryFilter_0 = l_props_1.CategoryFilter;
    local v55 = l_deepCopy_0(l_props_1.PrebuiltAssetsInfo);
    local l_UserAddedAssets_2 = v50.props.UserAddedAssets;
    local v57 = l_UserAddedAssets_2 and l_UserAddedAssets_2[v51] or {};
    local v58 = l_PreviewConstantsInterface_0.getTabInfo(v51);
    if v58 then
        l_UserAddedAssets_2 = v49(v50, v51);
        local v59 = {};
        local v60 = {};
        if l_CategoryFilter_0 == "" or l_CategoryFilter_0 == l_PreviewConstants_0.CategoryPrefixes.Default then
            if v58.AssetIds then
                for _, v62 in pairs(v58.AssetIds) do
                    local v63 = v55[v62];
                    if v63 then
                        v63.ThumbnailType = "Asset";
                        if l_SearchFilter_0 == "" or string.find(v63.Name or v63.name, l_SearchFilter_0) then
                            table.insert(v59, v62);
                        end;
                    end;
                end;
            end;
            if v58.BundleIds then
                for _, v65 in pairs(v58.BundleIds) do
                    local v66 = v55[v65];
                    if v66 then
                        v66.ThumbnailType = "BundleThumbnail";
                        if l_SearchFilter_0 == "" or string.find(v66.Name or v66.name, l_SearchFilter_0) then
                            table.insert(v60, v65);
                        end;
                    end;
                end;
            end;
        end;
        local v67 = {};
        if l_CategoryFilter_0 == "" or l_CategoryFilter_0 == l_PreviewConstants_0.CategoryPrefixes.Custom then
            for _, v69 in ipairs(v57) do
                if l_SearchFilter_0 == "" or string.find(v69.instance.Name, l_SearchFilter_0) then
                    v67[v69.uniqueId] = {
                        Name = v69.instance.Name, 
                        ThumbnailType = "", 
                        Instance = v69.instance
                    };
                end;
            end;
        end;
        local v70 = v3.Dictionary.join(v55, v67);
        return v3.List.join(l_UserAddedAssets_2, v59, v60), v70;
    else
        return;
    end;
end;
v26.render = function(v72) --[[ Line: 169 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_PreviewConstantsInterface_0 (copy), v71 (copy), v3 (copy), l_AssetThumbnailTiles_0 (copy), v1 (copy), l_ScrollableGrid_0 (copy)
    local l_props_2 = v72.props;
    local l_Size_0 = l_props_2.Size;
    local l_layoutOrder_0 = l_props_2.layoutOrder;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local _ = l_props_2.Analytics;
    local l_SelectedTab_1 = l_props_2.SelectedTab;
    local v79 = l_LayoutOrderIterator_0.new();
    local v80 = {};
    if l_PreviewConstantsInterface_0.getTabInfo(l_SelectedTab_1) then
        local v81, v82 = v71(v72, l_SelectedTab_1);
        local l_join_0 = v3.Dictionary.join;
        local l_v80_0 = v80;
        local l_l_AssetThumbnailTiles_0_0 = l_AssetThumbnailTiles_0;
        local v86 = {
            AssetIds = v81, 
            AssetsInfo = v82, 
            LayoutOrder = v79:getNextOrder()
        };
        local l_props_3 = v72.props;
        local v88 = l_props_3.SelectedAssets[l_props_3.SelectedTab] or {};
        v86.SelectedTiles = v3.List.toSet(v88);
        v86.DefaultThumbnail = l_Stylizer_0.DefaultTileImages[l_SelectedTab_1];
        v86.OnThumbnailClick = v72.onThumbnailClick;
        v80 = l_join_0(l_v80_0, l_l_AssetThumbnailTiles_0_0(v86));
    end;
    return v1.createElement(l_ScrollableGrid_0, {
        Size = l_Size_0, 
        CellSize = l_Stylizer_0.TileSize, 
        CellPadding = l_Stylizer_0.TilePadding, 
        LayoutOrder = l_layoutOrder_0
    }, v80);
end;
v26.didMount = function(v89) --[[ Line: 204 ]] --[[ Name: didMount ]]
    -- upvalues: l_PreviewConstantsInterface_0 (copy)
    local l_API_0 = v89.props.API;
    local v91 = v89.props.AssetServiceWrapper:get();
    local v92 = l_PreviewConstantsInterface_0.getAllAssetIds();
    local v93 = l_PreviewConstantsInterface_0.getAllBundleIds();
    v89.props.GetPrebuiltAssetsInfo(l_API_0, v91, v92, v93);
    v89.props.UpdatePreviewAssetsSelected();
end;
v26 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Plugin = l_ContextServices_0.Plugin, 
    EditingItemContext = l_EditingItemContext_0, 
    AssetServiceWrapper = l_AssetServiceWrapper_0
})(v26);
return v2.connect(function(v94, _) --[[ Line: 228 ]] --[[ Name: mapStateToProps ]]
    local l_previewAssets_0 = v94.previewAssets;
    local l_previewStatus_0 = v94.previewStatus;
    return {
        PrebuiltAssetsInfo = l_previewAssets_0.prebuiltAssetsInfo, 
        SelectedTab = l_previewStatus_0.selectedTab, 
        SearchFilter = l_previewStatus_0.searchFilter, 
        CategoryFilter = l_previewStatus_0.categoryFilter, 
        SelectedAssets = l_previewStatus_0.selectedAssets
    };
end, function(v98) --[[ Line: 241 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v19 (copy)
    return {
        GetPrebuiltAssetsInfo = function(v99, v100, v101, v102) --[[ Line: 243 ]] --[[ Name: GetPrebuiltAssetsInfo ]]
            -- upvalues: v98 (copy), v20 (ref)
            v98(v20(v99, v100, v101, v102));
        end, 
        UpdatePreviewAssetsSelected = function(v103, v104) --[[ Line: 246 ]] --[[ Name: UpdatePreviewAssetsSelected ]]
            -- upvalues: v98 (copy), v19 (ref)
            v98(v19(v103, v104));
        end
    };
end)(v26);