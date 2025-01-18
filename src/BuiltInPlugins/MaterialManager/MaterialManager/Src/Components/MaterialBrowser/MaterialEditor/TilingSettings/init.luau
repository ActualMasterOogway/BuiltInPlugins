local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v17 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v20 = require(l_Controllers_0.GeneralServiceController);
local v21 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v23 = require(l_Constants_0.getMaterialPatterns);
local v24 = require(l_Constants_0.getMaterialPatternName);
local v25 = require(l_Constants_0.getSettingsNames);
local l_Util_0 = l_Parent_0.Src.Util;
local v27 = require(l_Util_0.getNumberFromText);
local v28 = require(l_Util_0.getTextFromNumber);
local v29 = v23();
local v30 = v25();
local v31 = v2.PureComponent:extend("TilingSettings");
v31.init = function(v32) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: v28 (copy), v2 (copy), v27 (copy), v29 (copy), v30 (copy)
    v32.state = {
        studsPerTile = v28(v32.props.PBRMaterial.StudsPerTile)
    };
    v32.materialPatterns = {};
    v32.onStudsPerTileChanged = function(v33) --[[ Line: 76 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            studsPerTile = v33
        });
    end;
    v32.setStudsPerTileStatus = function(v34) --[[ Line: 82 ]]
        -- upvalues: v32 (copy), v2 (ref)
        v32:setState({
            studsPerTileMessage = v34 or v2.None, 
            status = if v34 then Enum.PropertyStatus.Warning else Enum.PropertyStatus.Ok
        });
    end;
    v32.onFocusLost = function() --[[ Line: 89 ]]
        -- upvalues: v32 (copy), v27 (ref), v28 (ref)
        local l_props_0 = v32.props;
        local l_Localization_1 = l_props_0.Localization;
        local v37 = v27(v32.state.studsPerTile);
        if v37 then
            l_props_0.GeneralServiceController:setStudsPerTile(l_props_0.PBRMaterial, v37);
            v32.setStudsPerTileStatus(nil);
            return;
        else
            v32:setState({
                studsPerTile = v28(v32.props.PBRMaterial.StudsPerTile)
            });
            v32.setStudsPerTileStatus(l_Localization_1:getText("CreateDialog", "ErrorStudsPerTile"));
            return;
        end;
    end;
    v32.onMaterialPatternSelected = function(v38, v39) --[[ Line: 105 ]]
        -- upvalues: v32 (copy), v29 (ref)
        local l_props_1 = v32.props;
        if v38 then
            l_props_1.GeneralServiceController:setMaterialPattern(l_props_1.PBRMaterial, v29[v39]);
        end;
    end;
    v32.onExpandedChanged = function() --[[ Line: 113 ]]
        -- upvalues: v32 (copy), v30 (ref)
        local l_props_2 = v32.props;
        local l_TilingSettings_0 = v30.TilingSettings;
        l_props_2.dispatchSetExpandedPane(l_TilingSettings_0, not l_props_2.ExpandedPane);
    end;
end;
v31.didMount = function(v43) --[[ Line: 120 ]] --[[ Name: didMount ]]
    -- upvalues: v29 (copy), v24 (copy)
    local l_Localization_2 = v43.props.Localization;
    for _, v46 in ipairs(v29) do
        table.insert(v43.materialPatterns, l_Localization_2:getText("MaterialPatterns", v24(v46)));
    end;
    v43:setState({});
end;
v31.didUpdate = function(v47, _, v49) --[[ Line: 133 ]] --[[ Name: didUpdate ]]
    -- upvalues: v28 (copy), v2 (copy)
    if v47.state.studsPerTile ~= v28(v47.props.PBRMaterial.StudsPerTile) and v49.studsPerTile == v47.state.studsPerTile then
        v47:setState({
            studsPerTile = v28(v47.props.PBRMaterial.StudsPerTile), 
            studsPerTileMessage = v2.None, 
            status = Enum.PropertyStatus.Ok
        });
    end;
end;
v31.render = function(v50) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v29 (copy), v2 (copy), v21 (copy), l_DEPRECATED_TextInput_0 (copy), l_SelectInput_0 (copy), l_ExpandablePane_0 (copy), l_Pane_0 (copy)
    local l_props_3 = v50.props;
    local l_TilingSettings_1 = l_props_3.Stylizer.TilingSettings;
    local l_Localization_3 = l_props_3.Localization;
    local v54 = l_LayoutOrderIterator_0.new();
    local v55 = 1;
    for v56, v57 in ipairs(v29) do
        if v57 == l_props_3.PBRMaterial.MaterialPattern then
            v55 = v56;
        end;
    end;
    local v58 = {
        StudsPerTile = v2.createElement(v21, {
            LabelColumnWidth = l_props_3.LabelWidth or l_TilingSettings_1.LabelColumnWidth, 
            LayoutOrder = v54:getNextOrder(), 
            Text = l_Localization_3:getText("MaterialTiling", "StudsPerTile"), 
            StatusText = v50.state.studsPerTileMessage, 
            Status = v50.state.status
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_TilingSettings_1.DialogColumnSize, 
                Text = v50.state.studsPerTile, 
                OnTextChanged = v50.onStudsPerTileChanged, 
                OnFocusLost = v50.onFocusLost
            })
        }), 
        MaterialPattern = v2.createElement(v21, {
            LabelColumnWidth = l_props_3.LabelWidth or l_TilingSettings_1.LabelColumnWidth, 
            LayoutOrder = v54:getNextOrder(), 
            Text = l_Localization_3:getText("MaterialTiling", "Pattern")
        }, {
            v2.createElement(l_SelectInput_0, {
                Style = l_TilingSettings_1.CustomSelectInput, 
                Items = v50.materialPatterns, 
                Size = l_TilingSettings_1.DialogColumnSize, 
                OnItemActivated = v50.onMaterialPatternSelected, 
                SelectedIndex = v55
            })
        })
    };
    if l_props_3.Expandable then
        return v2.createElement(l_ExpandablePane_0, {
            LayoutOrder = l_props_3.LayoutOrder, 
            ContentPadding = l_TilingSettings_1.ContentPadding, 
            ContentSpacing = l_TilingSettings_1.ItemSpacing, 
            Text = l_Localization_3:getText("MaterialTiling", "Tiling"), 
            Style = l_TilingSettings_1.CustomExpandablePane, 
            Expanded = l_props_3.ExpandedPane, 
            OnExpandedChanged = v50.onExpandedChanged
        }, v58);
    else
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = l_TilingSettings_1.ItemSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, v58);
    end;
end;
v31 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v20, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v31);
return v4.connect(function(v59) --[[ Line: 218 ]]
    -- upvalues: v30 (copy)
    return {
        ExpandedPane = v59.MaterialBrowserReducer.ExpandedPane[v30.TilingSettings], 
        Material = v59.MaterialBrowserReducer.Material
    };
end, function(v60) --[[ Line: 223 ]]
    -- upvalues: v17 (copy)
    return {
        dispatchSetExpandedPane = function(v61, v62) --[[ Line: 225 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v60 (copy), v17 (ref)
            v60(v17(v61, v62));
        end
    };
end)(v31);