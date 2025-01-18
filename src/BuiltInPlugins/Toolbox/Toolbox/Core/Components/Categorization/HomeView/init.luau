local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_game_FastInt_0 = game:GetFastInt("ToolboxHomeViewInitialPageSize");
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v3 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local l_Packages_0 = l_Parent_0.Packages;
local v5 = require(l_Packages_0.Framework);
local v6 = require(l_Packages_0.Roact);
local v7 = require(l_Packages_0.RoactRodux);
local _ = require(l_Packages_0.Dash);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_Parent_0.Core.ContextServices.Settings);
local v12 = require(l_Parent_0.Core.Util.Layouter);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_LoadingIndicator_0 = v5.UI.LoadingIndicator;
local l_Pane_0 = v5.UI.Pane;
local _ = require(l_Parent_0.Core.Components.Asset.Asset);
local v18 = require(l_Parent_0.Core.Components.AssetGrid);
local _ = require(l_Parent_0.Core.Components.AssetLogicWrapper);
local v20 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local v21 = require(l_Parent_0.Core.Components.ResultsFetcher);
local _ = require(l_Parent_0.Core.Types.Category);
local v23 = require(l_Parent_0.Core.Components.Categorization.AssetSwimlane);
local _ = require(l_Parent_0.Core.Components.Categorization.ExpandableTeaser);
local v25 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local v26 = require(l_Parent_0.Core.Components.Categorization.SectionHeader);
local v27 = require(l_Parent_0.Core.Components.Categorization.Swimlane);
local l_Util_0 = l_Parent_0.Core.Util;
local v29 = require(l_Util_0.Constants);
local v30 = require(l_Util_0.getStartupAssetId);
local v31 = require(l_Util_0.Urls);
local v32 = require(l_Parent_0.Core.Thunks.GetAssetPreviewDataForStartup);
local v33 = require(l_Parent_0.Core.Networking.Requests.RequestSearchRequest);
local v34 = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v37 = Vector2.new(75, 90);
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v29.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local v39 = v6.PureComponent:extend("HomeView");
v39.defaultProps = {
    Size = UDim2.new(1, 0, 0, 0)
};
v39.didMount = function(v40) --[[ Line: 131 ]] --[[ Name: didMount ]]
    -- upvalues: v30 (copy)
    local l_props_0 = v40.props;
    local v42 = tonumber((v30()));
    if v42 then
        local l_OnAssetPreviewButtonClicked_0 = l_props_0.OnAssetPreviewButtonClicked;
        l_props_0.getAssetPreviewDataForStartup(v42, l_props_0.TryInsert, l_props_0.Localization, l_props_0.Network.networkInterface, l_OnAssetPreviewButtonClicked_0);
    end;
    v40.onOverallAbsoluteSizeChange();
