local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Components.Asset.Asset);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_Categorization_0 = l_script_FirstAncestor_0.Core.Components.Categorization;
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v6 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v8 = require(l_script_FirstAncestor_0.Core.ContextServices.ModalContext);
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v10 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v11 = require(l_Categorization_0.Swimlane);
local v12 = require(l_script_FirstAncestor_0.Core.Hooks.useContextualAssets);
local v13 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v14 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxContextualRecommendationsShadowTraffic);
local v15 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v16 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixSwimlaneHeader);
local l_useState_0 = v1.useState;
local l_useCallback_0 = v1.useCallback;
return function(v19) --[[ Line: 53 ]] --[[ Name: AssetSwimlane ]]
    -- upvalues: v8 (copy), v9 (copy), v12 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v1 (copy), v2 (copy), v6 (copy), v13 (copy), v5 (copy), v14 (copy), v11 (copy), v16 (copy), v10 (copy), v15 (copy)
    local v20 = v8:use();
    local v21 = v9:use();
    local v22 = v12();
    local v23, v24 = l_useState_0(0);
    local v25 = l_useCallback_0(function() --[[ Line: 61 ]]
        -- upvalues: v19 (copy)
        v19.OnClickSeeAllAssets(v19.SectionName or v19.PathName, v19.CategoryName, v19.SortName, nil, v19.QueryParams);
    end, {
        v19.CategoryName, 
        v19.OnClickSeeAllAssets, 
        v19.PathName, 
        v19.QueryParams, 
        v19.SectionName, 
        v19.SortName
    });
    local v27 = l_useCallback_0(function(v26) --[[ Line: 80 ]]
        -- upvalues: v24 (copy)
        v24(v26);
    end, {});
    local v28 = l_useCallback_0(function() --[[ Line: 84 ]]
        -- upvalues: v24 (copy)
        v24(0);
    end, {});
    local v33 = l_useCallback_0(function(_, v30) --[[ Line: 88 ]]
        -- upvalues: v23 (copy), v20 (copy), v1 (ref), v2 (ref), v6 (ref), v19 (copy), v27 (copy), v28 (copy), v13 (ref)
        local l_Id_0 = v30.Asset.Id;
        local v32 = false;
        if v23 == l_Id_0 then
            v32 = v20.canHoverAsset();
        end;
        return v1.createElement(v2, {
            assetId = l_Id_0, 
            assetData = v30, 
            assetTileLocation = v6.ASSET_TILE_LOCATION.BROWSE, 
            canInsertAsset = v19.CanInsertAsset, 
            isHovered = v32, 
            logImpression = v19.LogAssetImpression, 
            onAssetHovered = v27, 
            onAssetHoverEnded = v28, 
            onAssetPreviewButtonClicked = v19.OnAssetPreviewButtonClicked, 
            onSearchByCreator = if v13() then v19.OnSearchByCreator else nil, 
            parentAbsolutePosition = v19.ParentAbsolutePosition, 
            parentSize = v19.ParentAbsoluteSize, 
            shouldLogOnMount = v19.ShouldLogAssetOnMount, 
            swimlaneCategory = v19.SwimlaneCategory, 
            tryInsert = v19.TryInsert, 
            tryOpenAssetConfig = v19.TryOpenAssetConfig
        });
    end, {
        v20, 
        v23, 
        v27, 
        v28, 
        v19.CanInsertAsset, 
        v19.LogAssetImpression, 
        v19.OnAssetPreviewButtonClicked, 
        v19.OnSearchByCreator, 
        v19.ParentAbsolutePosition, 
        v19.ParentAbsoluteSize, 
        v19.ShouldLogAssetOnMount, 
        v19.SwimlaneCategory, 
        v19.TryInsert, 
        v19.TryOpenAssetConfig
    });
    local v37 = l_useCallback_0(function(v34) --[[ Line: 128 ]]
        -- upvalues: v5 (ref), v19 (copy), v6 (ref), v14 (ref), v1 (ref), v11 (ref), v16 (ref), v25 (copy), v33 (copy)
        local v35 = v5.shouldShowPrices(v19.CategoryName);
        local v36 = nil;
        v36 = if v35 then v6.ASSET_HEIGHT + v6.PRICE_HEIGHT else v6.ASSET_HEIGHT;
        if v14() and v19.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
            return nil;
        else
            return v1.createElement(v11, {
                Data = v34.assets, 
                IsHeaderResponsive = v16() and true or nil, 
                IsLoading = v34.loading, 
                LayoutOrder = v19.LayoutOrder, 
                OnClickSeeAll = v25, 
                OnRenderItem = v33, 
                Size = UDim2.new(0, v19.SwimlaneWidth, 0, v36), 
                Total = v34.total, 
                Title = v19.Title, 
                ZIndex = v19.ZIndex
            });
        end;
    end, {
        v25, 
        v33, 
        v19.CategoryName, 
        v19.LayoutOrder, 
        v19.SwimlaneWidth, 
        v19.Title, 
        v19.ZIndex
    });
    if v19.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME and (#v22.assetsInCameraViewport == 0 or #v22.assetsInCameraVicinity == 0) then
        return nil;
    else
        return v10.Generator({
            assetsInCameraViewport = if v19.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v22.assetsInCameraViewport else nil, 
            assetsInCameraVicinity = if v19.SectionName == v6.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then v22.assetsInCameraVicinity else nil, 
            networkInterface = v21.networkInterface, 
            categoryName = v19.CategoryName, 
            includeUnverifiedCreators = v19.IncludeUnverifiedCreators, 
            qualityFilterData = if v15() then v19.QualityFilterData else nil, 
            sortName = v19.SortName, 
            queryParams = v19.QueryParams, 
            sectionName = v19.SectionName, 
            initialPageSize = v19.InitialPageSize, 
            render = v37, 
            searchSource = v19.searchSource
        });
    end;
end;