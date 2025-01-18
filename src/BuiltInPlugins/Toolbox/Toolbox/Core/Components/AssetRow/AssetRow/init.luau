local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_formatLocalDateTime_0 = v4.Util.formatLocalDateTime;
local v6 = require(l_Packages_0.Dash);
local l_HoverArea_0 = v4.UI.HoverArea;
local l_Pane_0 = v4.UI.Pane;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.Images);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v16 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v17 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v19 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRow);
local v20 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRowExpandedContent);
local v21 = require(l_Util_0.Urls);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v23 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v24 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v25 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local v26 = v2.PureComponent:extend("AssetRow");
if not v24() then
    return v26;
else
    v26.init = function(v27) --[[ Line: 89 ]] --[[ Name: init ]]
        -- upvalues: v25 (copy), v23 (copy), v11 (copy), l_formatLocalDateTime_0 (copy), v12 (copy), v21 (copy), v2 (copy), l_Pane_0 (copy), l_HoverArea_0 (copy), v20 (copy)
        v27.wasAssetBoundsWithinScrollingBounds = false;
        v27.state = {
            isHovered = false, 
            isIconHovered = false
        };
        v27.onIconMouseEnter = function() --[[ Line: 97 ]]
            -- upvalues: v27 (copy)
            v27:setState({
                isIconHovered = true
            });
        end;
        v27.onIconMouseLeave = function() --[[ Line: 101 ]]
            -- upvalues: v27 (copy)
            v27:setState({
                isIconHovered = false
            });
        end;
        v27.onClick = function() --[[ Line: 105 ]]
            -- upvalues: v27 (copy)
            local l_props_0 = v27.props;
            if l_props_0.CanInsertAsset() then
                l_props_0.InsertAsset(false);
            end;
        end;
        v27.onSearchByCreator = function() --[[ Line: 112 ]]
            -- upvalues: v27 (copy), v25 (ref)
            local l_props_1 = v27.props;
            if v25() then
                local l_Creator_0 = l_props_1.AssetInfo.Creator;
                if l_props_1.OnSearchByCreator then
                    l_props_1.OnSearchByCreator(l_Creator_0);
                    return;
                end;
            else
                local l_networkInterface_0 = v27.props.Network.networkInterface;
                local v32 = l_props_1.Settings:get("Plugin");
                local v33 = {
                    Creator = if l_props_1.AssetInfo.Creator then l_props_1.AssetInfo.Creator.Name else nil
                };
                v27.props.searchWithOptions(l_networkInterface_0, v32, v33);
            end;
        end;
        v27.onHoverChanged = function(v34) --[[ Line: 131 ]]
            -- upvalues: v27 (copy)
            v27:setState(function(_) --[[ Line: 132 ]]
                -- upvalues: v34 (copy)
                return {
                    isHovered = v34
                };
            end);
        end;
        v27.getColumns = function() --[[ Line: 139 ]]
            -- upvalues: v27 (copy), v23 (ref), v11 (ref), l_formatLocalDateTime_0 (ref)
            local l_props_2 = v27.props;
            local v37 = l_props_2.Localization:getLocale();
            local l_Asset_0 = l_props_2.AssetInfo.Asset;
            local v39 = if l_props_2.AssetInfo.Creator then l_props_2.AssetInfo.Creator.Name else "---";
            local v40 = if l_Asset_0.Created then l_Asset_0.Created else "---";
            local v41 = if l_Asset_0.Updated then l_Asset_0.Updated else "---";
            local v42 = if l_props_2.AbsoluteSize then l_props_2.AbsoluteSize.X else 0;
            local v43, _ = v23(v42);
            return {
                {
                    DevLabel = "Creator", 
                    OnClick = if v39 ~= "---" then v27.onSearchByCreator else nil, 
                    Size = v43[v11.ASSET_ROW_COLUMNS.CREATOR], 
                    Text = v39, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, 
                {
                    DevLabel = "DateUpdated", 
                    Size = v43[v11.ASSET_ROW_COLUMNS.DATE_UPDATED], 
                    Text = l_formatLocalDateTime_0(v41, "MMM D, YYYY", v37), 
                    TextTruncate = Enum.TextTruncate.None
                }, 
                {
                    DevLabel = "DateCreated", 
                    Hidden = v43[v11.ASSET_ROW_COLUMNS.DATE_CREATED] == nil, 
                    Size = v43[v11.ASSET_ROW_COLUMNS.DATE_CREATED], 
                    Text = l_formatLocalDateTime_0(v40, "MMM D, YYYY", v37), 
                    TextTruncate = Enum.TextTruncate.None
                }
            };
        end;
        v27.renderIcon = function() --[[ Line: 179 ]]
            -- upvalues: v27 (copy), v12 (ref), v21 (ref), v11 (ref), v2 (ref), l_Pane_0 (ref), l_HoverArea_0 (ref)
            local l_props_3 = v27.props;
            local l_state_0 = v27.state;
            local l_AssetInfo_0 = l_props_3.AssetInfo;
            local l_isIconHovered_0 = l_state_0.isIconHovered;
            local v49 = if l_state_0.isHovered then v12.MAGNIFIER_PH else v21.constructAssetThumbnailUrl(l_AssetInfo_0.Asset.Id, v11.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v11.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
            local v50 = {
                BackgroundTransparency = 1, 
                Image = v49, 
                Size = if l_isIconHovered_0 then UDim2.fromOffset(20, 20) else UDim2.fromOffset(v11.ASSET_ROW.ICON_SIZE, v11.ASSET_ROW.ICON_SIZE), 
                [v2.Event.MouseEnter] = v27.onIconMouseEnter, 
                [v2.Event.MouseLeave] = v27.onIconMouseLeave, 
                [v2.Event.Activated] = v27.onAssetPreviewButtonClicked
            };
            return v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(0, v11.ASSET_ROW.ICON_SIZE + (v11.ITEM_ROW.LEFT_RIGHT_PADDING + v11.ASSET_ROW.LEFT_MOST_PADDING), 1, 0)
            }, {
                IconButton = v2.createElement("ImageButton", v50, {
                    HoverArea = v2.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                })
            });
        end;
        v27.onAssetPreviewButtonClicked = function() --[[ Line: 226 ]]
            -- upvalues: v27 (copy)
            local l_props_4 = v27.props;
            local l_AssetInfo_1 = v27.props.AssetInfo;
            if l_props_4.OnExpanded and not l_props_4.IsExpanded then
                l_props_4.OnExpanded(l_AssetInfo_1.Asset.Id);
            end;
            v27.props.OnAssetPreviewButtonClicked(l_AssetInfo_1);
        end;
        v27.renderExpandedContent = function() --[[ Line: 235 ]]
            -- upvalues: v27 (copy), v2 (ref), v20 (ref)
            local l_props_5 = v27.props;
            return v2.createElement(v20, {
                AssetInfo = l_props_5.AssetInfo, 
                OnAssetPreviewButtonClicked = v27.onAssetPreviewButtonClicked, 
                OnInsertClicked = v27.onClick
            });
        end;
    end;
    v26.render = function(v54) --[[ Line: 246 ]] --[[ Name: render ]]
        -- upvalues: v23 (copy), v2 (copy), l_Pane_0 (copy), v6 (copy), v19 (copy), v11 (copy)
        local l_props_6 = v54.props;
        local v56 = if l_props_6.AbsoluteSize then l_props_6.AbsoluteSize.X else 0;
        local v57 = v23(v56);
        return v2.createElement(l_Pane_0, v6.join({
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = l_props_6.LayoutOrder, 
            Position = l_props_6.Position, 
            Size = UDim2.new(1, 0, 0, 0), 
            ZIndex = l_props_6.ZIndex
        }, l_props_6.WrapperProps), {
            ItemRow = v19.Generator({
                AutomaticSize = Enum.AutomaticSize.Y, 
                Columns = v54.getColumns(), 
                RenderExpandedContent = v54.renderExpandedContent, 
                RenderIcon = v54.renderIcon, 
                TitleSize = v57[v11.ASSET_ROW_COLUMNS.NAME], 
                AssetInfo = l_props_6.AssetInfo, 
                CanInsertAsset = l_props_6.CanInsertAsset, 
                InsertAsset = l_props_6.InsertAsset, 
                IsExpanded = l_props_6.IsExpanded, 
                LayoutOrder = l_props_6.LayoutOrder, 
                LogImpression = l_props_6.LogImpression, 
                OnExpanded = l_props_6.OnExpanded, 
                OnHoverChanged = v54.onHoverChanged, 
                ParentAbsoluteSize = l_props_6.ParentAbsoluteSize, 
                TryOpenAssetConfig = l_props_6.TryOpenAssetConfig
            })
        });
    end;
    v26 = l_withContext_0({
        Stylizer = l_ContextServices_0.Stylizer, 
        Localization = l_ContextServices_0.Localization, 
        Plugin = l_ContextServices_0.Plugin, 
        Settings = v17, 
        Network = v18
    })(v26);
    v26 = v3.connect(nil, function(v58) --[[ Line: 294 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v16 (copy)
        return {
            searchWithOptions = function(v59, v60, v61) --[[ Line: 296 ]] --[[ Name: searchWithOptions ]]
                -- upvalues: v58 (copy), v16 (ref)
                v58(v16(v59, v60, v61));
            end
        };
    end)(v26);
    TypedComponent = function(v62, v63) --[[ Line: 304 ]] --[[ Name: TypedComponent ]]
        -- upvalues: v2 (copy), v26 (ref)
        return v2.createElement(v26, v62, v63);
    end;
    return l_withAbsoluteSize_0(TypedComponent);
end;