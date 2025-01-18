local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxOpenAssetPreviewIfFiatCannotBeInserted);
local v5 = game:DefineFastFlag("ToolboxFixAbsolutePositionResizing", false);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Roact);
local v8 = require(l_Packages_0.RoactRodux);
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.Images);
local v12 = require(l_Util_0.getTimeString);
local v13 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Util_0.AssetUtil);
local v15 = require(l_Util_0.FiatUtil);
local v16 = require(l_Parent_0.Core.Localization.getLocalizedAssetStatusMap);
local l_Components_0 = l_Parent_0.Core.Components;
local l_Asset_0 = l_Components_0.Asset;
local v19 = require(l_Components_0.DraggableButton);
local v20 = require(l_Components_0.DropShadow);
local v21 = require(l_Asset_0.AssetCreatorName);
local v22 = require(l_Asset_0.AssetIcon);
local v23 = require(l_Asset_0.AssetName);
local v24 = require(l_Asset_0.Voting.Voting);
local v25 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v26 = require(l_Parent_0.Core.Thunks.TryCreateContextMenu);
local v27 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v28 = require(l_Parent_0.Core.Networking.Requests.GetAssetMediaIdsRequest);
local v29 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v30 = require(l_Parent_0.Core.Networking.Requests.GetCanManageAssetRequest);
local v31 = require(l_Parent_0.Core.Networking.Requests.GetVoteRequest);
local v32 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v33 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v33.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v36 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = v33.UI.TextLabel;
local l_Util_1 = v33.Util;
local l_formatVoteNumber_0 = l_Util_1.formatVoteNumber;
local l_GetTextSize_0 = l_Util_1.GetTextSize;
local l_disableRatings_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableRatings;
local l_Types_0 = l_Parent_0.Core.Types;
local v43 = require(l_Types_0.Category);
local v44 = require(l_Types_0.AssetSubTypes);
local v45 = v7.PureComponent:extend("Asset");
v45.defaultProps = {
    parentSize = Vector2.new(), 
    parentAbsolutePosition = Vector2.new(), 
    logImpression = function() --[[ Line: 86 ]] --[[ Name: logImpression ]]

    end, 
    onAssetHovered = function() --[[ Line: 87 ]] --[[ Name: onAssetHovered ]]

    end, 
    onAssetHoverEnded = function() --[[ Line: 88 ]] --[[ Name: onAssetHoverEnded ]]

    end, 
    shouldLogOnMount = true
};
v45.init = function(v46, v47) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v43 (copy), v15 (copy), v4 (copy), v14 (copy)
    v46.wasAssetBoundsWithinScrollingBounds = false;
    v46.hasInitiated = false;
    v46.ref = v7.createRef();
    v46.state = {
        hoverPosition = nil
    };
    local _ = v47.canInsertAsset;
    v46.showVotes = false;
    v46.onMouseEntered = function(_, _, _) --[[ Line: 104 ]]
        -- upvalues: v46 (copy), v43 (ref), v47 (copy)
        v46.props.onAssetHovered(v46.props.assetId);
        if v46.showVotes then
            local l_assetType_0 = v43.getCategoryByName(v46.props.categoryName).assetType;
            v47.getVote(v46.props.Network.networkInterface, v46.props.assetId, v43.getAssetTypeByNumber(l_assetType_0));
        end;
        local l_assetData_0 = v46.props.assetData;
        local l_Asset_1 = l_assetData_0.Asset;
        local v55 = false;
        if l_Asset_1.TypeId == Enum.AssetType.Plugin.Value then
            v55 = l_assetData_0.Creator.IsVerifiedCreator;
        end;
        if v55 then
            v47.getAssetMediaIds(v46.props.Network.networkInterface, v46.props.assetId);
        end;
    end;
    v46.onMouseLeave = function(_, _, _) --[[ Line: 123 ]]
        -- upvalues: v46 (copy)
        v46.props.onAssetHoverEnded(v46.props.assetId);
    end;
    v46.onInputEnded = function(_, v60) --[[ Line: 127 ]]
        -- upvalues: v46 (copy)
        if v60.UserInputType == Enum.UserInputType.Focus then
            v46.props.onAssetHoverEnded(v46.props.assetId);
        end;
    end;
    v46.onMouseMoved = function(_, _, _) --[[ Line: 133 ]]
        -- upvalues: v46 (copy)
        v46.props.onAssetHovered(v46.props.assetId);
    end;
    v46.canInsertAsset = function() --[[ Line: 138 ]]
        -- upvalues: v46 (copy), v43 (ref), v15 (ref)
        local l_props_0 = v46.props;
        local l_assetData_1 = l_props_0.assetData;
        local l_ownsAsset_0 = l_props_0.ownsAsset;
        if l_assetData_1 then
            local v67 = v43.shouldShowPrices(l_props_0.categoryName);
            local v68 = l_assetData_1.Product and l_assetData_1.Product.Price or 0;
            local v69 = if l_assetData_1.FiatProduct and l_assetData_1.FiatProduct.PurchasePrice then v15.isFree(l_assetData_1.FiatProduct.PurchasePrice) else v68 == 0;
            local v70 = v67 and l_ownsAsset_0;
            return l_props_0.canInsertAsset() and (v70 or v69);
        else
            return l_props_0.canInsertAsset();
        end;
    end;
    v46.onDragStart = function(_, _, _) --[[ Line: 156 ]]
        -- upvalues: v46 (copy)
        if not v46.canInsertAsset() then
            return;
        else
            local l_assetData_2 = v46.props.assetData;
            local l_swimlaneCategory_0 = v46.props.swimlaneCategory;
            v46.props.tryInsert(l_assetData_2, true, nil, l_swimlaneCategory_0);
            return;
        end;
    end;
    v46.onClick = function(_, _, _) --[[ Line: 166 ]]
        -- upvalues: v46 (copy), v4 (ref)
        if not v46.canInsertAsset() then
            if v4() then
                v46.onAssetPreviewButtonClicked();
            end;
            return;
        else
            local l_assetData_3 = v46.props.assetData;
            local l_Asset_2 = l_assetData_3.Asset;
            local l_swimlaneCategory_1 = v46.props.swimlaneCategory;
            if l_Asset_2.TypeId == Enum.AssetType.Plugin.Value then
                v46.onAssetPreviewButtonClicked();
                return;
            else
                v46.props.tryInsert(l_assetData_3, false, nil, l_swimlaneCategory_1);
                return;
            end;
        end;
    end;
    v46.onAssetPreviewButtonClicked = function() --[[ Line: 186 ]]
        -- upvalues: v46 (copy)
        local l_assetData_4 = v46.props.assetData;
        local l_swimlaneCategory_2 = v46.props.swimlaneCategory;
        v46.props.onAssetPreviewButtonClicked(l_assetData_4, l_swimlaneCategory_2);
    end;
    v46.tryCreateContextMenu = function(v84) --[[ Line: 192 ]]
        -- upvalues: v46 (copy)
        local l_props_1 = v46.props;
        local l_assetData_5 = l_props_1.assetData;
        local v87 = l_props_1.Plugin:get();
        local l_tryOpenAssetConfig_0 = l_props_1.tryOpenAssetConfig;
        local v89 = v46.props.getPageInfoAnalyticsContextInfo();
        v46.props.tryCreateContextMenu(l_assetData_5, v84, v87, l_tryOpenAssetConfig_0, v89);
    end;
    v46.onAbsolutePositionChange = function(v90) --[[ Line: 204 ]]
        -- upvalues: v46 (copy), v14 (ref)
        local l_assetData_6 = v46.props.assetData;
        local l_AbsolutePosition_0 = v90.AbsolutePosition;
        local l_categoryName_0 = v46.props.categoryName;
        local v94 = v14.getAssetSize(l_categoryName_0);
        local v95 = false;
        if v90.AnchorPoint.X == 0 then
            v95 = v90.AnchorPoint.Y == 0;
        end;
        assert(v95, "self.onAbsolutePositionChange needs the asset AnchorPoint to be 0,0 to calculate the scrollingBounds.");
        local v96 = Vector2.new(v94.X.Offset, v94.Y.Offset);
        v95 = v46.props.parentSize;
        local l_parentAbsolutePosition_0 = v46.props.parentAbsolutePosition;
        local v98 = nil;
        local l_swimlaneCategory_3 = v46.props.swimlaneCategory;
        local v100 = v46.props.NavigationContext:get();
        v98 = v46.props.AssetAnalytics:get().getNavigationContext(v100, l_swimlaneCategory_3);
        v46.wasAssetBoundsWithinScrollingBounds = v46.props.logImpression(l_assetData_6, v46.wasAssetBoundsWithinScrollingBounds, v96, l_AbsolutePosition_0, v95, l_parentAbsolutePosition_0, v98);
    end;
