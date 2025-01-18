local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v5 = require(l_Parent_0.Path2DWrapper);
local v6 = require(l_Parent_0.PlotRectUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v16(v8, v9, v10) --[[ Line: 24 ]] --[[ Name: makeMainCurve ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy)
    local v11 = {};
    local v12 = 0;
    for _, v14 in v8.keypoints do
        local v15 = v6.plotToAbsolutePosition(v14, v9, v10);
        table.insert(v11, Path2DControlPoint.new(UDim2.fromOffset(v15.X, v15.Y)));
        v12 = v12 + 1;
        if v14.X > v9.Max.X then
            break;
        end;
    end;
    return v2.createElement(v5, {
        ControlPoints = v11, 
        Tag = "CurveLinePath2D"
    });
end;
local function v24(v17, v18, v19) --[[ Line: 43 ]] --[[ Name: makeGhostCurves ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy)
    local v20 = {};
    local v21 = #v17.keypoints;
    if v21 > 0 then
        local v22 = v6.plotToAbsolutePosition(v17.keypoints[1], v18, v19);
        v20.EndLineLeft = v2.createElement(v5, {
            ControlPoints = {
                Path2DControlPoint.new(UDim2.fromOffset(0, v22.Y)), 
                Path2DControlPoint.new(UDim2.fromOffset(v22.X, v22.Y))
            }, 
            Tag = "EndLinePath2D"
        });
    end;
    if v21 > 0 then
        local v23 = v6.plotToAbsolutePosition(v17.keypoints[v21], v18, v19);
        v20.EndLineRight = v2.createElement(v5, {
            ControlPoints = {
                Path2DControlPoint.new(UDim2.fromOffset(v23.X, v23.Y)), 
                Path2DControlPoint.new(UDim2.fromOffset(v19.X, v23.Y))
            }, 
            Tag = "EndLinePath2D"
        });
    end;
    return v20;
end;
return function(v25) --[[ Line: 72 ]] --[[ Name: Curve ]]
    -- upvalues: l_useMemo_0 (copy), v24 (copy), v16 (copy), v2 (copy), l_Pane_0 (copy)
    local l_PlotAbsoluteSize_0 = v25.PlotAbsoluteSize;
    local l_CurveHook_0 = v25.CurveHook;
    local l_plotRect_0 = l_CurveHook_0.plotRect;
    assert(l_plotRect_0);
    local v30 = l_useMemo_0(function() --[[ Line: 78 ]]
        -- upvalues: v24 (ref), l_CurveHook_0 (copy), l_plotRect_0 (copy), l_PlotAbsoluteSize_0 (copy), v16 (ref)
        local v29 = v24(l_CurveHook_0, l_plotRect_0, l_PlotAbsoluteSize_0);
        v29.Curve = v16(l_CurveHook_0, l_plotRect_0, l_PlotAbsoluteSize_0);
        return v29;
    end, {
        l_CurveHook_0, 
        l_plotRect_0, 
        v25.PlotAbsoluteSize
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v30);
end;