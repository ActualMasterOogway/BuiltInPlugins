local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v4 = require(l_Parent_0.PlotRectUtil);
local v5 = require(l_Parent_0.Path2DWrapper);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v7) --[[ Line: 23 ]] --[[ Name: PolarCurve ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_Pane_0 (copy)
    local l_CurveHook_0 = v7.CurveHook;
    local v9 = v4.makePolarCurve(l_CurveHook_0.keypoints, false, v7.PlotAbsoluteSize);
    local v10 = v4.makePolarCurve(l_CurveHook_0.keypoints, true, v7.PlotAbsoluteSize);
    local v11 = {
        CurveLeft = v2.createElement(v5, {
            ControlPoints = v9, 
            Tag = "CurveLinePath2D"
        }), 
        CurveRight = v2.createElement(v5, {
            ControlPoints = v10, 
            Tag = "CurveLinePath2D"
        })
    };
    if #l_CurveHook_0.keypoints > 0 then
        local v12 = l_CurveHook_0.keypoints[1];
        local v13 = Vector2.new(-v12.X, v12.Y);
        local v14 = l_CurveHook_0.keypoints[#l_CurveHook_0.keypoints];
        local v15 = Vector2.new(360 - v14.X, v14.Y);
        v11.EndLine1 = v2.createElement(v5, {
            ControlPoints = v4.makePolarCurve({
                v13, 
                v12
            }, true, v7.PlotAbsoluteSize), 
            Tag = "EndLinePath2D"
        });
        v11.EndLine2 = v2.createElement(v5, {
            ControlPoints = v4.makePolarCurve({
                v14, 
                v15
            }, true, v7.PlotAbsoluteSize), 
            Tag = "EndLinePath2D"
        });
    end;
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v11);
end;