local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v15 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v17 = require(l_Parent_0.Src.Controllers.MaterialServiceController);
local v18 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v20 = require(l_Constants_0.getSettingsNames);
local v21 = require(l_Constants_0.getSupportedMaterials)();
local v22 = v20();
local v23 = v2.PureComponent:extend("OverrideSettings");
v23.init = function(v24) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy)
    v24.onOverrideToggled = function(v25) --[[ Line: 61 ]]
        -- upvalues: v24 (copy)
        local l_props_0 = v24.props;
        if v25 then
            l_props_0.MaterialServiceController:setMaterialOverride(l_props_0.MaterialVariant.BaseMaterial);
        else
            local v27 = table.find(l_props_0.MaterialOverrides, l_props_0.MaterialVariant.Name);
            l_props_0.MaterialServiceController:setMaterialOverride(l_props_0.MaterialVariant.BaseMaterial, l_props_0.MaterialOverrides[v27]);
        end;
        l_props_0.Analytics:report("setOverrideToggled");
    end;
    v24.onExpandedChanged = function() --[[ Line: 77 ]]
        -- upvalues: v24 (copy), v22 (ref)
        local l_props_1 = v24.props;
        l_props_1.dispatchSetExpandedPane(v22.OverrideSettings, not l_props_1.ExpandedPane);
    end;
end;
v23.render = function(v29) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ExpandablePane_0 (copy), v18 (copy), l_Pane_0 (copy), l_ToggleButton_0 (copy)
    local l_props_2 = v29.props;
    local l_OverrideSettings_0 = l_props_2.Stylizer.OverrideSettings;
    local l_Localization_1 = l_props_2.Localization;
    local l_MaterialVariant_0 = l_props_2.MaterialVariant;
    local v34 = false;
    if l_props_2.MaterialOverride > 1 then
        v34 = l_props_2.MaterialOverrides[l_props_2.MaterialOverride] == l_MaterialVariant_0.Name;
    end;
    return v2.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_2.LayoutOrder, 
        ContentPadding = l_OverrideSettings_0.ContentPadding, 
        ContentSpacing = l_OverrideSettings_0.ItemSpacing, 
        Text = l_Localization_1:getText("OverrideSettings", "Overrides"), 
        Style = l_OverrideSettings_0.CustomExpandablePane, 
        Expanded = l_props_2.ExpandedPane, 
        OnExpandedChanged = v29.onExpandedChanged
    }, {
        OverridesNew = v2.createElement(v18, {
            LabelColumnWidth = l_OverrideSettings_0.LabelColumnWidth, 
            Text = l_Localization_1:getText("OverrideSettings", "SetOverride")
        }, {
            Button = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(0, 195, 0, 20), 
                Padding = 5
            }, {
                ToggleButton = v2.createElement(l_ToggleButton_0, {
                    OnClick = function() --[[ Line: 113 ]] --[[ Name: OnClick ]]
                        -- upvalues: v29 (copy), v34 (copy)
                        v29.onOverrideToggled(v34);
                    end, 
                    Selected = v34, 
                    Size = UDim2.fromOffset(30, 18)
                })
            })
        })
    });
end;
v23 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialServiceController = v17, 
    Stylizer = l_Stylizer_0
})(v23);
return v3.connect(function(v35, v36) --[[ Line: 131 ]]
    -- upvalues: v22 (copy), v21 (copy)
    if v36.MockMaterial then
        return {
            ExpandedPane = v35.MaterialBrowserReducer.ExpandedPane[v22.OverrideSettings], 
            MaterialOverrides = v35.MaterialBrowserReducer.MaterialOverrides[v36.MockMaterial.Material], 
            MaterialOverride = v35.MaterialBrowserReducer.MaterialOverride[v36.MockMaterial.Material]
        };
    elseif not v35.MaterialBrowserReducer.Material or not v21[v35.MaterialBrowserReducer.Material.Material] then
        return {};
    else
        return {
            ExpandedPane = v35.MaterialBrowserReducer.ExpandedPane[v22.OverrideSettings], 
            MaterialOverrides = v35.MaterialBrowserReducer.MaterialOverrides[v35.MaterialBrowserReducer.Material.Material], 
            MaterialOverride = v35.MaterialBrowserReducer.MaterialOverride[v35.MaterialBrowserReducer.Material.Material]
        };
    end;
end, function(v37) --[[ Line: 152 ]]
    -- upvalues: v15 (copy)
    return {
        dispatchSetExpandedPane = function(v38, v39) --[[ Line: 154 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v37 (copy), v15 (ref)
            v37(v15(v38, v39));
        end
    };
end)(v23);