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
local l_Button_0 = l_UI_0.Button;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local v15 = require(l_Parent_0.Src.Util.getTerrainDetails);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v17 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v20 = require(l_Controllers_0.GeneralServiceController);
local l_MaterialEditor_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor;
local v22 = require(l_MaterialEditor_0.LabeledElement);
local v23 = require(l_MaterialEditor_0.TerrainDetailsEditor);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v25 = require(l_Constants_0.getTerrainFaceName);
local v26 = require(l_Constants_0.getTerrainFaces);
local v27 = require(l_Constants_0.getSettingsNames)();
local v28 = v26();
local v29 = v2.PureComponent:extend("TerrainDetailsSettings");
v29.init = function(v30) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy)
    v30.onClick = function(v31) --[[ Line: 68 ]]
        -- upvalues: v30 (copy)
        v30.props.GeneralServiceController:createTerrainDetail(v30.props.MaterialVariant, v31);
    end;
    v30.onDelete = function(v32) --[[ Line: 74 ]]
        -- upvalues: v30 (copy)
        v30.props.GeneralServiceController:destroyWithUndo(v32);
    end;
    v30.onExpandedChanged = function() --[[ Line: 80 ]]
        -- upvalues: v30 (copy), v27 (ref)
        local l_props_0 = v30.props;
        l_props_0.dispatchSetExpandedPane(v27.TerrainDetailsSettings, not l_props_0.ExpandedPane);
    end;
end;
v29.render = function(v34) --[[ Line: 87 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), v15 (copy), v28 (copy), v25 (copy), v23 (copy), v22 (copy), l_Button_0 (copy), l_ExpandablePane_0 (copy)
    local l_props_1 = v34.props;
    local l_TerrainDetailsSettings_0 = l_props_1.Stylizer.TerrainDetailsSettings;
    local l_Localization_1 = l_props_1.Localization;
    local v38 = l_LayoutOrderIterator_0.new();
    local l_Material_0 = l_props_1.Material;
    if not l_Material_0.MaterialVariant then
        return v2.createElement(l_Pane_0);
    else
        local v40 = v15(l_Material_0.MaterialVariant);
        local v41 = {};
        for _, v43 in ipairs(v28) do
            local v44 = v25(v43);
            local v45 = v40[v43];
            if v45 then
                v41[v44] = v2.createElement(v23, {
                    LabelColumnWidth = l_TerrainDetailsSettings_0.LabelColumnWidth, 
                    LayoutOrder = v38:getNextOrder(), 
                    TerrainDetail = v45, 
                    TerrainFace = v44, 
                    OnDelete = function() --[[ Line: 109 ]] --[[ Name: OnDelete ]]
                        -- upvalues: v34 (copy), v45 (copy)
                        v34.onDelete(v45);
                    end
                });
            else
                v41[v44] = v2.createElement(v22, {
                    LabelColumnWidth = l_TerrainDetailsSettings_0.LabelColumnWidth, 
                    LayoutOrder = v38:getNextOrder(), 
                    Text = l_Localization_1:getText("TerrainDetails", v44)
                }, {
                    v2.createElement(l_Button_0, {
                        Size = l_TerrainDetailsSettings_0.DialogColumnSize, 
                        Text = l_Localization_1:getText("TerrainDetails", "ButtonCreate"), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        OnClick = function() --[[ Line: 123 ]] --[[ Name: OnClick ]]
                            -- upvalues: v34 (copy), v44 (copy)
                            v34.onClick(v44);
                        end, 
                        Style = "Round"
                    })
                });
            end;
        end;
        return v2.createElement(l_ExpandablePane_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            ContentPadding = l_TerrainDetailsSettings_0.ContentPadding, 
            ContentSpacing = l_TerrainDetailsSettings_0.ItemSpacing, 
            Text = l_Localization_1:getText("TerrainDetails", "TerrainDetails"), 
            Style = l_TerrainDetailsSettings_0.CustomExpandablePane, 
            Expanded = l_props_1.ExpandedPane, 
            OnExpandedChanged = v34.onExpandedChanged
        }, v41);
    end;
end;
v29 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v20, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v29);
return v4.connect(function(v46, v47) --[[ Line: 150 ]]
    -- upvalues: v27 (copy)
    return {
        Material = v47.MockMaterial or v46.MaterialBrowserReducer.Material, 
        ExpandedPane = v46.MaterialBrowserReducer.ExpandedPane[v27.TerrainDetailsSettings]
    };
end, function(v48) --[[ Line: 155 ]]
    -- upvalues: v17 (copy)
    return {
        dispatchSetExpandedPane = function(v49, v50) --[[ Line: 157 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v48 (copy), v17 (ref)
            v48(v17(v49, v50));
        end
    };
end)(v29);