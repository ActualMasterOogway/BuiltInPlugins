local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Framework);
local v4 = require(l_Parent_1.React);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v11 = require(l_Parent_0.Enums.MaterialPreviewGeometryType);
local v12 = require(l_Parent_0.Components.MaterialPreview);
local v13 = require(l_Parent_0.TestHelpers.createMaterialVariants);
local function v15(v14) --[[ Line: 20 ]] --[[ Name: LabeledElement ]]
    -- upvalues: v4 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    return v4.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v14.LayoutOrder, 
        Spacing = 8, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Label = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = v14.Text
        }), 
        Content = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2
        }, v14.children)
    });
end;
local function v21(v16) --[[ Line: 42 ]] --[[ Name: createEnumItems ]]
    -- upvalues: v2 (copy)
    local v18 = v2.map(v16:GetEnumItems(), function(v17) --[[ Line: 43 ]]
        return {
            Id = v17, 
            Label = v17.Name
        };
    end);
    table.sort(v18, function(v19, v20) --[[ Line: 49 ]]
        return v19.Label < v20.Label;
    end);
    return v18;
end;
local function v27(v22) --[[ Line: 55 ]] --[[ Name: createCustomEnumItems ]]
    -- upvalues: v2 (copy)
    local v24 = v2.map(v22.allValues(), function(v23) --[[ Line: 56 ]]
        return {
            Id = v23, 
            Label = v23.rawValue()
        };
    end);
    table.sort(v24, function(v25, v26) --[[ Line: 63 ]]
        return v25.Label < v26.Label;
    end);
    return v24;
end;
local v28 = v21(Enum.Material);
local v29 = v21(Enum.MaterialPattern);
local v30 = v27(v11);
local v31 = v4.PureComponent:extend("MaterialPreviewStory");
v31.init = function(v32, v33) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy)
    v32:setState({
        material = v33.Material, 
        materialPreviewGeometryType = v33.DefaultMaterialPreviewGeometryType or v11.Sphere
    });
    v32.materialChanged = function(v34) --[[ Line: 81 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            material = v34.Id
        });
    end;
    v32.onPreviewGeometryTypeChanged = function(v35) --[[ Line: 87 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            materialPreviewGeometryType = v35.Id
        });
    end;
    v32.studsPerTileChanged = function(v36) --[[ Line: 93 ]]
        -- upvalues: v32 (copy)
        local l_MaterialVariant_0 = v32.props.MaterialVariant;
        if l_MaterialVariant_0 then
            l_MaterialVariant_0.StudsPerTile = v36;
        end;
    end;
    v32.materialPatternChanged = function(v38) --[[ Line: 100 ]]
        -- upvalues: v32 (copy)
        local l_MaterialVariant_1 = v32.props.MaterialVariant;
        if l_MaterialVariant_1 then
            l_MaterialVariant_1.MaterialPattern = v38.Id;
        end;
    end;
    v32.forceUpdate = function() --[[ Line: 108 ]]
        -- upvalues: v32 (copy)
        v32:setState(function(v40) --[[ Line: 109 ]]
            return {
                updateCount = (v40.updateCount or 0) + 1
            };
        end);
    end;
end;
v31.didMount = function(v41) --[[ Line: 117 ]] --[[ Name: didMount ]]
    local l_MaterialVariant_2 = v41.props.MaterialVariant;
    if l_MaterialVariant_2 then
        v41.studsPerTileChangedConnection = l_MaterialVariant_2:GetPropertyChangedSignal("StudsPerTile"):Connect(v41.forceUpdate);
        v41.materialPatternChangedConnection = l_MaterialVariant_2:GetPropertyChangedSignal("MaterialPattern"):Connect(v41.forceUpdate);
        v41.restoreMaterialVariantParent = l_MaterialVariant_2.Parent;
    end;
end;
v31.willUnmount = function(v43) --[[ Line: 128 ]] --[[ Name: willUnmount ]]
    local l_MaterialVariant_3 = v43.props.MaterialVariant;
    if l_MaterialVariant_3 then
        if v43.studsPerTileChangedConnection then
            v43.studsPerTileChangedConnection:Disconnect();
            v43.studsPerTileChangedConnection = nil;
        end;
        if v43.materialPatternChangedConnection then
            v43.materialPatternChangedConnection:Disconnect();
            v43.materialPatternChangedConnection = nil;
        end;
        l_MaterialVariant_3.Parent = v43.restoreMaterialVariantParent;
    end;