end;
v39.init = function(v44) --[[ Line: 150 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v12 (copy), v31 (copy), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (copy), v20 (copy), v37 (copy), l_LayoutOrderIterator_0 (copy), v23 (copy), v2 (copy), v3 (copy), l_Pane_0 (copy), v27 (copy), v26 (copy), v25 (copy)
    v44.sizerRef = v6.createRef();
    v44.state = {
        showTopSearchesFullHeight = false, 
        swimlaneWidth = 0
    };
    v44.onOverallAbsoluteSizeChange = function() --[[ Line: 158 ]]
        -- upvalues: v44 (copy), v12 (ref)
        v44:setState(function(v45) --[[ Line: 159 ]]
            -- upvalues: v44 (ref), v12 (ref)
            local l_current_0 = v44.sizerRef.current;
            if not l_current_0 then
                return;
            else
                local v47 = v12.getSwimlaneWidth(l_current_0.AbsoluteSize.X);
                local v48 = l_current_0.AbsoluteSize.Y > 475;
                if v48 ~= v45.showTopSearchesFullHeight or v47 ~= v45.swimlaneWidth then
                    return {
                        absoluteSize = l_current_0.absoluteSize, 
                        showTopSearchesFullHeight = v48, 
                        swimlaneWidth = v47
                    };
                else
                    return;
                end;
            end;
        end);
    end;
    v44.onAbsolutePositionChange = function(v49) --[[ Line: 181 ]]
        -- upvalues: v44 (copy)
        v44:setState(function(_) --[[ Line: 182 ]]
            -- upvalues: v49 (copy)
            return {
                absolutePosition = v49.AbsolutePosition
            };
        end);
    end;
    v44.onClickSubcategory = function(v51) --[[ Line: 189 ]]
        -- upvalues: v44 (copy)
        local l_props_1 = v44.props;
        local l_CategoryName_0 = l_props_1.CategoryName;
        local l_OnClickSubcategory_0 = l_props_1.OnClickSubcategory;
        local l_SortName_0 = l_props_1.SortName;
        local v56 = l_props_1.SubcategoryDict[v51];
        l_OnClickSubcategory_0(v51, v56, l_CategoryName_0, l_SortName_0, v56.queryParams);
    end;
    v44.onClickSeeAllSubcategories = function() --[[ Line: 200 ]]
        -- upvalues: v44 (copy)
        local l_props_2 = v44.props;
        local l_CategoryName_1 = l_props_2.CategoryName;
        local l_SortName_1 = l_props_2.SortName;
        local l_SubcategoryDict_0 = l_props_2.SubcategoryDict;
        local l_OnClickSeeAllSubcategories_0 = l_props_2.OnClickSeeAllSubcategories;
        if l_OnClickSeeAllSubcategories_0 then
            l_OnClickSeeAllSubcategories_0(l_SubcategoryDict_0, l_CategoryName_1, l_SortName_1);
        end;
    end;
    v44.onClickSearchPill = function(v62) --[[ Line: 212 ]]
        -- upvalues: v44 (copy)
        local l_props_3 = v44.props;
        local l_CategoryName_2 = l_props_3.CategoryName;
        local _ = l_props_3.SortName;
        local l_requestSearchRequest_0 = l_props_3.requestSearchRequest;
        local l_logSearchAnalytics_0 = l_props_3.logSearchAnalytics;
        l_requestSearchRequest_0(l_props_3.Network.networkInterface, v44.props.Settings:get("Plugin"), v62, l_CategoryName_2);
        l_logSearchAnalytics_0(v62, nil);
    end;
    v44.renderSubcategory = function(_, v69) --[[ Line: 227 ]]
        -- upvalues: v31 (ref), l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 (ref), v6 (ref), v20 (ref), v44 (copy), v37 (ref)
        local v70 = "";
        local v71 = nil;
        if v69 and v69.thumbnail then
            v70 = v31.constructAssetThumbnailUrl(v69.thumbnail.assetId, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            v71 = Color3.fromHex(v69.thumbnail.backgroundColor);
        end;
        return v6.createElement(v20, {
            BackgroundColor = v71, 
            Image = v70, 
            LayoutOrder = v69.index, 
            Key = v69.name, 
            OnClick = v44.onClickSubcategory, 
            Size = UDim2.new(0, v37.X, 0, v37.Y), 
            Title = v69.displayName
        });
    end;
    v44.createTopContent = function() --[[ Line: 246 ]]
        -- upvalues: v44 (copy), l_LayoutOrderIterator_0 (ref), v6 (ref), v23 (ref), v2 (ref), v3 (ref), l_Pane_0 (ref), v27 (ref), v26 (ref), v25 (ref)
        local l_state_0 = v44.state;
        local l_props_4 = v44.props;
        local l_AssetSections_0 = l_props_4.AssetSections;
        local l_CanInsertAsset_0 = l_props_4.CanInsertAsset;
        local l_CategoryName_3 = l_props_4.CategoryName;
        local _ = l_props_4.contextualAssets;
        local l_IncludeUnverifiedCreators_0 = l_props_4.IncludeUnverifiedCreators;
        local l_Localization_0 = l_props_4.Localization;
        local l_OnClickSeeAllAssets_0 = l_props_4.OnClickSeeAllAssets;
        local l_OnAssetPreviewButtonClicked_1 = l_props_4.OnAssetPreviewButtonClicked;
        local l_SortName_3 = l_props_4.SortName;
        local l_TopKeywords_0 = l_props_4.TopKeywords;
        local l_TryInsert_0 = l_props_4.TryInsert;
        local l_TryOpenAssetConfig_0 = l_props_4.TryOpenAssetConfig;
        local l_swimlaneWidth_0 = l_state_0.swimlaneWidth;
        local v87 = l_LayoutOrderIterator_0.new();
        local l_SubcategoryDict_1 = l_props_4.SubcategoryDict;
        local v89 = 0;
        if l_SubcategoryDict_1 then
            for _ in pairs(l_SubcategoryDict_1) do
                v89 = v89 + 1;
            end;
        end;
        local l_Stylizer_0 = l_props_4.Stylizer;
        local l_searchList_0 = l_Stylizer_0.searchList;
        local l_searchPill_0 = l_Stylizer_0.searchPill;
        local l_sectionHeader_0 = l_Stylizer_0.sectionHeader;
        local v95 = l_Localization_0:getText("General", "Categories");
        local _ = l_Localization_0:getText("HomeView", "TheEssentials");
        local v97 = l_Localization_0:getText("HomeView", "TopSearches");
        local v98 = {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v99 = #l_AssetSections_0;
        local _ = v44.sizerRef.current;
        local l_absoluteSize_0 = l_state_0.absoluteSize;
        local l_absolutePosition_0 = l_state_0.absolutePosition;
        for v103, v104 in pairs(l_AssetSections_0) do
            if v103 ~= v99 then
                v98["AssetSwimlane_" .. v103] = v6.createElement(v23, {
                    CanInsertAsset = l_CanInsertAsset_0, 
                    CategoryName = l_CategoryName_3, 
                    IncludeUnverifiedCreators = l_IncludeUnverifiedCreators_0, 
                    InitialPageSize = 20, 
                    LayoutOrder = v103, 
                    LogAssetImpression = l_props_4.LogAssetImpression, 
                    OnClickSeeAllAssets = l_OnClickSeeAllAssets_0, 
                    OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_1, 
                    OnSearchByCreator = if v2() then l_props_4.OnSearchByCreator else nil, 
                    ParentAbsolutePosition = l_absolutePosition_0, 
                    ParentAbsoluteSize = l_absoluteSize_0, 
                    QualityFilterData = if v3() then l_props_4.qualityFilterData else nil, 
                    SortName = l_SortName_3, 
                    SearchTerm = nil, 
                    SectionName = v104.name, 
                    SwimlaneCategory = v104.name, 
                    SwimlaneWidth = l_swimlaneWidth_0, 
                    Title = v104.displayName, 
                    TryInsert = l_TryInsert_0, 
                    TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
                    ZIndex = v99 - v103 + 1
                });
            else
                break;
            end;
        end;
        local v105 = l_TopKeywords_0 and #l_TopKeywords_0 > 0;
        local _ = l_searchPill_0.textSize + l_searchPill_0.padding.left + l_searchPill_0.padding.right;
        local v107 = 1;
        if l_state_0.showTopSearchesFullHeight then
            v107 = 2;
        end;
        local v108 = (l_searchPill_0.textSize + l_searchPill_0.padding.top + l_searchPill_0.padding.bottom) * v107 + l_searchList_0.buttonSpacing;
        return v6.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = 20, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            SubcategorySwimlane = if v89 > 0 then v6.createElement(v27, {
                Data = l_SubcategoryDict_1, 
                LayoutOrder = v87:getNextOrder(), 
                OnClickSeeAll = v44.onClickSeeAllSubcategories, 
                OnRenderItem = v44.renderSubcategory, 
                Size = UDim2.new(0, l_swimlaneWidth_0, 0, 0), 
                Title = v95, 
                Total = v89
            }) else nil, 
            TopKeywords = if v105 then v6.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v87:getNextOrder(), 
                Size = UDim2.new(0, l_swimlaneWidth_0, 0, v108), 
                Spacing = 10, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                SectionHeader = v6.createElement(v26, {
                    OnClickSeeAll = function() --[[ Line: 380 ]] --[[ Name: OnClickSeeAll ]]

                    end, 
                    LayoutOrder = v87:getNextOrder(), 
                    SeeAllText = "", 
                    Title = v97
                }), 
                SearchList = v6.createElement(v25, {
                    Items = l_TopKeywords_0, 
                    ItemMinWidth = l_searchPill_0.padding.left + l_searchPill_0.padding.right, 
                    LayoutOrder = v87:getNextOrder(), 
                    MaxRowCount = v107, 
                    OnClick = v44.onClickSearchPill
                })
            }) else nil, 
            AssetSections = v6.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v87:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, v98), 
            GridHeader = l_AssetSections_0[v99] and v6.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_sectionHeader_0.font, 
                LayoutOrder = v87:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_sectionHeader_0.textSize), 
                Text = l_AssetSections_0[v99].displayName, 
                TextColor3 = l_sectionHeader_0.textColor, 
                TextSize = l_sectionHeader_0.textSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end;
