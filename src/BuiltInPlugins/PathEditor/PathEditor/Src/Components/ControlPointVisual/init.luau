local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Dash);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local _ = v2.Util.StyleModifier;
local _ = require(l_Parent_0.Src.Resources.MakeTheme);
return function(v7) --[[ Line: 18 ]]
    -- upvalues: l_Stylizer_0 (copy), v3 (copy), v1 (copy)
    local v8 = l_Stylizer_0:use("ControlPointVisual");
    local l_StyleModifier_1 = v7.StyleModifier;
    if v7.Style ~= nil and v8[v7.Style] ~= nil then
        v8 = v3.join(v8, v8[v7.Style]);
    end;
    if l_StyleModifier_1 ~= nil and v8[l_StyleModifier_1] ~= nil then
        v8 = v3.join(v8, v8[l_StyleModifier_1]);
    end;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v8.PointSize, 
        BackgroundColor3 = v8.BackgroundColor3, 
        Rotation = if v8.Rotation then v8.Rotation else 0
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = v8.CornerRadius
        }), 
        Stroke = v1.createElement("UIStroke", {
            Color = v8.StrokeColor, 
            Thickness = v8.StrokeWidth, 
            LineJoinMode = v8.LineJoinMode
        })
    });
end;