end;
v31.render = function(v45) --[[ Line: 143 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v4 (copy), v12 (copy), l_Pane_0 (copy), v15 (copy), l_SelectInput_0 (copy), v28 (copy), v30 (copy), l_PropertyCell_0 (copy), v29 (copy)
    local l_props_0 = v45.props;
    local l_state_0 = v45.state;
    local l_MaterialVariant_4 = l_props_0.MaterialVariant;
    local l_material_0 = l_state_0.material;
    local v50 = l_LayoutOrderIterator_0.new();
    local v51 = {
        Preview = v4.createElement(v12, {
            DisableZoom = true, 
            LayoutOrder = v50:getNextOrder(), 
            Material = l_material_0 or l_MaterialVariant_4, 
            MaterialPreviewGeometryType = l_state_0.materialPreviewGeometryType, 
            RecenterCameraOnUpdate = false, 
            Size = UDim2.fromOffset(200, 200), 
            Style = "CornerBox"
        })
    };
    if l_material_0 then
        v51.MaterialInput = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v50:getNextOrder(), 
            Size = UDim2.new(0, 200, 1, 0), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Materialinput = v4.createElement(v15, {
                LayoutOrder = v50:getNextOrder(), 
                Text = "Material"
            }, {
                Input = v4.createElement(l_SelectInput_0, {
                    Items = v28, 
                    OnItemActivated = v45.materialChanged, 
                    SelectedId = l_material_0, 
                    Size = UDim2.fromOffset(200, 30)
                })
            }), 
            GeometryInputType = v4.createElement(v15, {
                LayoutOrder = v50:getNextOrder(), 
                Text = "Preview geometry"
            }, {
                Input = v4.createElement(l_SelectInput_0, {
                    Items = v30, 
                    OnItemActivated = v45.onPreviewGeometryTypeChanged, 
                    SelectedId = l_state_0.materialPreviewGeometryType, 
                    Size = UDim2.fromOffset(200, 30)
                })
            })
        });
    end;
    if l_MaterialVariant_4 then
        v51.MaterialVariantPane = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v50:getNextOrder(), 
            Size = UDim2.new(0, 200, 1, 0), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            StudsPerTile = v4.createElement(v15, {
                LayoutOrder = v50:getNextOrder(), 
                Text = "Studs Per Tile"
            }, {
                Input = v4.createElement(l_PropertyCell_0, {
                    OnChanged = v45.studsPerTileChanged, 
                    Schema = {
                        Type = "Slider", 
                        Min = 0.1, 
                        Max = 20, 
                        SnapIncrement = 0.1, 
                        ShowInput = true
                    }, 
                    Size = UDim2.fromOffset(200, 30), 
                    Value = l_MaterialVariant_4.StudsPerTile
                })
            }), 
            MaterialPattern = v4.createElement(v15, {
                LayoutOrder = v50:getNextOrder(), 
                Text = "Material Pattern"
            }, {
                Input = v4.createElement(l_SelectInput_0, {
                    Items = v29, 
                    OnItemActivated = v45.materialPatternChanged, 
                    SelectedId = l_MaterialVariant_4.MaterialPattern, 
                    Size = UDim2.fromOffset(200, 30)
                })
            }), 
            GeometryInputType = v4.createElement(v15, {
                LayoutOrder = v50:getNextOrder(), 
                Text = "Preview geometry"
            }, {
                Input = v4.createElement(l_SelectInput_0, {
                    Items = v30, 
                    OnItemActivated = v45.onPreviewGeometryTypeChanged, 
                    SelectedId = l_state_0.materialPreviewGeometryType, 
                    Size = UDim2.fromOffset(200, 30)
                })
            })
        });
    end;
    return v4.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = 10, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, v51);
end;
return {
    stories = {
        {
            name = "Material Variant (ColorMap)", 
            story = v4.createElement(v31, {
                MaterialVariant = v13()[1], 
                DefaultMaterialPreviewGeometryType = v11.ColorMap
            })
        }, 
        {
            name = "Material (Dominus)", 
            story = v4.createElement(v31, {
                Material = Enum.Material.Granite, 
                DefaultMaterialPreviewGeometryType = v11.Dominus
            })
        }, 
        {
            name = "Material (Metal)", 
            story = v4.createElement(v31, {
                Material = Enum.Material.Metal
            })
        }, 
        {
            name = "Material (Brick)", 
            story = v4.createElement(v31, {
                Material = Enum.Material.Brick
            })
        }, 
        {
            name = "Material Variant", 
            story = v4.createElement(v31, {
                MaterialVariant = v13()[1], 
                DefaultMaterialPreviewGeometryType = v11.Sphere
            })
        }, 
        {
            name = "MaterialVariant (Plane)", 
            story = v4.createElement(v31, {
                MaterialVariant = v13()[2], 
                DefaultMaterialPreviewGeometryType = v11.Plane
            })
        }
    }
};