local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_GetTextSize_0 = require(l_Packages_0.Framework).Util.GetTextSize;
local v4 = require(l_Parent_0.Core.Util.Colors);
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Components.RoundFrame);
return function(v7) --[[ Line: 22 ]] --[[ Name: Toast ]]
    -- upvalues: v5 (copy), l_GetTextSize_0 (copy), v2 (copy), v6 (copy), v4 (copy)
    local v8 = v7.Text or "";
    local l_FONT_SIZE_SMALL_0 = v5.FONT_SIZE_SMALL;
    local l_FONT_0 = v5.FONT;
    local v11 = l_GetTextSize_0(v8, l_FONT_SIZE_SMALL_0, l_FONT_0, Vector2.new(0, 0));
    local v12 = 12 + v11.x + 12;
    local v13 = 8 + v11.y + 8;
    return v2.createElement(v6, {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -16), 
        Size = UDim2.new(0, v12, 0, v13), 
        ZIndex = 10, 
        BackgroundColor3 = v4.GRAY_2, 
        BackgroundTransparency = 0.2
    }, {
        TextLabel = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 0, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v8, 
            Font = v5.FONT, 
            TextSize = v5.FONT_SIZE_SMALL, 
            TextColor3 = v4.GRAY_6
        })
    });
end;