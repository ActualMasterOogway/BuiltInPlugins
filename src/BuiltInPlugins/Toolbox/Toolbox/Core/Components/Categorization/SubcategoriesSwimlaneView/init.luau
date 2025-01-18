local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Sort);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Dash);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_LinkText_0 = v3.UI.LinkText;
local l_Pane_0 = v3.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_script_FirstAncestor_0.Core.Components.Categorization.AssetSwimlane);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v15 = require(l_script_FirstAncestor_0.Core.Util.Layouter);
local v16 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedCategoryMap);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v20 = require(l_Util_0.Constants);
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v22 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v23 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v24 = v2.PureComponent:extend("SubcategoriesSwimlaneView");
v24.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v24.init = function(v25) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v15 (copy), v6 (copy), v2 (copy), v13 (copy), v23 (copy), v22 (copy), v20 (copy)
    v25.onClickBack = function(_) --[[ Line: 76 ]]
        -- upvalues: v25 (copy)
        local l_OnClickBack_0 = v25.props.OnClickBack;
        if l_OnClickBack_0 then
            l_OnClickBack_0();
        end;
    end;
    v25.onClickSeeAllAssets = function(_, _, _, _, v32) --[[ Line: 84 ]]
        -- upvalues: v25 (copy)
        local l_props_0 = v25.props;
        local l_CategoryName_0 = l_props_0.CategoryName;
        local l_OnClickSeeAllAssets_0 = l_props_0.OnClickSeeAllAssets;
        local l_SortName_0 = l_props_0.SortName;
        if l_OnClickSeeAllAssets_0 then
            l_OnClickSeeAllAssets_0(nil, l_CategoryName_0, l_SortName_0, nil, v32.queryParams);
        end;
    end;
    v25.renderSwimlanes = function() --[[ Line: 100 ]]
        -- upvalues: v25 (copy), v4 (ref), v15 (ref), v6 (ref), v2 (ref), v13 (ref), v23 (ref), v22 (ref), v20 (ref)
        local l_props_1 = v25.props;
        local _ = v25.state;
        local l_CategoryName_1 = l_props_1.CategoryName;
        local _ = l_props_1.Localization;
        local _ = l_props_1.Size;
        local _ = l_props_1.SectionName;
        local v43 = l_props_1.SortName or v4.getDefaultSortNameForCategory(l_CategoryName_1);
        local l_SubcategoryDict_0 = l_props_1.SubcategoryDict;
        local _ = l_props_1.Stylizer;
        local l_IncludeUnverifiedCreators_0 = l_props_1.IncludeUnverifiedCreators;
        local l_CanInsertAsset_0 = l_props_1.CanInsertAsset;
        local l_TryInsert_0 = l_props_1.TryInsert;
        local l_TryOpenAssetConfig_0 = l_props_1.TryOpenAssetConfig;
        local l_OnClickSeeAllAssets_1 = l_props_1.OnClickSeeAllAssets;
        local v51 = v15.getSwimlaneWidth(l_props_1.AbsoluteSize.X);
        local l_OnAssetPreviewButtonClicked_0 = l_props_1.OnAssetPreviewButtonClicked;
        local v53 = {};
        local v55 = v6.reduce(l_SubcategoryDict_0, function(v54) --[[ Line: 125 ]]
            return v54 + 1;
        end, 1);
        for v56, v57 in pairs(l_SubcategoryDict_0) do
            v53["AssetSwimlane_" .. v56] = v2.createElement(v13, {
                CanInsertAsset = l_CanInsertAsset_0, 
                CategoryName = l_CategoryName_1, 
                SwimlaneCategory = v57.name, 
                OnClickSeeAll = function(v58, v59, v60, _) --[[ Line: 134 ]] --[[ Name: OnClickSeeAll ]]
                    -- upvalues: v25 (ref), v57 (copy)
                    return v25.onClickSeeAllAssets(v58, v59, v60, nil, v57, v57.queryParams);
                end, 
                NetworkInterface = l_props_1.Network.networkInterface, 
                ShouldLogAssetOnMount = false, 
                SortName = v43, 
                SearchTerm = v57.searchKeywords, 
                IncludeUnverifiedCreators = l_IncludeUnverifiedCreators_0, 
                QualityFilterData = if v23() then l_props_1.QualityFilterData else nil, 
                QueryParams = v57.queryParams, 
                InitialPageSize = 20, 
                LayoutOrder = v57.index, 
                LogAssetImpression = l_props_1.LogAssetImpression, 
                OnClickSeeAllAssets = l_OnClickSeeAllAssets_1, 
                OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_0, 
                OnSearchByCreator = if v22() then l_props_1.OnSearchByCreator else nil, 
                PathName = v57.name, 
                ParentAbsolutePosition = l_props_1.AbsolutePosition, 
                ParentAbsoluteSize = l_props_1.AbsoluteSize, 
                SwimlaneWidth = v51, 
                Title = v57.displayName, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
                ZIndex = v55 - v57.index, 
                searchSource = v20.SEARCH_SOURCE.CATEGORY
            });
        end;
        return v53;
    end;
end;
v24.render = function(v62) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v16 (copy), v6 (copy), v2 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy), v20 (copy), l_LinkText_0 (copy)
    local l_props_2 = v62.props;
    local l_CategoryName_2 = l_props_2.CategoryName;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Localization_1 = l_props_2.Localization;
    local l_Size_1 = l_props_2.Size;
    local _ = l_props_2.SectionName;
    if not l_props_2.SortName then
        local _ = v4.getDefaultSortNameForCategory(l_CategoryName_2);
    end;
    local _ = l_props_2.SubcategoryDict;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local _ = l_props_2.CanInsertAsset;
    local _ = l_props_2.TryInsert;
    local _ = l_props_2.TryOpenAssetConfig;
    local _ = l_props_2.OnClickSeeAllAssets;
    local v76 = v62.renderSwimlanes();
    local v77 = "< " .. l_Localization_1:getText("General", "BackToHome", {
        assetType = v16(l_Localization_1)[l_props_2.CategoryName]
    });
    local v78 = v6.join({
        BackgroundColor3 = l_Stylizer_1.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_1
    }, l_props_2.WrapperProps);
    return v2.createElement(l_Pane_0, v78, {
        ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            EnableScrollBarBackground = true, 
            LayoutOrder = l_LayoutOrder_0, 
            Padding = v20.MAIN_VIEW_PADDING, 
            Size = l_Size_1
        }, {
            Contents = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = l_Stylizer_1.backgroundColor, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Spacing = 20, 
                Size = UDim2.new(1, 0, 0, 0), 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, v6.join({
                BackButton = v2.createElement(l_LinkText_0, {
                    LayoutOrder = -1, 
                    OnClick = v62.onClickBack, 
                    Style = "Unobtrusive", 
                    Text = v77
                })
            }, v76))
        })
    });
end;
mapStateToProps = function(v79, _) --[[ Line: 242 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v23 (copy)
    local v81 = (v79 or {}).pageInfo or {};
    return {
        IncludeUnverifiedCreators = v81.includeUnverifiedCreators, 
        QualityFilterData = if v23() then v81.qualityFilterData else nil
    };
end;
v24 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v9
})(v24);
return l_withAbsoluteSizeAndPosition_0((v5.connect(mapStateToProps)(v24)));