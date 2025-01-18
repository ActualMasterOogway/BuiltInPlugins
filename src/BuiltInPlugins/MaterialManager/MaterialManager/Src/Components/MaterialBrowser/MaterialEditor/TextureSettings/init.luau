local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v14 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.TextureMapSelector);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v18 = require(l_Constants_0.getSettingsNames);
local v19 = require(l_Constants_0.getTextureMapNames)();
local v20 = v18();
local v21 = v1.PureComponent:extend("TextureSettings");
v21.init = function(v22) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    v22.onExpandedChanged = function() --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v20 (ref)
        local l_props_0 = v22.props;
        local l_TextureSettings_0 = v20.TextureSettings;
        l_props_0.dispatchSetExpandedPane(l_TextureSettings_0, not l_props_0.ExpandedPane);
    end;
end;
v21.render = function(v25) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_LayoutOrderIterator_0 (copy), v16 (copy), v19 (copy), l_ExpandablePane_0 (copy)
    local l_props_1 = v25.props;
    local l_TextureSettings_1 = l_props_1.Stylizer.TextureSettings;
    local l_Localization_1 = l_props_1.Localization;
    if not l_props_1.PBRMaterial then
        return v1.createElement(l_Pane_0);
    else
        local v29 = l_LayoutOrderIterator_0.new();
        local v30 = {
            ImportColorMap = v1.createElement(v16, {
                LayoutOrder = v29:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_1.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_1.LabelWidth, 
                MapType = v19.ColorMap, 
                PreviewTitle = l_Localization_1:getText("Import", "ColorMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportColorMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_1.ColumnWidth
            }), 
            ImportMetalnessMap = v1.createElement(v16, {
                LayoutOrder = v29:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_1.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_1.LabelWidth, 
                MapType = v19.MetalnessMap, 
                PreviewTitle = l_Localization_1:getText("Import", "MetalnessMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportMetalnessMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_1.ColumnWidth
            }), 
            ImportNormalMap = v1.createElement(v16, {
                LayoutOrder = v29:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_1.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_1.LabelWidth, 
                MapType = v19.NormalMap, 
                PreviewTitle = l_Localization_1:getText("Import", "NormalMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportNormalMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_1.ColumnWidth
            }), 
            ImportRoughnessMap = v1.createElement(v16, {
                LayoutOrder = v29:getNextOrder(), 
                LabelColumnWidth = l_TextureSettings_1.LabelColumnWidth, 
                LabelWidth = l_TextureSettings_1.LabelWidth, 
                MapType = v19.RoughnessMap, 
                PreviewTitle = l_Localization_1:getText("Import", "RoughnessMapPreview"), 
                Text = l_Localization_1:getText("CreateDialog", "ImportRoughnessMap"), 
                PBRMaterial = l_props_1.PBRMaterial, 
                ColumnWidth = l_TextureSettings_1.ColumnWidth
            })
        };
        if l_props_1.Expandable then
            return v1.createElement(l_ExpandablePane_0, {
                LayoutOrder = l_props_1.LayoutOrder, 
                ContentPadding = l_TextureSettings_1.ContentPadding, 
                ContentSpacing = l_TextureSettings_1.ItemSpacing, 
                Text = l_Localization_1:getText("MaterialTextures", "TextureMaps"), 
                Style = l_TextureSettings_1.CustomExpandablePane, 
                Expanded = l_props_1.ExpandedPane, 
                OnExpandedChanged = v25.onExpandedChanged
            }, v30);
        else
            return v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = l_props_1.LayoutOrder, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = l_TextureSettings_1.ItemSpacing, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, v30);
        end;
    end;
end;
v21 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21);
return v2.connect(function(v31) --[[ Line: 146 ]]
    -- upvalues: v20 (copy)
    return {
        ExpandedPane = v31.MaterialBrowserReducer.ExpandedPane[v20.TextureSettings]
    };
end, function(v32) --[[ Line: 150 ]]
    -- upvalues: v14 (copy)
    return {
        dispatchSetExpandedPane = function(v33, v34) --[[ Line: 152 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v32 (copy), v14 (ref)
            v32(v14(v33, v34));
        end
    };
end)(v21);