end;
v45.didMount = function(v101) --[[ Line: 237 ]] --[[ Name: didMount ]]
    local l_assetData_7 = v101.props.assetData;
    local l_assetId_0 = v101.props.assetId;
    v101.props.getOwnsAsset(v101.props.Network.networkInterface, l_assetId_0);
    v101.props.getCanManageAsset(v101.props.Network.networkInterface, l_assetId_0);
    if l_assetData_7 then
        local _ = v101.props.getPageInfoAnalyticsContextInfo();
        local l_swimlaneCategory_4 = v101.props.swimlaneCategory;
        local v106 = v101.props.NavigationContext:get();
        local _ = v101.props.AssetAnalytics:get().getNavigationContext(v106, l_swimlaneCategory_4);
        if v101.ref.current and v101.props.shouldLogOnMount then
            v101.onAbsolutePositionChange(v101.ref.current);
        end;
    end;
end;
v45.didUpdate = function(v108, v109, _) --[[ Line: 262 ]] --[[ Name: didUpdate ]]
    -- upvalues: v5 (copy)
    if v5 then
        if v108.ref.current ~= nil and v109.parentSize ~= v108.props.parentSize then
            v108.onAbsolutePositionChange(v108.ref.current);
            return;
        end;
    elseif v109.parentSize ~= v108.props.parentSize then
        v108.onAbsolutePositionChange(v108.ref.current);
    end;
