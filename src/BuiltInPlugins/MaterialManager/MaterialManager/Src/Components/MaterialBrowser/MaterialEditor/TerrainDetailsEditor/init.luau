local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v21 = require(l_Actions_0.SetExpandedPane);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v24 = require(l_Controllers_0.GeneralServiceController);
local l_MaterialEditor_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor;
local v26 = require(l_MaterialEditor_0.LabeledElement);
local v27 = require(l_MaterialEditor_0.TextureSettings);
local v28 = require(l_MaterialEditor_0.TilingSettings);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v30 = require(l_Constants_0.getSettingsNames)();
local v31 = v2.PureComponent:extend("TerrainDetailsEditor");
v31.init = function(v32) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), v26 (copy), l_Pane_0 (copy), l_TruncatedTextLabel_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    v32.state = {
        name = v32.props.TerrainDetail.Name
    };
    v32.onNameChanged = function(v33) --[[ Line: 78 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            name = v33
        });
    end;
    v32.onFocusLost = function() --[[ Line: 84 ]]
        -- upvalues: v32 (copy)
        local l_props_0 = v32.props;
        if v32.state.name and v32.state.name ~= "" then
            l_props_0.GeneralServiceController:setTerrainDetailName(l_props_0.TerrainDetail, v32.state.name);
            return;
        else
            v32:setState({
                name = l_props_0.TerrainDetail.Name
            });
            return;
        end;
    end;
    v32.onExpandedChanged = function() --[[ Line: 96 ]]
        -- upvalues: v32 (copy), v30 (ref)
        local l_props_1 = v32.props;
        l_props_1.dispatchSetExpandedPane(v30.TerrainDetailsEditor[l_props_1.TerrainFace], not l_props_1.ExpandedPane);
    end;
    v32.headerComponent = function() --[[ Line: 102 ]]
        -- upvalues: v32 (copy), l_LayoutOrderIterator_0 (ref), v2 (ref), v26 (ref), l_Pane_0 (ref), l_TruncatedTextLabel_0 (ref), l_Button_0 (ref), l_Image_0 (ref), l_Tooltip_0 (ref)
        local l_props_2 = v32.props;
        local l_TerrainDetailsEditor_0 = l_props_2.Stylizer.TerrainDetailsEditor;
        local l_Localization_1 = l_props_2.Localization;
        local v39 = l_LayoutOrderIterator_0.new();
        return v2.createElement(v26, {
            LabelColumnWidth = l_TerrainDetailsEditor_0.LabelColumnWidth, 
            LayoutOrder = 1, 
            Padding = 0, 
            Text = l_Localization_1:getText("TerrainDetails", l_props_2.TerrainFace), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                Size = UDim2.fromScale(1, 1), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Name = v2.createElement(l_TruncatedTextLabel_0, {
                    LayoutOrder = v39:getNextOrder(), 
                    Size = l_TerrainDetailsEditor_0.NameLabelSize, 
                    Text = v32.state.name, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                Delete = v2.createElement(l_Button_0, {
                    LayoutOrder = v39:getNextOrder(), 
                    OnClick = l_props_2.OnDelete, 
                    Size = l_TerrainDetailsEditor_0.ButtonSize, 
                    Style = l_TerrainDetailsEditor_0.ButtonStyle
                }, {
                    Image = v2.createElement(l_Image_0, {
                        Style = l_TerrainDetailsEditor_0.Delete, 
                        Size = l_TerrainDetailsEditor_0.ImageSize, 
                        Position = l_TerrainDetailsEditor_0.ImagePosition
                    }), 
                    Tooltip = v2.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("TerrainDetails", "Delete")
                    })
                })
            })
        });
    end;
end;
v31.didUpdate = function(v40, _, v42) --[[ Line: 149 ]] --[[ Name: didUpdate ]]
    if v40.state.name ~= v40.props.TerrainDetail.Name and v42.name == v40.state.name then
        v40:setState({
            name = v40.props.TerrainDetail.Name
        });
    end;
end;
v31.render = function(v43) --[[ Line: 157 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_ExpandablePane_0 (copy), v26 (copy), l_DEPRECATED_TextInput_0 (copy), v27 (copy), v28 (copy), l_Separator_0 (copy)
    local l_props_3 = v43.props;
    local l_TerrainDetailsEditor_1 = l_props_3.Stylizer.TerrainDetailsEditor;
    local l_Localization_2 = l_props_3.Localization;
    local v47 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_ExpandablePane_0, {
        ContentPadding = {
            Top = 5, 
            Bottom = 5
        }, 
        ContentSpacing = 5, 
        LayoutOrder = l_props_3.LayoutOrder, 
        HeaderComponent = v43.headerComponent, 
        Expanded = l_props_3.ExpandedPane, 
        OnExpandedChanged = v43.onExpandedChanged
    }, {
        Name = v2.createElement(v26, {
            LabelColumnWidth = l_TerrainDetailsEditor_1.LabelColumnWidth, 
            LayoutOrder = v47:getNextOrder(), 
            Text = l_Localization_2:getText("CreateDialog", "NameVariant")
        }, {
            v2.createElement(l_DEPRECATED_TextInput_0, {
                Style = "FilledRoundedBorder", 
                Size = l_TerrainDetailsEditor_1.DialogColumnSize, 
                Text = v43.state.name, 
                OnTextChanged = v43.onNameChanged, 
                OnFocusLost = v43.onFocusLost
            })
        }), 
        TextureSettings = v2.createElement(v27, {
            LayoutOrder = v47:getNextOrder(), 
            PBRMaterial = l_props_3.TerrainDetail, 
            Expandable = false
        }), 
        TilingSettings = v2.createElement(v28, {
            LayoutOrder = v47:getNextOrder(), 
            PBRMaterial = l_props_3.TerrainDetail, 
            Expandable = false
        }), 
        Separator = if l_props_3.TerrainFace ~= "Bottom" then v2.createElement(l_Separator_0, {
            LayoutOrder = v47:getNextOrder(), 
            DominantAxis = Enum.DominantAxis.Width
        }) else nil
    });
end;
v31 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v24, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v31);
return v3.connect(function(v48, v49) --[[ Line: 213 ]]
    -- upvalues: v30 (copy)
    return {
        ExpandedPane = v48.MaterialBrowserReducer.ExpandedPane[v30.TerrainDetailsEditor[v49.TerrainFace]]
    };
end, function(v50) --[[ Line: 217 ]]
    -- upvalues: v21 (copy)
    return {
        dispatchSetExpandedPane = function(v51, v52) --[[ Line: 219 ]] --[[ Name: dispatchSetExpandedPane ]]
            -- upvalues: v50 (copy), v21 (ref)
            v50(v21(v51, v52));
        end
    };
end)(v31);