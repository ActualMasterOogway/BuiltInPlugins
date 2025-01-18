local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Dash);
local l_Pane_0 = v3.UI.Pane;
local v8 = require(l_Parent_0.Core.Util.Constants);
local v9 = require(l_Parent_0.Core.Util.Layouter);
local v10 = require(l_Parent_0.Core.ContextServices.Settings);
local v11 = require(l_Parent_0.Core.ContextServices.ModalContext);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local v13 = require(l_Parent_0.Core.Types.Category);
local v14 = require(l_Parent_0.Core.Components.Asset.Asset);
local v15 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v20 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v21 = v4.PureComponent:extend("AssetGrid");
v21.defaultProps = {
    AssetIds = {}, 
    Size = UDim2.new(1, 0, 1, 0)
};
v21.didMount = function(v22) --[[ Line: 108 ]] --[[ Name: didMount ]]
    v22.calculateRenderBounds();
    v22.updateTopContentHeight();
end;
v21.init = function(v23, _) --[[ Line: 113 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v8 (copy), v13 (copy), v9 (copy), v14 (copy), v20 (copy)
    v23.state = {
        displayedAssetIds = {}, 
        hoveredAssetId = 0, 
        isTopContentWithinView = true, 
        lowerIndexToRender = 0, 
        topContentHeight = 0, 
        upperIndexToRender = 0, 
        width = 0
    };
    v23.scrollingFrameRef = v4.createRef();
    v23.topContentRef = v4.createRef();
    v23.tryRerender = function(v25) --[[ Line: 127 ]]
        -- upvalues: v23 (copy), v8 (ref)
        local l_props_0 = v23.props;
        local l_current_0 = v23.scrollingFrameRef.current;
        if not l_current_0 then
            return;
        else
            local l_Y_0 = l_current_0.CanvasPosition.Y;
            local l_Y_1 = l_current_0.AbsoluteWindowSize.Y;
            if l_current_0.CanvasSize.Y.Offset - (l_Y_0 + l_Y_1) < v8.DIST_FROM_BOTTOM_BEFORE_NEXT_PAGE and l_props_0.RequestNextPage then
                l_props_0.RequestNextPage();
            end;
            v23.calculateRenderBounds(v25);
            return;
        end;
    end;
    v23.calculateRenderBounds = function(v30) --[[ Line: 148 ]]
        -- upvalues: v23 (copy), v13 (ref), v8 (ref), v9 (ref)
        v23:setState(function(v31) --[[ Line: 149 ]]
            -- upvalues: v23 (ref), v13 (ref), v8 (ref), v9 (ref), v30 (copy)
            local l_props_1 = v23.props;
            local v33 = v13.shouldShowPrices(l_props_1.categoryName);
            local l_lowerIndexToRender_0 = v31.lowerIndexToRender;
            local l_topContentHeight_0 = v31.topContentHeight;
            local v36 = v31.width - 2 * v8.MAIN_VIEW_PADDING - v8.SCROLLBAR_PADDING;
            local v37 = v9.getAssetsPerRow(v36);
            local v38 = v9.getAssetCellHeightWithPadding(v33);
            local v39 = math.max(math.floor(l_lowerIndexToRender_0 / v37) * v38, 0);
            local v40 = l_topContentHeight_0 - v39;
            if l_topContentHeight_0 < v39 then
                v40 = 0;
            end;
            local v41, v42 = v9.calculateRenderBoundsForScrollingFrame(v23.scrollingFrameRef.current, v36, v40, v33);
            if v30 or v41 ~= v31.lowerIndexToRender or v42 ~= v31.upperIndexToRender then
                return {
                    displayedAssetIds = v9.sliceAssetsFromBounds(l_props_1.AssetIds or {}, v41, v42), 
                    lowerIndexToRender = v41, 
                    upperIndexToRender = v42
                };
            else
                return;
            end;
        end);
    end;
    v23.onScroll = function(v43) --[[ Line: 189 ]]
        -- upvalues: v23 (copy)
        if not v23.props.isPreviewing then
            v23.tryRerender();
        end;
        v23:setState(function(v44) --[[ Line: 193 ]]
            -- upvalues: v43 (copy), v23 (ref)
            local v45 = nil;
            if v43 and v23.props.RenderTopContent then
                v45 = v43.CanvasPosition.Y <= v44.topContentHeight;
            end;
            if v44.hoveredAssetId ~= 0 then
                return {
                    hoveredAssetId = 0, 
                    isTopContentWithinView = v45
                };
            elseif v45 ~= v44.isTopContentWithinView then
                return {
                    isTopContentWithinView = v45
                };
            else
                return;
            end;
        end);
    end;
    v23.onAssetHovered = function(v46) --[[ Line: 214 ]]
        -- upvalues: v23 (copy)
        v23:setState(function(v47) --[[ Line: 215 ]]
            -- upvalues: v23 (ref), v46 (copy)
            local l_Modal_0 = v23.props.Modal;
            if v47.hoveredAssetId == 0 and l_Modal_0.canHoverAsset() then
                return {
                    hoveredAssetId = v46
                };
            else
                return;
            end;
        end);
    end;
    v23.onAssetHoverEnded = function(v49) --[[ Line: 227 ]]
        -- upvalues: v23 (copy)
        v23:setState(function(v50) --[[ Line: 228 ]]
            -- upvalues: v49 (copy)
            if v50.hoveredAssetId == v49 then
                return {
                    hoveredAssetId = 0
                };
            else
                return;
            end;
        end);
    end;
    v23.onFocusLost = function(_, v52) --[[ Line: 239 ]]
        -- upvalues: v23 (copy)
        if v52.UserInputType == Enum.UserInputType.Focus then
            v23.onAssetHoverEnded();
        end;
    end;
    v23.getAssetElements = function() --[[ Line: 245 ]]
        -- upvalues: v23 (copy), v13 (ref), v8 (ref), v4 (ref), v14 (ref), v20 (ref)
        local l_props_2 = v23.props;
        local l_state_0 = v23.state;
        local l_AbsoluteSize_0 = l_props_2.AbsoluteSize;
        local l_AbsolutePosition_0 = l_props_2.AbsolutePosition;
        local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
        local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
        local l_TryInsert_0 = l_props_2.TryInsert;
        local l_AssetMap_0 = l_props_2.AssetMap;
        local v61 = v13.shouldShowPrices(l_props_2.categoryName);
        local v62 = nil;
        v62 = if v61 then UDim2.new(0, v8.ASSET_WIDTH_NO_PADDING, 0, v8.ASSET_HEIGHT + v8.PRICE_HEIGHT) else UDim2.new(0, v8.ASSET_WIDTH_NO_PADDING, 0, v8.ASSET_HEIGHT);
        local v63 = {
            UIGridLayout = v4.createElement("UIGridLayout", {
                CellPadding = UDim2.new(0, v8.BETWEEN_ASSETS_HORIZONTAL_PADDING, 0, v8.BETWEEN_ASSETS_VERTICAL_PADDING), 
                CellSize = v62, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                [v4.Event.Changed] = v23.tryRerender
            })
        };
        for v64, v65 in ipairs(l_state_0.displayedAssetIds) do
            local v66 = v65[1];
            local v67 = l_AssetMap_0[v66];
            v63[tostring(v66)] = v4.createElement(v14, {
                assetId = v66, 
                assetData = v67, 
                assetTileLocation = v8.ASSET_TILE_LOCATION.BROWSE, 
                canInsertAsset = l_CanInsertAsset_0, 
                isHovered = v66 == v23.state.hoveredAssetId, 
                LayoutOrder = v64, 
                logImpression = l_props_2.LogAssetImpression, 
                onAssetHovered = v23.onAssetHovered, 
                onAssetHoverEnded = v23.onAssetHoverEnded, 
                onAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                onSearchByCreator = if v20() then l_props_2.OnSearchByCreator else nil, 
                parentSize = l_AbsoluteSize_0, 
                parentAbsolutePosition = l_AbsolutePosition_0, 
                tryInsert = l_TryInsert_0, 
                tryOpenAssetConfig = l_TryOpenAssetConfig_0
            });
        end;
        return v63;
    end;
    v23.calculateCanvasHeight = function() --[[ Line: 306 ]]
        -- upvalues: v23 (copy), v8 (ref), v13 (ref), v9 (ref)
        local l_props_3 = v23.props;
        local v69 = v23.state.width - 2 * v8.MAIN_VIEW_PADDING - v8.SCROLLBAR_PADDING;
        local v70 = v13.shouldShowPrices(l_props_3.categoryName);
        local v71 = #l_props_3.AssetIds;
        return v9.calculateAssetsHeight(v71, v69, v70) + v8.ASSET_OUTLINE_EXTRA_HEIGHT + 2 * v8.MAIN_VIEW_PADDING;
    end;
    v23.getWidth = function() --[[ Line: 319 ]]
        -- upvalues: v23 (copy)
        v23:setState(function(v72) --[[ Line: 320 ]]
            -- upvalues: v23 (ref)
            local l_current_1 = v23.scrollingFrameRef.current;
            if l_current_1 and v72.width ~= l_current_1.AbsoluteSize.X then
                return {
                    width = l_current_1.AbsoluteSize.X
                };
            else
                return;
            end;
        end);
    end;
    v23.updateTopContentHeight = function() --[[ Line: 330 ]]
        -- upvalues: v23 (copy)
        v23:setState(function(v74) --[[ Line: 331 ]]
            -- upvalues: v23 (ref)
            local l_current_2 = v23.topContentRef.current;
            local v76 = l_current_2 and l_current_2.AbsoluteSize.Y or 0;
            if v76 ~= v74.topContentHeight then
                return {
                    topContentHeight = v76
                };
            else
                return;
            end;
        end);
    end;
end;
v21.didUpdate = function(v77, v78, v79) --[[ Line: 343 ]] --[[ Name: didUpdate ]]
    local l_props_4 = v77.props;
    local l_state_1 = v77.state;
    local v82 = l_state_1.upperIndexToRender - l_state_1.lowerIndexToRender;
    local v83 = #(l_state_1.displayedAssetIds or {});
    local v84 = l_props_4.networkErrors or {};
    if not v84[#v84] and v83 < v82 and v83 ~= 0 and l_props_4.RequestNextPage then
        l_props_4.RequestNextPage();
    end;
    if v78.AssetIds ~= l_props_4.AssetIds then
        v77:calculateRenderBounds(false);
    end;
    if v79.topContentHeight ~= l_state_1.topContentHeight or v79.width ~= l_state_1.width then
        v77.tryRerender(true);
    end;
end;
v21.getDerivedStateFromProps = function(v85, v86) --[[ Line: 367 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v9 (copy), v2 (copy)
    local v87 = v86.lowerIndexToRender or 0;
    local v88 = v86.upperIndexToRender or 0;
    local v89 = v9.sliceAssetsFromBounds(v85.AssetIds or {}, v87, v88);
    local v90 = false;
    for _, v92 in ipairs(v85.AssetIds) do
        if v86.hoveredAssetId == v92 then
            v90 = true;
            break;
        end;
    end;
    local v93 = nil;
    v93 = if v90 then v86.hoveredAssetId else 0;
    return v2.Dictionary.join(v86, {
        displayedAssetIds = v89, 
        hoveredAssetId = v93, 
        lowerIndexToRender = v87, 
        upperIndexToRender = v88
    });
end;
v21.render = function(v94) --[[ Line: 395 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v13 (copy), v9 (copy), v4 (copy), v15 (copy), l_Pane_0 (copy), v6 (copy)
    local l_props_5 = v94.props;
    local l_state_2 = v94.state;
    local l_categoryName_0 = l_props_5.categoryName;
    local l_isPreviewing_0 = l_props_5.isPreviewing;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Position_0 = l_props_5.Position;
    local l_RenderTopContent_0 = l_props_5.RenderTopContent;
    local l_Size_0 = l_props_5.Size;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_lowerIndexToRender_1 = l_state_2.lowerIndexToRender;
    local l_topContentHeight_1 = l_state_2.topContentHeight;
    local l_width_0 = l_state_2.width;
    local v107 = v94.getAssetElements();
    local v108 = v94.calculateCanvasHeight();
    local v109 = l_width_0 - 2 * v8.MAIN_VIEW_PADDING - v8.SCROLLBAR_PADDING;
    local v110 = v13.shouldShowPrices(l_categoryName_0);
    local v111 = v9.getAssetsPerRow(v109);
    local v112 = v9.getAssetCellHeightWithPadding(v110);
    local v113 = math.max(math.floor(l_lowerIndexToRender_1 / v111) * v112, 0);
    local v114 = l_topContentHeight_1 - v113;
    if l_topContentHeight_1 < v113 then
        v114 = 0;
    end;
    local v115 = l_RenderTopContent_0 and l_RenderTopContent_0() or nil;
    if v115 then
        v113 = v113 + 10;
    end;
    v115 = v94.state.isTopContentWithinView and v115;
    local v116 = v4.createElement(v15, {
        CanvasSize = UDim2.new(0, 0, 0, v108), 
        LayoutOrder = l_LayoutOrder_0, 
        onScroll = v94.onScroll, 
        scrollingEnabled = not l_isPreviewing_0, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor = l_Stylizer_0.homeView.backgroundColor, 
        [v4.Ref] = v94.scrollingFrameRef, 
        OnAbsoluteSizeChanged = v94.getWidth
    }, {
        UIPadding = v4.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v8.MAIN_VIEW_PADDING), 
            PaddingLeft = UDim.new(0, v8.MAIN_VIEW_PADDING), 
            PaddingRight = UDim.new(0, v8.MAIN_VIEW_PADDING), 
            PaddingTop = UDim.new(0, v8.MAIN_VIEW_PADDING)
        }), 
        TopContent = if v115 then v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_topContentHeight_1), 
            [v4.Change.AbsoluteSize] = v94.updateTopContentHeight, 
            [v4.Ref] = v94.topContentRef, 
            ZIndex = 2
        }, {
            v115
        }) else nil, 
        InnerGrid = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v113 + v114), 
            Size = UDim2.new(1, 0, 1, -v114), 
            [v4.Event.InputEnded] = v94.onFocusLost
        }, v107)
    });
    return v4.createElement(l_Pane_0, v6.join({
        BackgroundColor = l_Stylizer_0.homeView.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, l_props_5.WrapperProps), {
        StyledScrollingFrame = v116
    });
end;
v21 = l_withContext_0({
    Settings = v10, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v11
})(v21);
v21 = v5.connect(function(v117, v118) --[[ Line: 490 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy)
    v117 = v117 or {};
    local v119 = v117.assets or {};
    local v120 = (v117.pageInfo or {}).categoryName or v13.DEFAULT.name;
    return {
        assetMap = v118.AssetMap, 
        categoryName = v120, 
        isPreviewing = v119.isPreviewing or false, 
        networkErrors = v117.networkErrors or {}
    };
end, nil)(v21);
TypedComponent = function(v121, v122) --[[ Line: 508 ]] --[[ Name: TypedComponent ]]
    -- upvalues: v4 (copy), v21 (ref)
    return v4.createElement(v21, v121, v122);
end;
return l_withAbsoluteSizeAndPosition_0(TypedComponent);