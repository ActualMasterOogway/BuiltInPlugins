local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v4 = require(l_Parent_0.Path2DWrapper);
local v5 = require(l_Parent_0.PlotRectUtil);
return function(v6) --[[ Line: 35 ]] --[[ Name: PolarGridLine ]]
    -- upvalues: v5 (copy), v2 (copy), l_Pane_0 (copy), v4 (copy)
    local v7 = {};
    if v6.Orientation == "Horizontal" then
        local v8 = {
            Vector2.new(0, v6.Position), 
            Vector2.new(90, v6.Position), 
            Vector2.new(180, v6.Position), 
            Vector2.new(270, v6.Position), 
            Vector2.new(360, v6.Position)
        };
        v7 = v5.makePolarCurve(v8, true, v6.PlotAbsoluteSize);
    elseif v6.Orientation == "Vertical" then
        local v9 = {
            Vector2.new(v6.Position, 0), 
            Vector2.new(v6.Position, 1)
        };
        v7 = v5.makePolarCurve(v9, true, v6.PlotAbsoluteSize);
    end;
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1)
    }, {
        Path = v2.createElement(v4, {
            ControlPoints = v7, 
            Tag = "GridLinePath2D"
        })
    });
end;