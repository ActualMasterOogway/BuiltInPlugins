local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_map_0 = require(l_Parent_0.Packages.Dash).map;
local v3 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local function v11(v6) --[[ Line: 14 ]] --[[ Name: HintKey ]]
    -- upvalues: l_Stylizer_0 (copy), v1 (copy)
    local v7 = l_Stylizer_0:use("HintKeys");
    local v8 = if v6.Pressed then v7.HintKeyBackgroundPressed else v7.HintKeyBackground;
    local v9 = if v6.Pressed then v7.HintKeyBorderPressed else v7.HintKeyBorder;
    local v10 = if v6.Pressed then v7.HintKeyTextColorPressed else v7.HintKeyTextColor;
    return v1.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = v8, 
        Font = Enum.Font.SourceSansBold, 
        LayoutOrder = v6.LayoutOrder, 
        Size = UDim2.fromOffset(32, 32), 
        Text = v6.Key == "LeftControl" and "Ctrl" or v6.Key, 
        TextColor3 = v10, 
        TextSize = 24
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5)
        }), 
        Stroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v9, 
            Thickness = 5
        })
    });
end;
return function(v12) --[[ Line: 46 ]] --[[ Name: HintKeys ]]
    -- upvalues: l_map_0 (copy), v1 (copy), v11 (copy), l_Pane_0 (copy)
    local v14 = l_map_0(v12.PressedKeys, function(v13) --[[ Line: 47 ]]
        -- upvalues: v1 (ref), v11 (ref)
        return v1.createElement(v11, {
            Key = v13.key, 
            LayoutOrder = v13.index, 
            Pressed = v13.pressed
        });
    end);
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v12.LayoutOrder, 
        Padding = 10, 
        Spacing = 20
    }, v14);
end;