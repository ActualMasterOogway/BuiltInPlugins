local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(v9) --[[ Line: 30 ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy)
    local l_Icon_0 = v9.Icon;
    local l_Key_0 = v9.Key;
    local l_Name_0 = v9.Name;
    local l_OnClick_0 = v9.OnClick;
    return v2.createElement(l_Button_0, {
        OnClick = function() --[[ Line: 37 ]] --[[ Name: OnClick ]]
            -- upvalues: l_OnClick_0 (copy), l_Key_0 (copy)
            l_OnClick_0(l_Key_0);
        end, 
        Position = v9.Position, 
        Size = v9.Size, 
        Style = "RoundSubtle", 
        StyleModifier = if l_Key_0 == v9.Selected then l_StyleModifier_0.Selected else nil
    }, {
        Pane = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = 2, 
            Spacing = 2
        }, {
            Icon = v2.createElement(l_Image_0, l_Icon_0), 
            Text = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                Text = l_Name_0, 
                TextSize = v9.TextSize
            })
        })
    });
end;