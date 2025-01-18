local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_TextInput_0 = l_UI_0.TextInput;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Image_0 = l_UI_0.Image;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local function v24(v13) --[[ Line: 21 ]] --[[ Name: ConvertedAnimationCellDropdown ]]
    -- upvalues: l_Stylizer_0 (copy), v3 (copy), l_LayoutOrderIterator_0 (copy), v2 (copy), l_Button_0 (copy), l_Image_0 (copy), l_DropdownMenu_0 (copy), l_TextLabel_0 (copy)
    local v14 = l_Stylizer_0:use("ConvertedAnimationCell");
    local v15, v16 = v3.useState(false);
    local v17 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Button_0, {
        LayoutOrder = v13.LayoutOrder, 
        Size = v13.Size, 
        Style = "Round", 
        OnClick = function() --[[ Line: 31 ]] --[[ Name: OnClick ]]
            -- upvalues: v16 (copy), v15 (copy)
            v16(not v15);
        end
    }, {
        Icon = v2.createElement(l_Image_0, {
            Size = v14.ExpandArrowSize, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v14.ExpandArrow, 
            ImageColor3 = v14.IconColor
        }), 
        DropdownMenu = v2.createElement(l_DropdownMenu_0, {
            Hide = not v15, 
            Items = {
                {
                    Title = tostring(v13.Value), 
                    Subtitle = "Converted from R6"
                }, 
                {
                    Title = "Replace with New", 
                    Subtitle = "Enter new Asset ID"
                }
            }, 
            OnRenderItem = function(v18, v19, v20, _) --[[ Line: 54 ]] --[[ Name: OnRenderItem ]]
                -- upvalues: v2 (ref), l_Button_0 (ref), l_TextLabel_0 (ref), v17 (copy)
                return v2.createElement(l_Button_0, {
                    LayoutOrder = v19, 
                    OnClick = v20, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 5), 
                        PaddingBottom = UDim.new(0, 5), 
                        PaddingLeft = UDim.new(0, 5), 
                        PaddingRight = UDim.new(0, 5)
                    }), 
                    Title = v2.createElement(l_TextLabel_0, {
                        LayoutOrder = v17:getNextOrder(), 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Text = v18.Title, 
                        Style = "Bold", 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    Subtitle = v2.createElement(l_TextLabel_0, {
                        LayoutOrder = v17:getNextOrder(), 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Text = v18.Subtitle, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                });
            end, 
            OnItemActivated = function(_, v23) --[[ Line: 91 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v16 (copy)
                print("OnItemActivated", v23);
                v16(false);
            end, 
            OnFocusLost = function() --[[ Line: 95 ]] --[[ Name: OnFocusLost ]]
                -- upvalues: v16 (copy)
                v16(false);
            end
        })
    });
end;
local function v27(v25) --[[ Line: 102 ]] --[[ Name: ConvertedAnimationCellTextInput ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), l_TextInput_0 (copy), v24 (copy)
    local v26 = l_Stylizer_0:use("ConvertedAnimationCell");
    return v2.createElement(l_TextInput_0, {
        Style = v26.TextInput, 
        Text = v25.Value, 
        LayoutOrder = v25.LayoutOrder, 
        Size = v25.Size, 
        TrailingComponent = v24, 
        TrailingComponentProps = {
            Size = UDim2.fromOffset(22, 22), 
            Value = v25.Value
        }
    });
end;
local function v30(v28) --[[ Line: 118 ]] --[[ Name: ContextButton ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), l_Button_0 (copy), l_Image_0 (copy)
    local v29 = l_Stylizer_0:use("ConvertedAnimationCell");
    return v2.createElement(l_Button_0, {
        LayoutOrder = v28.LayoutOrder, 
        Size = v28.Size, 
        Style = "Round", 
        OnClick = v28.OnClick
    }, {
        Image = v2.createElement(l_Image_0, {
            Size = v29.DotDotDotSize, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v29.DotDotDot, 
            ImageColor3 = v29.IconColor
        })
    });
end;
return function(v31) --[[ Line: 137 ]] --[[ Name: ConvertedAnimationCell ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), v27 (copy), v30 (copy)
    local l_Value_0 = v31.Value;
    local l_Style_0 = v31.Style;
    local v34 = v31.Width or UDim.new(1 / #v31.Columns, 0);
    local v35 = if v31.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v36 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v31.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v35, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v34.Scale, v34.Offset, 1, 0), 
        ClipsDescendants = true, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = 8, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Input = v2.createElement(v27, {
            Value = l_Value_0, 
            LayoutOrder = v36:getNextOrder(), 
            Size = UDim2.new(0, 110, 1, 0)
        }), 
        DotDotDot = v2.createElement(v30, {
            LayoutOrder = v36:getNextOrder(), 
            Size = UDim2.fromOffset(22, 22), 
            OnClick = function() --[[ Line: 172 ]] --[[ Name: OnClick ]]
                -- upvalues: v31 (copy)
                v31.OnContextButtonClick(v31.ColumnIndex, v31.RowIndex);
            end
        })
    });
end;