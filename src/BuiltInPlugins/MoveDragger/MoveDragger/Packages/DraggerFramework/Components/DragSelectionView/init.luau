local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_0.Utility.Colors);
local v5 = v3.PureComponent:extend("DragSelectionView");
v5.defaultProps = {
    BackgroundColor3 = v4.BLACK, 
    BackgroundTransparency = 1, 
    BorderColor3 = v4.GRAY
};
v5.init = function(_, v7) --[[ Line: 22 ]] --[[ Name: init ]]
    assert(v7.DragStartLocation, "Missing required property 'DragStartLocation'.");
    assert(v7.DragEndLocation, "Missing required property 'DragEndLocation'.");
end;
v5.render = function(v8) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: l_GuiService_0 (copy), v3 (copy)
    local l_DragStartLocation_0 = v8.props.DragStartLocation;
    local l_DragEndLocation_0 = v8.props.DragEndLocation;
    if not l_DragStartLocation_0 or not l_DragEndLocation_0 then
        return nil;
    else
        local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
        local v12 = Rect.new(l_DragStartLocation_0 - l_l_GuiService_0_GuiInset_0, l_DragEndLocation_0 - l_l_GuiService_0_GuiInset_0);
        return v3.createElement("ScreenGui", {
            ClipToDeviceSafeArea = false
        }, {
            v3.createElement("Frame", {
                Position = UDim2.new(0, v12.Min.X, 0, v12.Min.Y), 
                Size = UDim2.new(0, v12.Width, 0, v12.Height), 
                BackgroundColor3 = v8.props.BackgroundColor3, 
                BackgroundTransparency = v8.props.BackgroundTransparency, 
                BorderSizePixel = 0
            }, {
                Left = v3.createElement("Frame", {
                    Size = UDim2.new(0, 1, 1, 0), 
                    BackgroundColor3 = v8.props.BorderColor3, 
                    BorderSizePixel = 0
                }), 
                Top = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = v8.props.BorderColor3, 
                    BorderSizePixel = 0
                }), 
                Right = v3.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(0, 1, 1, 0), 
                    BackgroundColor3 = v8.props.BorderColor3, 
                    BorderSizePixel = 0
                }), 
                Bottom = v3.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = v8.props.BorderColor3, 
                    BorderSizePixel = 0
                })
            })
        });
    end;
end;
return v5;