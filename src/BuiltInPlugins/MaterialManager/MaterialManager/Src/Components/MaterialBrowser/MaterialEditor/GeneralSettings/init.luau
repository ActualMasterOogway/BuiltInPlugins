local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v15 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v18 = require(l_Controllers_0.MaterialServiceController);
local v19 = require(l_Controllers_0.GeneralServiceController);
local v20 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v22 = require(l_Constants_0.getMaterialPath);
local v23 = require(l_Constants_0.getSupportedMaterials);
local v24 = require(l_Constants_0.getMaterialName);
local v25 = require(l_Constants_0.getSettingsNames)();
local v26 = v23(true);
local v27 = v2.PureComponent:extend("GeneralSettings");
v27.init = function(v28) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v26 (copy), v22 (copy), v25 (copy)
    v28.state = {
        name = v28.props.MaterialVariant.Name
    };
    v28.baseMaterials = {};
    v28.setNameStatus = function(v29, v30) --[[ Line: 73 ]]
        -- upvalues: v28 (copy), v2 (ref)
        v28:setState({
            nameMessage = v29 or v2.None, 
            status = v30 or Enum.PropertyStatus.Ok
        });
    end;
    v28.onNameChanged = function(v31) --[[ Line: 80 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            name = v31
        });
    end;
    v28.onFocusLost = function() --[[ Line: 86 ]]
        -- upvalues: v28 (copy)
        local l_props_0 = v28.props;
        local l_Localization_1 = l_props_0.Localization;
        if v28.state.name and v28.state.name ~= "" then
            l_props_0.GeneralServiceController:setName(l_props_0.MaterialVariant, v28.state.name);
            local l_BaseMaterial_0 = l_props_0.MaterialVariant.BaseMaterial;
            if l_props_0.MaterialServiceController:checkMaterialName(v28.state.name, l_BaseMaterial_0) then
                v28.setNameStatus(l_Localization_1:getText("CreateDialog", "ErrorNameExists"), Enum.PropertyStatus.Warning);
                return;
            else
                v28.setNameStatus(nil);
                return;
            end;
        else
            v28:setState({
                name = l_props_0.MaterialVariant.Name
            });
            return;
        end;
    end;
    v28.onBaseMaterialSelected = function(_, v36) --[[ Line: 105 ]]
        -- upvalues: v28 (copy), v26 (ref), v22 (ref)
        local l_props_1 = v28.props;
        local l_Localization_2 = l_props_1.Localization;
        l_props_1.GeneralServiceController:setBaseMaterial(l_props_1.MaterialVariant, v26[v36]);
        l_props_1.MaterialServiceController:setPath(v22(l_props_1.MaterialVariant.BaseMaterial));
        local l_Name_0 = l_props_1.MaterialVariant.Name;
        local l_BaseMaterial_1 = l_props_1.MaterialVariant.BaseMaterial;
        if l_props_1.MaterialServiceController:checkMaterialName(l_Name_0, l_BaseMaterial_1) then
            v28.setNameStatus(l_Localization_2:getText("CreateDialog", "ErrorNameExists"), Enum.PropertyStatus.Warning);
            return;
        else
            v28.setNameStatus(nil);
            return;
        end;
    end;
    v28.onExpandedChanged = function() --[[ Line: 120 ]]
        -- upvalues: v28 (copy), v25 (ref)
        local l_props_2 = v28.props;
        l_props_2.dispatchSetExpandedPane(v25.GeneralSettings, not l_props_2.ExpandedPane);
    end;
end;
v27.didMount = function(v42) --[[ Line: 127 ]] --[[ Name: didMount ]]
    -- upvalues: v26 (copy), v24 (copy)
    local l_Localization_3 = v42.props.Localization;
    for _, v45 in ipairs(v26) do
        table.insert(v42.baseMaterials, l_Localization_3:getText("Materials", v24(v45)));
    end;
    v42:setState({});
end;
v27.didUpdate = function(v46, _, v48) --[[ Line: 137 ]] --[[ Name: didUpdate ]]
    if v46.state.name ~= v46.props.MaterialVariant.Name and v48.name == v46.state.name then
        v46:setState({
            name = v46.props.MaterialVariant.Name
        });
    end;
end;
v27.render = function(v49) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), v2 (copy), l_ExpandablePane_0 (copy), v20 (copy), l_DEPRECATED_TextInput_0 (copy), l_SelectInput_0 (copy)
    local l_props_3 = v49.props;
    local l_GeneralSettings_0 = l_props_3.Stylizer.GeneralSettings;
    local l_Localization_4 = l_props_3.Localization;
    local v53 = -1;
    for v54, v55 in ipairs(v26) do
        if v55 == l_props_3.MaterialVariant.BaseMaterial then
            v53 = v54;
        end;
        if v55 == Enum.Material.Plastic and v53 == -1 then
            v53 = v54;
        end;
    end;
    if v53 == -1 then
        v53 = 1;
    end;
    return v2.createElement(l_ExpandablePane_0, {
        LayoutOrder = l_props_3.LayoutOrder, 
        ContentPadding = l_GeneralSettings_0.ContentPadding, 
        ContentSpacing = l_GeneralSettings_0.ItemSpacing, 
        Text = l_Localization_4:getText("MaterialGeneral", "General"), 
        Style = l_GeneralSettings_0.CustomExpandablePane, 
        Expanded = l_props_3.ExpandedPane, 
        OnExpandedChanged = v49.onExpandedChanged
    }, {
        Name = v2.createElement(v20, {
            LabelColumnWidth = l_GeneralSettings_0.LabelColumnWidth, 
            LayoutOrder = 1, 
            Text = l_Localization_4:getText("CreateDialog", "NameVariant"), 
            StatusText = v49.state.nameMessage, 
            Status = v49.state.status
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_GeneralSettings_0.DialogColumnSize, 
                Text = v49.state.name, 
                OnTextChanged = v49.onNameChanged, 
                OnFocusLost = v49.onFocusLost
            })
        }), 
        BaseMaterial = v2.createElement(v20, {
            LabelColumnWidth = l_GeneralSettings_0.LabelColumnWidth, 
            LayoutOrder = 2, 
            Text = l_Localization_4:getText("CreateDialog", "BaseMaterialVariant")
        }, {
            v2.createElement(l_SelectInput_0, {
                Style = l_GeneralSettings_0.CustomSelectInput, 
                Items = v49.baseMaterials, 
                Size = l_GeneralSettings_0.DialogColumnSize, 
                OnItemActivated = v49.onBaseMaterialSelected, 
                PlaceholderText = l_Localization_4:getText("CreateDialog", "PlaceholderBaseMaterial"), 
                SelectedIndex = v53
            })
        })
    });
end;
v27 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    MaterialServiceController = v18, 
    GeneralServiceController = v19
})(v27);
return v3.connect(function(v56) --[[ Line: 213 ]]
    -- upvalues: v25 (copy)
    return {
        ExpandedPane = v56.MaterialBrowserReducer.ExpandedPane[v25.GeneralSettings], 
        Material = v56.MaterialBrowserReducer.Material
    };
end, function(v57) --[[ Line: 218 ]]
    -- upvalues: v15 (copy)
    return {
        dispatchSetExpandedPane = function(v58, v59) --[[ Line: 220 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v57 (copy), v15 (ref)
            v57(v15(v58, v59));
        end
    };
end)(v27);