end;
v45.render = function(v111) --[[ Line: 274 ]] --[[ Name: render ]]
    -- upvalues: v43 (copy), v27 (copy), v44 (copy), v15 (copy), v3 (copy), v10 (copy), l_disableRatings_0 (copy), l_formatVoteNumber_0 (copy), v9 (copy), l_GetTextSize_0 (copy), v12 (copy), v7 (copy), v14 (copy), v20 (copy), v19 (copy), v22 (copy), v23 (copy), v11 (copy), v21 (copy), v2 (copy), v24 (copy), v16 (copy)
    local l_props_2 = v111.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local l_assetId_1 = l_props_2.assetId;
    local l_assetData_8 = l_props_2.assetData;
    local l_categoryName_1 = l_props_2.categoryName;
    local l_currentUserPackagePermissions_0 = l_props_2.currentUserPackagePermissions;
    local l_hideCreatorName_0 = l_props_2.hideCreatorName;
    local v120 = v43.categoryIsGroupPackages(l_categoryName_1);
    local v121 = true;
    if l_currentUserPackagePermissions_0[l_assetId_1] ~= v27.EditKey then
        v121 = l_currentUserPackagePermissions_0[l_assetId_1] == v27.OwnKey;
    end;
    local v122 = nil;
    v122 = not v120 or v121;
    if not l_assetData_8 or not v122 then
        return;
    else
        local l_LayoutOrder_0 = l_props_2.LayoutOrder;
        local l_ownsAsset_1 = l_props_2.ownsAsset;
        local l_Asset_3 = l_assetData_8.Asset;
        l_assetId_1 = l_props_2.assetId;
        local l_TypeId_0 = l_Asset_3.TypeId;
        local l_IsEndorsed_0 = l_Asset_3.IsEndorsed;
        local l_IsVerifiedCreator_0 = l_assetData_8.Creator.IsVerifiedCreator;
        local l_HasScripts_0 = l_Asset_3.HasScripts;
        local v130 = if l_Asset_3.AssetSubTypes then v44.contains(l_Asset_3.AssetSubTypes, v44.Package) else nil;
        local v131 = false;
        if l_TypeId_0 == Enum.AssetType.Audio.Value then
            v131 = true;
        end;
        local l_Name_0 = l_Asset_3.Name;
        local l_Status_0 = l_Asset_3.Status;
        local v134 = v43.shouldShowPrices(l_props_2.categoryName);
        local v135 = nil;
        local v136 = nil;
        local v137 = nil;
        if v134 then
            v136 = false;
            local l_FiatProduct_0 = l_assetData_8.FiatProduct;
            if l_FiatProduct_0 and l_FiatProduct_0.PurchasePrice then
                v135 = v15.displayStringFromMoney(l_FiatProduct_0.PurchasePrice, l_Localization_0);
            elseif v3() then
                v135 = "";
                if v10.shouldDebugWarnings() then
                    warn(("AssetTile expected fiatProduct for categoryName %s, but found none for assetId %s"):format(l_props_2.categoryName, l_Asset_3.Id));
                end;
            else
                v136 = true;
                local v139 = l_assetData_8.Product and l_assetData_8.Product.Price or 0;
                v137 = v139 == 0;
                v135 = if v137 then l_Localization_0:getText("Purchase", "Free") else v139;
            end;
        end;
        local l_Creator_0 = l_assetData_8.Creator;
        local l_Name_1 = l_Creator_0.Name;
        local v142 = l_props_2.voting or {};
        local l_ShowVotes_0 = v142.ShowVotes;
        local v144 = v43.getTabForCategoryName(l_props_2.categoryName) == v43.CREATIONS;
        if v43.getTabForCategoryName(l_props_2.categoryName) ~= v43.MARKETPLACE or v131 or l_disableRatings_0() then
            l_ShowVotes_0 = false;
        end;
        v111.showVotes = l_ShowVotes_0;
        local v145 = v144 and l_Status_0 ~= nil;
        local l_isHovered_0 = l_props_2.isHovered;
        local v147 = nil;
        local v148 = nil;
        local v149 = nil;
        local v150 = nil;
        local v151 = nil;
        local _ = nil;
        local v153 = nil;
        local v154 = nil;
        local v155 = nil;
        local v156 = false;
        if v142 ~= nil then
            v156 = false;
            if v142.VoteCount ~= nil then
                v156 = l_formatVoteNumber_0.hasEnoughRatings(v142.VoteCount);
            end;
        end;
        v150 = v156;
        v149 = l_ShowVotes_0 and l_isHovered_0 and v150;
        v148 = l_ShowVotes_0 and v142 ~= nil and v142.showVoteButtons;
        v155 = l_ShowVotes_0 and l_isHovered_0 and v142 ~= nil and v142.VoteLoading;
        v147 = if v148 then v9.ASSET_OUTLINE_EXTRA_HEIGHT_WITH_VOTE_BUTTONS_HOVERED else if v149 or v155 then v9.ASSET_OUTLINE_EXTRA_HEIGHT_WITH_VOTING_COUNT else v9.ASSET_OUTLINE_EXTRA_HEIGHT;
        v153 = v9.ASSET_NAME_FONT_SIZE;
        v154 = v9.FONT;
        if l_GetTextSize_0(l_Name_0, v153, v154).X <= v9.ASSET_WIDTH_NO_PADDING or v148 then
            v151 = true;
            v147 = v147 - v9.ASSET_NAME_ONE_LINE_HEIGHT;
        end;
        if v145 and not l_hideCreatorName_0 then
            v147 = v147 + v9.ASSET_CREATOR_NAME_HEIGHT;
        end;
        if l_HasScripts_0 or v130 then
            v147 = v147 + v9.PRICE_HEIGHT;
        end;
        if v148 and l_isHovered_0 and (l_HasScripts_0 or v130) then
            v147 = v147 + v9.ASSET_VOTE_BUTTONS_SCRIPT_PADDING;
        end;
        if v134 or v131 then
            v147 = v147 + v9.ASSET_INNER_PADDING;
        end;
        local l_outline_0 = l_Stylizer_0.asset.outline;
        local v158 = l_isHovered_0 and v147 + 2 * v9.ASSET_OUTLINE_PADDING or 0;
        local l_ASSET_INNER_PADDING_0 = v9.ASSET_INNER_PADDING;
        if v131 then
            l_ASSET_INNER_PADDING_0 = 0;
        end;
        local l_packages_0 = l_Stylizer_0.asset.packages;
        local v161 = "";
        if v131 then
            v161 = l_Asset_3.Duration ~= nil and v12(l_Asset_3.Duration, 1) or "";
        end;
        local l_dropShadowSize_0 = l_Stylizer_0.asset.dropShadowSize;
        local l_transparency_0 = l_outline_0.transparency;
        local function v164() --[[ Line: 441 ]]
            -- upvalues: v111 (copy), l_Localization_0 (copy)
            v111.tryCreateContextMenu(l_Localization_0);
        end;
        local l_backgroundColor_0 = l_outline_0.backgroundColor;
        return (v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v14.getAssetSize(l_categoryName_1), 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            ZIndex = l_isHovered_0 and 2 or 1, 
            [v7.Change.AbsolutePosition] = v111.onAbsolutePositionChange, 
            [v7.Ref] = v111.ref
        }, {
            DropShadow = l_isHovered_0 and v7.createElement(v20, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -(v9.ASSET_OUTLINE_PADDING + l_dropShadowSize_0)), 
                Size = UDim2.new(1, 2 * (v9.ASSET_OUTLINE_PADDING + l_dropShadowSize_0), 1, v147 + 2 * l_dropShadowSize_0), 
                ZIndex = -2
            }), 
            Outline = v7.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = if not not l_isHovered_0 or l_props_2.hasTutorialLimits then l_transparency_0 else 1, 
                BackgroundColor3 = l_backgroundColor_0, 
                BorderColor3 = l_outline_0.borderColor, 
                BorderSizePixel = 1, 
                Position = UDim2.new(0.5, 0, 0, -v9.ASSET_OUTLINE_PADDING), 
                Size = UDim2.new(1, 2 * v9.ASSET_OUTLINE_PADDING, 1, v147), 
                ZIndex = -1, 
                [v7.Event.MouseLeave] = v111.onMouseLeave, 
                [v7.Event.InputEnded] = v111.onInputEnded
            }, {
                TutorialStroke = if l_props_2.hasTutorialLimits then v7.createElement("UIStroke", {
                    Thickness = l_Stylizer_0.asset.strokeThickness, 
                    Color = l_Stylizer_0.asset.strokeColor
                }) else nil
            }), 
            InnerFrame = v7.createElement(v19, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, v158), 
                [v7.Event.MouseEnter] = v111.onMouseEntered, 
                [v7.Event.MouseButton2Click] = v164, 
                onMouseMoved = v111.onMouseMoved, 
                onDragStart = v111.onDragStart, 
                onClick = v111.onClick
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    Padding = UDim.new(0, l_ASSET_INNER_PADDING_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                AssetIcon = v7.createElement(v22, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    LayoutOrder = 0, 
                    assetId = l_assetId_1, 
                    assetName = l_Name_0, 
                    assetTileLocation = l_props_2.assetTileLocation, 
                    currentSoundId = l_props_2.currentSoundId, 
                    isEndorsed = l_IsEndorsed_0, 
                    isLoading = l_props_2.isLoading, 
                    typeId = l_TypeId_0, 
                    originalAssetId = l_props_2.originalAssetId, 
                    voting = v142, 
                    isHovered = l_isHovered_0, 
                    isPackage = v130, 
                    status = v145 and l_Status_0 or nil, 
                    onAssetPreviewButtonClicked = v111.onAssetPreviewButtonClicked
                }), 
                AssetName = v7.createElement(v23, {
                    Size = UDim2.new(1, 0, 0.45, 0), 
                    LayoutOrder = 10, 
                    NumberRows = v151 and 1 or nil, 
                    assetId = l_assetId_1, 
                    assetName = l_Name_0, 
                    TextSize = v153, 
                    Font = v154
                }), 
                Price = v134 and v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 20, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    RobuxIcon = v136 and not v137 and not l_ownsAsset_1 and v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.ROBUX_SMALL, 
                        Size = v9.Dialog.ROBUX_SIZE, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Stylizer_0.asset.textColor
                    }), 
                    PriceText = not l_ownsAsset_1 and v7.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Font = v9.FONT, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        TextSize = v9.PRICE_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v135, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }), 
                    OwnedIcon = l_ownsAsset_1 and v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.OWNED_ICON, 
                        Size = v9.Dialog.ROBUX_SIZE, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Stylizer_0.asset.textColor
                    })
                }), 
                CreatorName = l_isHovered_0 and not l_hideCreatorName_0 and v7.createElement(v21, {
                    Size = UDim2.new(1, 0, 0.15, 0), 
                    LayoutOrder = 30, 
                    assetId = l_assetId_1, 
                    creator = if v2() then l_Creator_0 else nil, 
                    creatorName = l_Name_1, 
                    clickable = not v144, 
                    isVerifiedCreator = l_IsVerifiedCreator_0, 
                    onClick = if v2() then l_props_2.onSearchByCreator else nil
                }), 
                Voting = if not not v149 or v148 or v155 then v7.createElement(v24, {
                    LayoutOrder = v148 and 25 or 35, 
                    assetId = l_assetId_1, 
                    voting = v142, 
                    showBackgroundBox = l_isHovered_0
                }) else if v149 or v148 then v7.createElement(v24, {
                    LayoutOrder = v148 and 25 or 35, 
                    assetId = l_assetId_1, 
                    voting = v142, 
                    showBackgroundBox = l_isHovered_0
                }) else nil, 
                AudioLength = l_isHovered_0 and v131 and v7.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v9.AUDIO_LENGTH_HEIGHT), 
                    LayoutOrder = 40, 
                    Text = v161, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = v9.FONT, 
                    TextSize = v9.FONT_SIZE_SMALL, 
                    TextColor3 = l_Stylizer_0.asset.textColor
                }), 
                HasScripts = if not (l_isHovered_0 and l_HasScripts_0) or v130 then nil else v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 50, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    ScriptIcon = v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.SCRIPT, 
                        Size = v9.Dialog.SCRIPT_SIZE, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v7.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        Font = v9.FONT, 
                        TextSize = v9.STATUS_NAME_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = l_Localization_0:getText("General", "HasScripts"), 
                        TextTruncate = Enum.TextTruncate.None
                    })
                }), 
                Package = if l_isHovered_0 and v130 then v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 50, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PackageIcon = v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = l_packages_0.packageImage, 
                        Size = v9.PACKAGE_DETAIL_SIZE, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v7.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        Font = v9.FONT, 
                        TextSize = v9.STATUS_NAME_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = l_Localization_0:getText("General", "PackagesUpdateable"), 
                        TextTruncate = Enum.TextTruncate.None
                    })
                }) else nil, 
                Status = l_isHovered_0 and v145 and v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 60, 
                    Size = UDim2.new(1, 0, 0, v9.STATUS_NAME_HEIGHT), 
                    Text = v16(l_Localization_0)[l_Status_0], 
                    TextColor3 = l_Stylizer_0.asset.textColor, 
                    Font = v9.FONT, 
                    TextSize = v9.STATUS_NAME_FONT_SIZE, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    ClipsDescendants = false, 
                    TextTruncate = Enum.TextTruncate.None
                })
            })
        }));
    end;