end;
v39.render = function(v109) --[[ Line: 418 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_Pane_0 (copy), v21 (copy), l_game_FastInt_0 (copy), v3 (copy), l_LoadingIndicator_0 (copy), v18 (copy), v2 (copy)
    local l_props_5 = v109.props;
    local l_CategoryName_4 = l_props_5.CategoryName;
    local l_IncludeUnverifiedCreators_1 = l_props_5.IncludeUnverifiedCreators;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Position_0 = l_props_5.Position;
    local l_SortName_4 = l_props_5.SortName;
    local l_Size_0 = l_props_5.Size;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local l_AssetSections_1 = l_props_5.AssetSections;
    local l_SubcategoryDict_2 = l_props_5.SubcategoryDict;
    local v120 = l_AssetSections_1[#l_AssetSections_1] and l_AssetSections_1[#l_AssetSections_1].name or nil;
    local v121 = next(l_SubcategoryDict_2) ~= nil;
    local v122 = false;
    if #l_AssetSections_1 == 1 then
        v122 = not v121 and l_AssetSections_1[#l_AssetSections_1] and not l_AssetSections_1[#l_AssetSections_1].subcategory and l_props_5.TopKeywords and #l_props_5.TopKeywords == 0;
    end;
    local l_CanInsertAsset_1 = l_props_5.CanInsertAsset;
    local l_OnAssetPreviewButtonClicked_2 = l_props_5.OnAssetPreviewButtonClicked;
    local l_TryInsert_1 = l_props_5.TryInsert;
    local l_TryOpenAssetConfig_1 = l_props_5.TryOpenAssetConfig;
    local v127 = if v122 then nil else v109.createTopContent();
    local function v128() --[[ Line: 452 ]]
        -- upvalues: v127 (copy)
        return v127;
    end;
    if l_props_5.hasTutorialLimits then
        return v6.createElement(l_Pane_0, {});
    else
        return v6.createElement("Frame", {
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v6.Ref] = v109.sizerRef, 
            [v6.Change.AbsoluteSize] = v109.onOverallAbsoluteSizeChange, 
            [v6.Change.AbsolutePosition] = v109.onAbsolutePositionChange
        }, {
            v21.Generator({
                networkInterface = l_props_5.Network.networkInterface, 
                categoryName = l_CategoryName_4, 
                sortName = l_SortName_4, 
                searchTerm = nil, 
                queryParams = {}, 
                sectionName = v120, 
                initialPageSize = l_game_FastInt_0, 
                includeUnverifiedCreators = l_IncludeUnverifiedCreators_1, 
                qualityFilterData = if v3() then l_props_5.qualityFilterData else nil, 
                render = function(v129) --[[ Line: 477 ]] --[[ Name: render ]]
                    -- upvalues: v6 (ref), l_Stylizer_1 (copy), l_LayoutOrder_0 (copy), l_Position_0 (copy), l_Size_0 (copy), l_LoadingIndicator_0 (ref), v18 (ref), v128 (copy), l_CanInsertAsset_1 (copy), l_OnAssetPreviewButtonClicked_2 (copy), v2 (ref), l_props_5 (copy), l_TryInsert_1 (copy), l_TryOpenAssetConfig_1 (copy)
                    if v129.loading and #v129.assetIds == 0 then
                        return v6.createElement("Frame", {
                            BackgroundColor3 = l_Stylizer_1.backgroundColor, 
                            LayoutOrder = l_LayoutOrder_0, 
                            Position = l_Position_0, 
                            Size = l_Size_0
                        }, {
                            LoadingIndicator = v6.createElement(l_LoadingIndicator_0, {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Position = UDim2.new(0.5, 0, 0.5, 0)
                            })
                        });
                    else
                        return v18({
                            AssetIds = v129.assetIds, 
                            AssetMap = v129.assetMap, 
                            LayoutOrder = l_LayoutOrder_0, 
                            Position = l_Position_0, 
                            RenderTopContent = v128, 
                            RequestNextPage = v129.fetchNextPage, 
                            Size = l_Size_0, 
                            CanInsertAsset = l_CanInsertAsset_1, 
                            OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_2, 
                            OnSearchByCreator = if v2() then l_props_5.OnSearchByCreator else nil, 
                            LogAssetImpression = l_props_5.LogAssetImpression, 
                            TryInsert = l_TryInsert_1, 
                            TryOpenAssetConfig = l_TryOpenAssetConfig_1
                        });
                    end;
                end
            })
        });
    end;
end;
mapStateToProps = function(v130, _) --[[ Line: 516 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v3 (copy)
    v130 = v130 or {};
    local v132 = v130.pageInfo or {};
    return {
        IncludeUnverifiedCreators = v132.includeUnverifiedCreators, 
        hasTutorialLimits = v130.tutorialLimits.assetIds ~= nil, 
        qualityFilterData = if v3() then v132.qualityFilterData else nil
    };
end;
local function v145(v133) --[[ Line: 527 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v32 (copy), v33 (copy), v34 (copy)
    return {
        getAssetPreviewDataForStartup = function(v134, v135, v136, v137, v138) --[[ Line: 529 ]] --[[ Name: getAssetPreviewDataForStartup ]]
            -- upvalues: v133 (copy), v32 (ref)
            v133(v32(v134, v135, v136, v137, v138));
        end, 
        requestSearchRequest = function(v139, v140, v141, v142) --[[ Line: 532 ]] --[[ Name: requestSearchRequest ]]
            -- upvalues: v133 (copy), v33 (ref)
            v133(v33(v139, v140, v141, v142, true));
        end, 
        logSearchAnalytics = function(v143, _) --[[ Line: 535 ]] --[[ Name: logSearchAnalytics ]]
            -- upvalues: v133 (copy), v34 (ref)
            v133(v34(v143, true));
        end
    };
end;
v39 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = v11, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v13
})(v39);
return v7.connect(mapStateToProps, v145)(v39);