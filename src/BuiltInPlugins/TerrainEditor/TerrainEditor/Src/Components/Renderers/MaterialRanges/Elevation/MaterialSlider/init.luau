local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = v3.useEffect;
local _ = v3.useState;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_Button_0 = v2.UI.Button;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local l_RangeSlider_0 = v2.UI.RangeSlider;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_MaterialPreview_0 = v1.Components.MaterialPreview;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Terrain_0 = game:GetService("Workspace").Terrain;
return function(v15) --[[ Line: 39 ]] --[[ Name: MaterialSlider ]]
    -- upvalues: l_Stylizer_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), l_Pane_0 (copy), l_RangeSlider_0 (copy), l_Terrain_0 (copy), l_Image_0 (copy), l_MaterialPreview_0 (copy), l_Button_0 (copy)
    local v16 = l_Stylizer_0:use("ElevationRenderer");
    local v17 = l_LayoutOrderIterator_0.new();
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v15.LayoutOrder, 
        Size = UDim2.fromScale(0, 0), 
        Spacing = v16.Spacing
    }, {
        Slider = if v15.Selected then v3.createElement(l_RangeSlider_0, {
            ImageColor3 = l_Terrain_0:GetMaterialColor(v15.Material), 
            HideLowerKnob = not v15.Selected, 
            HideUpperKnob = not v15.Selected, 
            HorizontalDragTolerance = 20, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v17:getNextOrder(), 
            LowerRangeValue = v15.MinHeight, 
            Max = v15.Max, 
            Min = v15.Min, 
            OnInputEnded = v15.OnCommit, 
            OnValuesChanged = function(v18, v19) --[[ Line: 63 ]] --[[ Name: OnValuesChanged ]]
                -- upvalues: v15 (copy)
                v15.OnChanged({
                    MinHeight = v18, 
                    MaxHeight = v19
                });
            end, 
            Precision = true, 
            Size = v16.SliderSize, 
            UpperRangeValue = v15.MaxHeight
        }) else v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v17:getNextOrder(), 
            Size = v16.SliderAreaSize
        }, {
            Slider = v3.createElement(l_RangeSlider_0, {
                ImageColor3 = l_Terrain_0:GetMaterialColor(v15.Material), 
                HideLowerKnob = not v15.Selected, 
                HideUpperKnob = not v15.Selected, 
                HorizontalDragTolerance = 20, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v17:getNextOrder(), 
                LowerRangeValue = v15.MinHeight, 
                Max = v15.Max, 
                Min = v15.Min, 
                OnInputEnded = v15.OnCommit, 
                OnValuesChanged = function(v20, v21) --[[ Line: 89 ]] --[[ Name: OnValuesChanged ]]
                    -- upvalues: v15 (copy)
                    v15.OnChanged({
                        MinHeight = v20, 
                        MaxHeight = v21
                    });
                end, 
                Position = UDim2.fromOffset(0, 0), 
                Precision = true, 
                Size = v16.SliderSize, 
                UpperRangeValue = v15.MaxHeight
            }), 
            Button = v3.createElement("TextButton", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                [v3.Event.Activated] = function() --[[ Line: 106 ]]
                    -- upvalues: v15 (copy)
                    v15.OnSelect();
                end, 
                ZIndex = 2
            })
        }), 
        Arrow = v3.createElement(l_Image_0, {
            ImageColor3 = if v15.Selected then v16.ImageColorSelected else v16.ImageColor, 
            LayoutOrder = v17:getNextOrder(), 
            Size = v16.ArrowSize, 
            Style = v16.ArrowStyle
        }), 
        Preview = v3.createElement("ImageButton", {
            BackgroundColor = if v15.Selected then BrickColor.new(v16.PreviewBorder.Color) else nil, 
            BackgroundTransparency = v15.Selected and 0 or 1, 
            Image = if v15.Selected then v16.PreviewBorder.Image else nil, 
            ImageColor3 = if v15.Selected then v16.PreviewBorder.Color else nil, 
            LayoutOrder = v17:getNextOrder(), 
            ScaleType = Enum.ScaleType.Slice, 
            Size = v16.MaterialPreviewSize, 
            SliceCenter = v16.PreviewBorder.SliceCenter, 
            [v3.Event.Activated] = function() --[[ Line: 128 ]]
                -- upvalues: v15 (copy)
                v15.OnSelect();
            end
        }, {
            Container = v3.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -2, 1, -2)
            }, {
                MaterialPreview = v3.createElement(l_MaterialPreview_0, {
                    CornerRadius = v16.Corner, 
                    InitialDistance = 4, 
                    Material = v15.Material, 
                    Size = UDim2.fromScale(1, 1)
                })
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v16.Corner
            })
        }), 
        Delete = if v15.Selected and v15.CanDelete then v3.createElement(l_Button_0, {
            LayoutOrder = v17:getNextOrder(), 
            OnClick = v15.OnRemove, 
            Size = v16.ButtonSize, 
            Style = "RoundSubtle"
        }, {
            DeleteIcon = v3.createElement(l_Image_0, {
                ImageColor3 = v16.ImageColor, 
                Size = UDim2.fromScale(1, 1), 
                Style = v16.RemoveStyle
            })
        }) else nil
    });
end;