end;
v45 = l_withContext_0({
    AssetAnalytics = v13, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    NavigationContext = v32, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v36
})(v45);
return v8.connect(function(v166, v167) --[[ Line: 737 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v43 (copy)
    v166 = v166 or {};
    local v168 = v166.assets or {};
    local v169 = v166.voting or {};
    local v170 = v166.sound or {};
    local v171 = v168.idToAssetMap or {};
    local l_assetId_2 = v167.assetId;
    local v173 = v166.pageInfo or {};
    local v174 = v173.categoryName or v43.DEFAULT.name;
    local v175 = v173.searchTerm or "";
    local v176 = v166.purchase.cachedOwnedAssets[tostring(l_assetId_2)];
    local _ = (v168.manageableAssets or {})[tostring(l_assetId_2)];
    local _ = nil;
    return {
        assetData = if not v167.assetData then v167.assetData else v171[l_assetId_2], 
        categoryName = v174, 
        currentSoundId = v170.currentSoundId or 0, 
        currentUserPackagePermissions = v166.packages.permissionsTable or {} or nil, 
        searchTerm = v175, 
        ownsAsset = v176, 
        isLoading = v170.currentSoundId == l_assetId_2 and (v170.isLoading or false), 
        voting = v169[l_assetId_2] or {}, 
        hasTutorialLimits = v166.tutorialLimits.assetIds ~= nil
    };
end, function(v179) --[[ Line: 779 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v31 (copy), v26 (copy), v25 (copy)
    return {
        getAssetMediaIds = function(v180, v181) --[[ Line: 781 ]] --[[ Name: getAssetMediaIds ]]
            -- upvalues: v179 (copy), v28 (ref)
            v179(v28(v180, v181));
        end, 
        getOwnsAsset = function(v182, v183) --[[ Line: 785 ]] --[[ Name: getOwnsAsset ]]
            -- upvalues: v179 (copy), v29 (ref)
            v179(v29(v182, v183));
        end, 
        getCanManageAsset = function(v184, v185) --[[ Line: 789 ]] --[[ Name: getCanManageAsset ]]
            -- upvalues: v179 (copy), v30 (ref)
            v179(v30(v184, v185));
        end, 
        getVote = function(v186, v187, v188) --[[ Line: 793 ]] --[[ Name: getVote ]]
            -- upvalues: v179 (copy), v31 (ref)
            v179(v31(v186, v187, v188, true));
        end, 
        tryCreateContextMenu = function(v189, v190, v191, v192, v193) --[[ Line: 797 ]] --[[ Name: tryCreateContextMenu ]]
            -- upvalues: v179 (copy), v26 (ref)
            v179(v26(v189, v190, v191, v192, v193));
        end, 
        getPageInfoAnalyticsContextInfo = function() --[[ Line: 803 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
            -- upvalues: v179 (copy), v25 (ref)
            return v179(v25());
        end
    };
end)(v45);