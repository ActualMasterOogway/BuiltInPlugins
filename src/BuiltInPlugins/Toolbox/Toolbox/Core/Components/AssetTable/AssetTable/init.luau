local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local _ = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Types.AnalyticsTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v14 = require(l_script_FirstAncestor_0.Core.Types.Category);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local l_UI_0 = v4.UI;
local _ = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v23 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRow);
local l_List_0 = l_UI_0.List;
local v25 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v26 = v2.PureComponent:extend("AssetTable");
if not require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows)() then
    return v26;
else
    local v27 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
    v26.init = function(v28) --[[ Line: 85 ]] --[[ Name: init ]]
        -- upvalues: v2 (copy), v14 (copy), v11 (copy), v25 (copy), l_TextLabel_0 (copy), v9 (copy), v27 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy)
        v28.state = {
            expandedAssetId = nil
        };
        v28.setExpandedAssetId = function(v29) --[[ Line: 90 ]]
            -- upvalues: v28 (copy), v2 (ref), v14 (ref), v11 (ref)
            v28:setState(function(v30) --[[ Line: 91 ]]
                -- upvalues: v29 (copy), v2 (ref)
                return {
                    expandedAssetId = if v29 == v30.expandedAssetId then v2.None else v29
                };
            end);
            local l_props_0 = v28.props;
            local l_Assets_0 = l_props_0.Assets;
            local v33 = v14.getCategoryByName(l_props_0.categoryName);
            local v34 = {
                assetType = if v33 then v33.assetType else nil, 
                searchId = l_props_0.searchId
            };
            local v35 = 1;
            for v36, v37 in l_Assets_0 do
                if v37.Asset and v37.Asset.Id == v29 then
                    v35 = v36;
                    break;
                end;
            end;
            local v38 = math.floor((v35 - 1) / 20);
            local v39 = (v35 - 1) % 20;
            v11.MarketplaceAssetRowExpanded(v29, v38, v39, v34);
        end;
        v28.createHeaderElement = function(v40, v41, v42, v43) --[[ Line: 117 ]]
            -- upvalues: v28 (copy), v25 (ref), v2 (ref), l_TextLabel_0 (ref), v9 (ref)
            local l_props_1 = v28.props;
            local v45 = v25(v43);
            local l_itemRow_0 = l_props_1.Stylizer.itemRow;
            local v47 = v45[v41];
            if v47 then
                local l_createElement_0 = v2.createElement;
                local l_l_TextLabel_0_0 = l_TextLabel_0;
                local v50 = {
                    Font = v9.FONT, 
                    LayoutOrder = v42, 
                    Size = v47, 
                    Text = v40, 
                    TextColor = l_itemRow_0.headerTextColor, 
                    TextSize = v9.FONT_SIZE_SMALL, 
                    TextXAlignment = Enum.TextXAlignment.Left
                };
                local v51 = {};
                local v52 = false;
                if v42 ~= 1 then
                    v52 = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v9.ITEM_ROW.LEFT_RIGHT_PADDING)
                    });
                end;
                v51.UIPadding = v52;
                return (l_createElement_0(l_l_TextLabel_0_0, v50, v51));
            else
                return nil;
            end;
        end;
        v28.getAssetElementProps = function(v53, v54, v55, v56) --[[ Line: 140 ]]
            -- upvalues: v28 (copy), v27 (ref)
            local l_props_2 = v28.props;
            local l_state_0 = v28.state;
            local l_LogImpression_0 = l_props_2.LogImpression;
            local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
            local l_expandedAssetId_0 = l_state_0.expandedAssetId;
            local function v63(v62) --[[ Line: 149 ]]
                -- upvalues: l_props_2 (copy), v53 (copy)
                if l_props_2.TryInsert then
                    l_props_2.TryInsert(v53, v62 or false);
                end;
            end;
            local v64 = if v53.Asset then v53.Asset.Id == l_expandedAssetId_0 else false;
            return {
                AssetInfo = v53, 
                CanInsertAsset = l_CanInsertAsset_0, 
                InsertAsset = v63, 
                IsExpanded = v64, 
                Key = if v53 and v53.Asset then v53.Asset.Id else v54, 
                LayoutOrder = v54, 
                LogImpression = l_LogImpression_0, 
                OnExpanded = v28.setExpandedAssetId, 
                OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                OnSearchByCreator = if v27() then l_props_2.OnSearchByCreator else nil, 
                ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                Position = v55, 
                Size = v56, 
                TryOpenAssetConfig = l_props_2.TryOpenAssetConfig, 
                ZIndex = v64 and 2 or nil
            };
        end;
        v28.renderHeader = function(_, _, v67, v68) --[[ Line: 175 ]]
            -- upvalues: v28 (copy), l_LayoutOrderIterator_0 (ref), v2 (ref), l_Pane_0 (ref), v9 (ref)
            local l_props_3 = v28.props;
            local l_Localization_0 = l_props_3.Localization;
            local v71 = if l_props_3.AbsoluteSize then l_props_3.AbsoluteSize.X else 0;
            local v72 = l_LayoutOrderIterator_0.new();
            local function _(v73, v74, v75) --[[ Line: 185 ]]
                -- upvalues: v28 (ref), v71 (copy)
                return v28.createHeaderElement(v73, v74, v75, v71);
            end;
            local l_createElement_1 = v2.createElement;
            local l_l_Pane_0_0 = l_Pane_0;
            local v79 = {
                LayoutOrder = 1, 
                Size = v68, 
                Layout = Enum.FillDirection.Horizontal, 
                Padding = {
                    Right = v9.ITEM_ROW.BORDER_SIZE, 
                    Left = v9.ITEM_ROW.BORDER_SIZE, 
                    Top = v9.ITEM_ROW.BORDER_SIZE, 
                    Bottom = v9.ITEM_ROW.BORDER_SIZE
                }, 
                Position = v67
            };
            local v80 = {};
            local l_ICON_0 = v9.ASSET_ROW_COLUMNS.ICON;
            local v82 = v72:getNextOrder();
            v80.Type = v28.createHeaderElement("", l_ICON_0, v82, v71);
            l_ICON_0 = l_Localization_0:getText("AssetTable", "Name"):upper();
            v82 = v9.ASSET_ROW_COLUMNS.NAME;
            local v83 = v72:getNextOrder();
            v80.Name = v28.createHeaderElement(l_ICON_0, v82, v83, v71);
            l_ICON_0 = l_Localization_0:getText("AssetTable", "Creator"):upper();
            v82 = v9.ASSET_ROW_COLUMNS.CREATOR;
            v83 = v72:getNextOrder();
            v80.Creator = v28.createHeaderElement(l_ICON_0, v82, v83, v71);
            l_ICON_0 = l_Localization_0:getText("AssetTable", "DateUpdated"):upper();
            v82 = v9.ASSET_ROW_COLUMNS.DATE_UPDATED;
            v83 = v72:getNextOrder();
            v80.DateUpdated = v28.createHeaderElement(l_ICON_0, v82, v83, v71);
            l_ICON_0 = l_Localization_0:getText("AssetTable", "DateCreated"):upper();
            v82 = v9.ASSET_ROW_COLUMNS.DATE_CREATED;
            v83 = v72:getNextOrder();
            v80.DateCreated = v28.createHeaderElement(l_ICON_0, v82, v83, v71);
            return l_createElement_1(l_l_Pane_0_0, v79, v80);
        end;
    end;
    v26.render = function(v84) --[[ Line: 226 ]] --[[ Name: render ]]
        -- upvalues: v2 (copy), v23 (copy), l_Pane_0 (copy), v5 (copy), l_List_0 (copy), v9 (copy)
        local l_props_4 = v84.props;
        local l_state_1 = v84.state;
        local l_Assets_1 = l_props_4.Assets;
        local l_LayoutOrder_0 = l_props_4.LayoutOrder;
        local v89 = if l_props_4.AbsoluteSize then l_props_4.AbsoluteSize.X else 0;
        local v90 = {
            HEADER = {
                AbsoluteSize = Vector2.new(v89, 20), 
                OnRender = v84.renderHeader
            }
        };
        if l_state_1.expandedAssetId then
            v90[l_state_1.expandedAssetId] = {
                AbsoluteSize = Vector2.new(v89, 90), 
                OnRender = function(v91, v92, v93, v94) --[[ Line: 244 ]] --[[ Name: OnRender ]]
                    -- upvalues: v2 (ref), v23 (ref), v84 (copy)
                    return v2.createElement(v23, v84.getAssetElementProps(v91, v92, v93, v94));
                end
            };
        end;
        local l_Position_0 = l_props_4.Position;
        return v2.createElement(l_Pane_0, v5.join({
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            Size = l_props_4.Size, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, l_props_4.WrapperProps), {
            List = v2.createElement(l_List_0, {
                GetRowProps = v84.getAssetElementProps, 
                Rows = l_Assets_1, 
                RowComponent = v23, 
                RowHeight = v9.AUDIO_ROW.ROW_HEIGHT, 
                Size = UDim2.fromScale(1, 1), 
                OnScrollUpdate = function(v96, v97) --[[ Line: 272 ]] --[[ Name: OnScrollUpdate ]]
                    -- upvalues: l_props_4 (copy)
                    if v97 and v97.Y > 0 and v96.Y + l_props_4.AbsoluteSize.Y >= v97.Y then
                        l_props_4.FetchNextPage(20);
                    end;
                end, 
                LayoutOrder = l_LayoutOrder_0, 
                SpecialRows = v90
            })
        });
    end;
    v26 = l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Stylizer = l_ContextServices_0.Stylizer
    })(v26);
    v26 = v3.connect(function(v98, _) --[[ Line: 289 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: v14 (copy)
        local v100 = (v98 or {}).pageInfo or {};
        return {
            categoryName = v100.categoryName or v14.DEFAULT.name, 
            searchId = v100.searchId
        };
    end, nil)(v26);
    TypedComponent = function(v101, v102) --[[ Line: 301 ]] --[[ Name: TypedComponent ]]
        -- upvalues: v2 (copy), v26 (ref)
        return v2.createElement(v26, v101, v102);
    end;
    return l_withAbsoluteSize_0(TypedComponent);
end;