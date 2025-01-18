local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_BrushShape_0 = require(l_script_FirstAncestor_0.Src.Types).BrushShape;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local function v17(v14) --[[ Line: 45 ]] --[[ Name: BrushSlider ]]
    -- upvalues: v2 (copy), l_Slider_0 (copy)
    local l_Height_0 = v14.Height;
    local l_Value_0 = v14.Value;
    return v2.createElement(l_Slider_0, {
        Max = 64, 
        Min = 1, 
        OnValueChanged = v14.OnChanged, 
        ShowInput = true, 
        Size = UDim2.new(1, 0, 0, l_Height_0), 
        SnapIncrement = 1, 
        VerticalDragTolerance = 0, 
        Value = l_Value_0
    });
end;
return function(v18) --[[ Line: 61 ]] --[[ Name: BrushSizeRenderer ]]
    -- upvalues: l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), l_useCallback_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_BrushShape_0 (copy), v17 (copy), l_Button_0 (copy), l_Image_0 (copy)
    local l_Schema_0 = v18.Schema;
    local v20 = l_Stylizer_0:use("BrushSizeRenderer");
    local l_Shape_0 = l_Schema_0.Shape;
    local v22 = l_LayoutOrderIterator_0.new();
    local v26 = l_useCallback_0(function(v23, v24) --[[ Line: 69 ]]
        -- upvalues: v18 (copy)
        local v25 = table.clone(v18.Value);
        if v18.Value.Locked then
            v25.Height = v23 or v24;
            v25.Size = v23 or v24;
            v18.OnChanged(v25);
            return;
        elseif v23 then
            v25.Size = v23;
            v18.OnChanged(v25);
            return;
        else
            v25.Height = v24;
            v18.OnChanged(v25);
            return;
        end;
    end, {
        v18.Value.Size, 
        v18.Value.Height, 
        v18.Value.Locked
    });
    local v28 = l_useCallback_0(function(v27) --[[ Line: 88 ]]
        -- upvalues: v26 (copy)
        v26(v27, nil);
    end, {
        v26
    });
    local v30 = l_useCallback_0(function(v29) --[[ Line: 92 ]]
        -- upvalues: v26 (copy)
        v26(nil, v29);
    end, {
        v26
    });
    local v32 = l_useCallback_0(function() --[[ Line: 96 ]]
        -- upvalues: v18 (copy)
        local v31 = table.clone(v18.Value);
        v31.Locked = not v31.Locked;
        v18.OnChanged(v31);
    end, {
        v18.Value.Size, 
        v18.Value.Height, 
        v18.Value.Locked, 
        v26
    });
    local v33 = v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.fromScale(1, 0), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Inputs = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v22:getNextOrder(), 
            Size = UDim2.new(1, -v20.LockButtonWidth, 0, 0), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Size = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v22:getNextOrder()
            }, {
                SizeLabel = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v22:getNextOrder(), 
                    Size = UDim2.fromOffset(v20.LabelWidth, v20.RowHeight), 
                    Text = l_Shape_0 == l_BrushShape_0.Cylinder and "R" or "W", 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                SizeSliderContainer = v2.createElement(l_Pane_0, {
                    LayoutOrder = v22:getNextOrder(), 
                    Size = UDim2.new(1, -v20.LabelWidth, 0, v20.RowHeight)
                }, {
                    SizeSlider = v2.createElement(v17, {
                        Height = v20.RowHeight, 
                        OnChanged = v28, 
                        Value = v18.Value.Size
                    })
                })
            }), 
            Height = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v22:getNextOrder()
            }, {
                HeightLabel = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v22:getNextOrder(), 
                    Size = UDim2.fromOffset(v20.LabelWidth, v20.RowHeight), 
                    Text = "H", 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                HeightSliderContainer = v2.createElement(l_Pane_0, {
                    LayoutOrder = v22:getNextOrder(), 
                    Size = UDim2.new(1, -v20.LabelWidth, 0, v20.RowHeight)
                }, {
                    HeightSlider = v2.createElement(v17, {
                        Height = v20.RowHeight, 
                        OnChanged = v30, 
                        Value = v18.Value.Height
                    })
                })
            })
        }), 
        LockingContainer = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v22:getNextOrder(), 
            Size = UDim2.fromOffset(0, v20.RowHeight * 2 + 10), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            Locking = v2.createElement(l_Button_0, {
                LayoutOrder = v22:getNextOrder(), 
                OnClick = v32, 
                Size = UDim2.fromOffset(v20.LockButtonWidth, v20.LockButtonWidth), 
                Style = "RoundSubtle"
            }, {
                ImageContainer = v2.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Layout = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    Icon = v2.createElement(l_Image_0, {
                        Image = if v18.Value.Locked then v20.Locked else v20.Unlocked, 
                        Size = UDim2.fromOffset(16, 16)
                    })
                })
            })
        })
    });
    local v34 = v2.createElement(v17, {
        Height = v20.RowHeight, 
        OnChanged = v28, 
        Value = v18.Value.Size
    });
    if l_Shape_0 == l_BrushShape_0.Sphere then
        return v34;
    else
        return v33;
    end;
end;