local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_UI_0 = v3.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v19 = require(l_Controllers_0.MaterialServiceController);
local v20 = require(l_Controllers_0.GeneralServiceController);
local v21 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v23 = require(l_Constants_0.getSettingsNames);
local v24 = require(l_Parent_0.Src.Util.getNumberFromText);
local v25 = require(l_Parent_0.Src.Util.ResetCustomPhysicalProperties);
local v26 = v23();
local v27 = v1.PureComponent:extend("PhysicalSettings");
v27.init = function(v28) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v25 (copy), v26 (copy)
    v28.setPhysicalProperty = function(v29) --[[ Line: 68 ]]
        -- upvalues: v28 (copy)
        return function(v30) --[[ Line: 69 ]]
            -- upvalues: v28 (ref), v29 (copy)
            v28.physicalProperties[v29] = v30;
        end;
    end;
    v28.onFocusLost = function() --[[ Line: 74 ]]
        -- upvalues: v28 (copy), v24 (ref)
        v28.props.MaterialVariant.CustomPhysicalProperties = PhysicalProperties.new(v24(v28.physicalProperties.Density) or 0, v24(v28.physicalProperties.Friction) or 0, v24(v28.physicalProperties.Elasticity) or 0, v24(v28.physicalProperties.FrictionWeight) or 0, v24(v28.physicalProperties.ElasticityWeight) or 0);
    end;
    v28.reset = function() --[[ Line: 86 ]]
        -- upvalues: v28 (copy), v25 (ref)
        local l_props_0 = v28.props;
        v25(l_props_0.MaterialVariant);
    end;
    v28.onExpandedChanged = function() --[[ Line: 92 ]]
        -- upvalues: v28 (copy), v26 (ref)
        local l_props_1 = v28.props;
        l_props_1.dispatchSetExpandedPane(v26.PhysicalSettings, not l_props_1.ExpandedPane);
    end;
end;
v27.render = function(v33) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_ExpandablePane_0 (copy), v21 (copy), l_DEPRECATED_TextInput_0 (copy), l_Pane_0 (copy), l_Button_0 (copy)
    local l_props_2 = v33.props;
    local l_PhysicalSettings_0 = l_props_2.Stylizer.PhysicalSettings;
    local l_Localization_1 = l_props_2.Localization;
    local v37 = l_LayoutOrderIterator_0.new();
    local v38 = l_props_2.MaterialVariant.CustomPhysicalProperties or PhysicalProperties.new(l_props_2.MaterialVariant.BaseMaterial);
    if v38 then
        v33.physicalProperties = {
            Density = string.format("%.3f", v38.Density):gsub("%.?0+$", ""), 
            Elasticity = string.format("%.3f", v38.Elasticity):gsub("%.?0+$", ""), 
            ElasticityWeight = string.format("%.3f", v38.ElasticityWeight):gsub("%.?0+$", ""), 
            Friction = string.format("%.3f", v38.Friction):gsub("%.?0+$", ""), 
            FrictionWeight = string.format("%.3f", v38.FrictionWeight):gsub("%.?0+$", "")
        };
    end;
    return v1.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_2.LayoutOrder, 
        ContentPadding = l_PhysicalSettings_0.ContentPadding, 
        ContentSpacing = l_PhysicalSettings_0.ItemSpacing, 
        Text = l_Localization_1:getText("PhysicalProperties", "Physics"), 
        Style = l_PhysicalSettings_0.CustomExpandablePane, 
        Expanded = l_props_2.ExpandedPane, 
        OnExpandedChanged = v33.onExpandedChanged
    }, {
        Density = v1.createElement(v21, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v37:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Density")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v33.physicalProperties.Density, 
                OnTextChanged = v33.setPhysicalProperty("Density"), 
                OnFocusLost = v33.onFocusLost
            })
        }), 
        Elasticity = v1.createElement(v21, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v37:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Elasticity")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v33.physicalProperties.Elasticity, 
                OnTextChanged = v33.setPhysicalProperty("Elasticity"), 
                OnFocusLost = v33.onFocusLost
            })
        }), 
        Friction = v1.createElement(v21, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v37:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "Friction")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v33.physicalProperties.Friction, 
                OnTextChanged = v33.setPhysicalProperty("Friction"), 
                OnFocusLost = v33.onFocusLost
            })
        }), 
        ElasticityWeight = v1.createElement(v21, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v37:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "ElasticityWeight")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v33.physicalProperties.ElasticityWeight, 
                OnTextChanged = v33.setPhysicalProperty("ElasticityWeight"), 
                OnFocusLost = v33.onFocusLost
            })
        }), 
        FrictionWeight = v1.createElement(v21, {
            LabelColumnWidth = l_PhysicalSettings_0.LabelColumnWidth, 
            LayoutOrder = v37:getNextOrder(), 
            Text = l_Localization_1:getText("PhysicalProperties", "FrictionWeight")
        }, {
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_PhysicalSettings_0.DialogColumnSize, 
                Text = v33.physicalProperties.FrictionWeight, 
                OnTextChanged = v33.setPhysicalProperty("FrictionWeight"), 
                OnFocusLost = v33.onFocusLost
            })
        }), 
        Reset = v1.createElement(l_Pane_0, {
            LayoutOrder = v37:getNextOrder(), 
            Padding = {
                Left = l_PhysicalSettings_0.ButtonPadding
            }, 
            Size = l_PhysicalSettings_0.ButtonSize
        }, {
            Button = v1.createElement(l_Button_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                OnClick = v33.reset, 
                Text = l_Localization_1:getText("PhysicalProperties", "Reset"), 
                Style = "Round"
            })
        })
    });
end;
v27 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    MaterialServiceController = v19, 
    GeneralServiceController = v20
})(v27);
return v2.connect(function(v39, _) --[[ Line: 216 ]]
    -- upvalues: v26 (copy)
    return {
        ExpandedPane = v39.MaterialBrowserReducer.ExpandedPane[v26.PhysicalSettings], 
        Material = v39.MaterialBrowserReducer.Material
    };
end, function(v41) --[[ Line: 221 ]]
    -- upvalues: v16 (copy)
    return {
        dispatchSetExpandedPane = function(v42, v43) --[[ Line: 223 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v41 (copy), v16 (ref)
            v41(v16(v42, v43));
        end
    };
end)(v27);