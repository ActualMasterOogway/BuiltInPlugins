local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), l_Separator_0 (copy), l_Pane_0 (copy)
    local l_LayoutOrder_0 = v5.LayoutOrder;
    local l_OnActivated_0 = v5.OnActivated;
    local v8 = {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4)
        }), 
        BackButton = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/GameSettings/ArrowLeft.png", 
            Size = UDim2.new(0, 24, 0, 24), 
            Rotation = 90, 
            LayoutOrder = 1, 
            [v1.Event.Activated] = l_OnActivated_0
        }), 
        Separator = v1.createElement(l_Separator_0, {
            LayoutOrder = 2
        })
    };
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, 8)
    }, v8);
end;