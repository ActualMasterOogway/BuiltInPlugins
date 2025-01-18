local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_withAbsoluteSizeAndPosition_0 = v4.Wrappers.withAbsoluteSizeAndPosition;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.LayoutOrderIterator);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_script_FirstAncestor_0.Core.Components.DraggableButton);
local v14 = require(l_script_FirstAncestor_0.Core.Thunks.TryCreateContextMenu);
local v15 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v16 = require(l_script_FirstAncestor_0.Core.Networking.Requests.GetCanManageAssetRequest);
local v17 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v19 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_LinkText_0 = v4.UI.LinkText;
local l_Pane_0 = v4.UI.Pane;
local l_TextLabel_0 = v4.UI.TextLabel;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v24 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v25 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v26 = v2.PureComponent:extend("ItemRow");
v26.defaultProps = {
    TextTruncate = Enum.TextTruncate.AtEnd
};
v26.init = function(v27) --[[ Line: 108 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v8 (copy), v2 (copy), l_Pane_0 (copy), l_LinkText_0 (copy), l_TextLabel_0 (copy)
    v27.wasAssetBoundsWithinScrollingBounds = false;
    v27.state = {
        isHovered = false, 
        isExpanded = true
    };
    v27.updateHoverState = function(v28) --[[ Line: 116 ]]
        -- upvalues: v27 (copy)
        v27:setState(function(_) --[[ Line: 117 ]]
            -- upvalues: v27 (ref), v28 (copy)
            local l_props_0 = v27.props;
            if l_props_0.OnHoverChanged then
                l_props_0.OnHoverChanged(v28);
            end;
            return {
                isHovered = v28
            };
        end);
    end;
    v27.onMouseEnter = function() --[[ Line: 128 ]]
        -- upvalues: v27 (copy)
        v27.updateHoverState(true);
    end;
    v27.onMouseLeave = function() --[[ Line: 132 ]]
        -- upvalues: v27 (copy)
        v27.updateHoverState(false);
    end;
    v27.toggleIsExpanded = function() --[[ Line: 136 ]]
        -- upvalues: v27 (copy)
        local l_props_1 = v27.props;
        if l_props_1.OnExpanded then
            local l_Id_0 = v27.props.AssetInfo.Asset.Id;
            l_props_1.OnExpanded(l_Id_0);
        end;
    end;
    v27.onDragStart = function() --[[ Line: 144 ]]
        -- upvalues: v27 (copy)
        local l_props_2 = v27.props;
        if l_props_2.CanInsertAsset() then
            l_props_2.InsertAsset(true);
        end;
    end;
    v27.onNameClicked = function() --[[ Line: 151 ]]
        -- upvalues: v27 (copy)
        local l_props_3 = v27.props;
        if l_props_3.InsertAsset then
            l_props_3.InsertAsset(false);
        end;
    end;
    v27.tryCreateLocalizedContextMenu = function() --[[ Line: 158 ]]
        -- upvalues: v27 (copy)
        local l_props_4 = v27.props;
        local l_AssetInfo_0 = l_props_4.AssetInfo;
        local v37 = l_props_4.Plugin:get();
        local l_TryOpenAssetConfig_0 = l_props_4.TryOpenAssetConfig;
        local v39 = v27.props.getPageInfoAnalyticsContextInfo();
        l_props_4.tryCreateContextMenu(l_AssetInfo_0, l_props_4.Localization, v37, l_TryOpenAssetConfig_0, v39);
    end;
    v27.logImpression = function() --[[ Line: 170 ]]
        -- upvalues: v27 (copy)
        local l_props_5 = v27.props;
        local l_AssetInfo_1 = l_props_5.AssetInfo;
        if l_props_5.LogImpression then
            v27.wasAssetBoundsWithinScrollingBounds = l_props_5.LogImpression(l_AssetInfo_1, l_props_5.AbsoluteSize, l_props_5.AbsolutePosition, v27.wasAssetBoundsWithinScrollingBounds);
        end;
    end;
    v27.renderColumns = function(v42) --[[ Line: 184 ]]
        -- upvalues: v27 (copy), v24 (ref), v8 (ref), v2 (ref), l_Pane_0 (ref), l_LinkText_0 (ref), l_TextLabel_0 (ref)
        local l_props_6 = v27.props;
        local l_Columns_0 = l_props_6.Columns;
        local v45 = {};
        for _, v47 in l_Columns_0 do
            if not v47.Hidden then
                local v48 = v47.OnClick ~= nil;
                local v49 = if v24() then v8.ITEM_ROW.LEFT_RIGHT_PADDING else v8.AUDIO_ROW.LEFT_RIGHT_PADDING;
                v45[v47.DevLabel] = v2.createElement(l_Pane_0, {
                    LayoutOrder = v42:getNextOrder(), 
                    Padding = {
                        Bottom = if v47.Padding and v47.Padding.Bottom then v47.Padding.Bottom else nil, 
                        Left = if v47.Padding and v47.Padding.Left then v49 + v47.Padding.Left else v49, 
                        Right = if v47.Padding and v47.Padding.Right then v47.Padding.Right else nil, 
                        Top = if v47.Padding and v47.Padding.Top then v47.Padding.Top else nil
                    }, 
                    Size = v47.Size
                }, {
                    Text = if v48 then v2.createElement(l_LinkText_0, {
                        LayoutOrder = v42:getNextOrder(), 
                        OnClick = v47.OnClick, 
                        Size = UDim2.fromScale(1, 1), 
                        Text = v47.Text, 
                        TextTruncate = if v47.TextTruncate then v47.TextTruncate else l_props_6.TextTruncate, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Style = "ToolboxItemRowLink"
                    }) else v2.createElement(l_TextLabel_0, {
                        LayoutOrder = v42:getNextOrder(), 
                        Size = UDim2.fromScale(1, 1), 
                        Text = v47.Text, 
                        Style = "ToolboxItemRowText", 
                        TextTruncate = if v47.TextTruncate then v47.TextTruncate else l_props_6.TextTruncate, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                });
            end;
        end;
        return v45;
    end;
end;
v26.didMount = function(v50) --[[ Line: 238 ]] --[[ Name: didMount ]]
    local l_props_7 = v50.props;
    local l_AssetInfo_2 = l_props_7.AssetInfo;
    local l_LogImpression_0 = l_props_7.LogImpression;
    if l_AssetInfo_2.Asset then
        l_props_7.getCanManageAsset(l_props_7.Network.networkInterface, l_AssetInfo_2.Asset.Id);
    end;
    if l_AssetInfo_2 and l_LogImpression_0 then
        v50.logImpression();
        return;
    else
        if l_AssetInfo_2 then
            local v54 = l_props_7.getPageInfoAnalyticsContextInfo();
            l_props_7.AssetAnalytics:get():logImpression(l_AssetInfo_2, v54);
        end;
        return;
    end;
end;
v26.didUpdate = function(v55, v56, _) --[[ Line: 258 ]] --[[ Name: didUpdate ]]
    local l_props_8 = v55.props;
    if v56.AbsolutePosition ~= l_props_8.AbsolutePosition or v56.AbsoluteSize ~= l_props_8.AbsoluteSize or v56.ParentAbsoluteSize ~= l_props_8.ParentAbsoluteSize then
        v55.logImpression();
    end;
end;
v26.render = function(v59) --[[ Line: 270 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v5 (copy), v25 (copy), v8 (copy), v24 (copy), v2 (copy), l_Pane_0 (copy), v13 (copy), l_LinkText_0 (copy)
    local l_props_9 = v59.props;
    local l_state_0 = v59.state;
    local l_Asset_0 = l_props_9.AssetInfo.Asset;
    local l_ExpandedHeight_0 = l_props_9.ExpandedHeight;
    local l_itemRow_0 = l_props_9.Stylizer.itemRow;
    local l_LayoutOrder_0 = l_props_9.LayoutOrder;
    local v66 = if l_Asset_0 then l_Asset_0.Name else "";
    local l_IsExpanded_0 = l_props_9.IsExpanded;
    local l_isHovered_0 = l_state_0.isHovered;
    local v69 = v9.new();
    local v70 = if l_LayoutOrder_0 and l_LayoutOrder_0 % 2 == 0 then l_itemRow_0.backgroundColorEven else l_itemRow_0.backgroundColorOdd;
    local v71 = v5.join({
        AutomaticSize = l_props_9.AutomaticSize, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = if v25() then l_props_9.Position else nil, 
        Size = UDim2.new(1, 0, 0, if l_IsExpanded_0 then l_ExpandedHeight_0 else v8.AUDIO_ROW.ROW_HEIGHT)
    }, l_props_9.WrapperProps);
    local v72 = if v24() then v8.ITEM_ROW.LEFT_RIGHT_PADDING else v8.AUDIO_ROW.LEFT_RIGHT_PADDING;
    local v73 = if v24() then v8.ITEM_ROW.TOP_BUTTON_PADDING else v8.AUDIO_ROW.TOP_BUTTON_PADDING;
    local v74 = if v24() then v8.ITEM_ROW.BORDER_SIZE else v8.AUDIO_ROW.BORDER_SIZE;
    return v2.createElement(l_Pane_0, v71, {
        Button = v2.createElement(v13, {
            BackgroundColor3 = v70, 
            Size = UDim2.new(1, -v74 * 2, 1, -v74 * 2), 
            Position = UDim2.new(0, v74, 0, v74), 
            ZIndex = 1, 
            [v2.Event.MouseEnter] = v59.onMouseEnter, 
            [v2.Event.MouseLeave] = v59.onMouseLeave, 
            [v2.Event.MouseButton1Click] = v59.toggleIsExpanded, 
            [v2.Event.MouseButton2Click] = v59.tryCreateLocalizedContextMenu, 
            onDragStart = v59.onDragStart
        }, {
            UIStroke = if not not l_IsExpanded_0 or l_isHovered_0 then v2.createElement("UIStroke", {
                Thickness = v74, 
                Color = l_itemRow_0.borderColor
            }) else nil, 
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v72 - v74), 
                PaddingLeft = UDim.new(0, v72 - v74), 
                PaddingTop = UDim.new(0, v73 - v74), 
                PaddingBottom = UDim.new(0, v73 - v74)
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Details = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v69:getNextOrder(), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v8.AUDIO_ROW.ICON_SIZE)
            }, v5.join({
                Icon = if l_props_9.RenderIcon then l_props_9.RenderIcon(l_isHovered_0) else nil, 
                Name = v2.createElement(l_Pane_0, {
                    Size = l_props_9.TitleSize, 
                    LayoutOrder = v69:getNextOrder()
                }, {
                    LinkText = v2.createElement(l_LinkText_0, {
                        OnClick = v59.onNameClicked, 
                        HoverAreaSize = if l_props_9.ForceLinkTextFullWidth then UDim2.new(1, 0, 0, 0) else nil, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Style = "ToolboxItemRowTitle", 
                        Text = v66, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            }, v59.renderColumns(v69))), 
            ExpandedContents = if l_IsExpanded_0 and l_props_9.RenderExpandedContent then v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v69:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Content = l_props_9.RenderExpandedContent()
            }) else nil
        })
    });
end;
v26 = l_withContext_0({
    AssetAnalytics = v17, 
    Localization = l_ContextServices_0.Localization, 
    Network = v19, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v18, 
    Stylizer = l_ContextServices_0.Stylizer
})(v26);
v26 = l_withAbsoluteSizeAndPosition_0((v3.connect(nil, function(v75) --[[ Line: 391 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v14 (copy), v15 (copy)
    return {
        getCanManageAsset = function(v76, v77) --[[ Line: 393 ]] --[[ Name: getCanManageAsset ]]
            -- upvalues: v75 (copy), v16 (ref)
            v75(v16(v76, v77));
        end, 
        tryCreateContextMenu = function(v78, v79, v80, v81, v82) --[[ Line: 396 ]] --[[ Name: tryCreateContextMenu ]]
            -- upvalues: v75 (copy), v14 (ref)
            v75(v14(v78, v79, v80, v81, v82));
        end, 
        getPageInfoAnalyticsContextInfo = function() --[[ Line: 401 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
            -- upvalues: v75 (copy), v15 (ref)
            return v75(v15());
        end
    };
end)(v26)));
TypedItemRow = function(v83, v84) --[[ Line: 411 ]] --[[ Name: TypedItemRow ]]
    -- upvalues: v2 (copy), v26 (ref)
    return v2.createElement(v26, v83, v84);
end;
return {
    Component = v26, 
    Generator = TypedItemRow
};