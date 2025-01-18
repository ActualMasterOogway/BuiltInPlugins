local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
return function(v8) --[[ Line: 17 ]] --[[ Name: StatusCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), v3 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_Value_0 = v8.Value;
    local l_Style_0 = v8.Style;
    local v11 = v8.Width or UDim.new(1 / #v8.Columns, 0);
    local v12 = if v8.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v13 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then string.format("%.3f", l_Value_0) else tostring(l_Value_0);
    local v14 = v8.Tooltip or v13;
    local v15 = false;
    if v14 ~= nil then
        v15 = v14 ~= "";
    end;
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v18 = {
        LayoutOrder = v8.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v12, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v11.Scale, v11.Offset, 1, 0), 
        ClipsDescendants = true
    };
    local v19 = {};
    local v20 = false;
    if l_Value_0 == v3.AnimationStatus.Done then
        v20 = v2.createElement(l_Image_0, {
            Size = UDim2.fromOffset(14, 14), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = "rbxasset://textures/R15Migrator/Icon_Checkmark.png"
        });
    end;
    v19.Image = v20;
    v19.Tooltip = v15 and v2.createElement(l_Tooltip_0, {
        MaxWidth = l_Style_0.Tooltip.MaxWidth, 
        Text = v14, 
        TextXAlignment = Enum.TextXAlignment.Left
    });
    return l_createElement_0(l_l_Pane_0_0, v18, v19);
end;