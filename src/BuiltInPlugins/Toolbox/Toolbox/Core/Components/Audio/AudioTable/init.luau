local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Dash);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v6 = require(l_Util_0.LayoutOrderIterator);
local v7 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v16 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRow);
local v17 = require(l_script_FirstAncestor_0.Core.Components.Audio.GetAudioTableSizes);
local v18 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v19 = v2.PureComponent:extend("AudioTable");
v19.init = function(v20, v21) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v17 (copy), l_TextLabel_0 (copy), v7 (copy), v18 (copy)
    v20.ref = v2.createRef();
    v20.state = {
        width = 0
    };
    v20.setExpandedAssetId = function(v22) --[[ Line: 64 ]]
        -- upvalues: v20 (copy), v2 (ref)
        v20:setState(function(v23) --[[ Line: 65 ]]
            -- upvalues: v22 (copy), v2 (ref)
            return {
                expandedAssetId = if v22 == v23.expandedAssetId then v2.None else v22
            };
        end);
    end;
    v20.OnAbsoluteSizeChanged = function() --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        if v20.ref.current then
            v20:setState({
                width = v20.ref.current.AbsoluteSize.X
            });
        end;
    end;
    v20.createHeaderElement = function(v24, v25, v26, v27) --[[ Line: 77 ]]
        -- upvalues: v20 (copy), v17 (ref), v21 (copy), v2 (ref), l_TextLabel_0 (ref), v7 (ref), v18 (ref)
        local l_width_0 = v20.state.width;
        local v29 = v17(v20.props.AudioType, l_width_0);
        local l_itemRow_0 = v21.Stylizer.itemRow;
        local v31 = v29[v25];
        if v31 then
            local l_createElement_0 = v2.createElement;
            local l_l_TextLabel_0_0 = l_TextLabel_0;
            local v34 = {
                Font = v7.FONT, 
                LayoutOrder = v26, 
                Size = v31, 
                Text = v24, 
                TextColor = l_itemRow_0.headerTextColor, 
                TextSize = v7.FONT_SIZE_SMALL, 
                TextXAlignment = v27 or Enum.TextXAlignment.Left
            };
            local v35 = {};
            local v36 = false;
            if v26 ~= 1 then
                v36 = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, if v18() then v7.ITEM_ROW.LEFT_RIGHT_PADDING else v7.AUDIO_ROW.LEFT_RIGHT_PADDING)
                });
            end;
            v35.UIPadding = v36;
            return (l_createElement_0(l_l_TextLabel_0_0, v34, v35));
        else
            return nil;
        end;
    end;
end;
v19.didMount = function(v37) --[[ Line: 111 ]] --[[ Name: didMount ]]
    v37.OnAbsoluteSizeChanged();
end;
v19.render = function(v38) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), v16 (copy), v2 (copy), l_Pane_0 (copy), v18 (copy), v7 (copy)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Localization_0 = l_props_0.Localization;
    local l_Assets_0 = l_props_0.Assets;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LogImpression_0 = l_props_0.LogImpression;
    local l_CanInsertAsset_0 = l_props_0.CanInsertAsset;
    local l_expandedAssetId_0 = l_state_0.expandedAssetId;
    local l_width_1 = l_state_0.width;
    local v48 = v6.new();
    local v53 = v4.map(l_Assets_0, function(v49) --[[ Line: 129 ]]
        -- upvalues: l_props_0 (copy), v38 (copy), v16 (ref), l_CanInsertAsset_0 (copy), l_expandedAssetId_0 (copy), v48 (copy), l_LogImpression_0 (copy), l_width_1 (copy)
        local function v51(v50) --[[ Line: 130 ]]
            -- upvalues: l_props_0 (ref), v49 (copy), v38 (ref)
            l_props_0.TryInsert(v49, v50 or false, nil, v38.props.SwimlaneName);
        end;
        local l_Asset_0 = v49.Asset;
        if l_Asset_0 then
            return v16.Generator({
                key = l_Asset_0.Id, 
                AssetInfo = v49, 
                CanInsertAsset = l_CanInsertAsset_0, 
                InsertAsset = v51, 
                IsExpanded = l_Asset_0.Id == l_expandedAssetId_0, 
                LayoutOrder = v48:getNextOrder() + 1, 
                LogImpression = l_LogImpression_0, 
                OnExpanded = v38.setExpandedAssetId, 
                OnAssetPreviewButtonClicked = l_props_0.OnAssetPreviewButtonClicked, 
                ParentAbsoluteSize = l_props_0.ParentAbsoluteSize, 
                TryOpenAssetConfig = l_props_0.TryOpenAssetConfig, 
                width = l_width_1
            });
        else
            return nil;
        end;
    end);
    local v54 = v6.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        Layout = Enum.FillDirection.Vertical, 
        [v2.Ref] = v38.ref, 
        [v2.Change.AbsoluteSize] = v38.OnAbsoluteSizeChanged
    }, {
        HeaderRow = v2.createElement(l_Pane_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = if v18() then v7.ITEM_ROW.BORDER_SIZE else {
                Right = v7.AUDIO_ROW.BORDER_SIZE, 
                Left = v7.AUDIO_ROW.BORDER_SIZE, 
                Top = v7.AUDIO_ROW.BORDER_SIZE, 
                Bottom = v7.AUDIO_ROW.BORDER_SIZE
            }
        }, {
            Icon = v38.createHeaderElement("", v7.AUDIO_ROW.COLUMNS.ICON, v54:getNextOrder()), 
            Title = v38.createHeaderElement(l_Localization_0:getText("AudioView", "Title"):upper(), v7.AUDIO_ROW.COLUMNS.TITLE, v54:getNextOrder()), 
            Creator = v38.createHeaderElement(l_Localization_0:getText("AudioView", "Creator"):upper(), v7.AUDIO_ROW.COLUMNS.CREATOR, v54:getNextOrder()), 
            Tags = v38.createHeaderElement(l_Localization_0:getText("AudioView", "Tags"):upper(), v7.AUDIO_ROW.COLUMNS.TAGS, v54:getNextOrder()), 
            Length = v38.createHeaderElement(l_Localization_0:getText("AudioView", "Length"):upper(), v7.AUDIO_ROW.COLUMNS.LENGTH, v54:getNextOrder(), Enum.TextXAlignment.Right)
        }), 
        RowsWrapper = v2.createFragment(v53)
    });
end;
v19 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v19);
TypedAudioTable = function(v55, v56) --[[ Line: 213 ]] --[[ Name: TypedAudioTable ]]
    -- upvalues: v2 (copy), v19 (ref)
    return v2.createElement(v19, v55, v56);
end;
return {
    Component = v19, 
    Generator = TypedAudioTable
};