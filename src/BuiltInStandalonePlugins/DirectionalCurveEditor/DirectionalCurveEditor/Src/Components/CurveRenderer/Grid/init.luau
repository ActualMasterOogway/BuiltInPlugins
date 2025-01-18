local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v6 = require(l_Parent_0.GridLabel);
local v7 = require(l_Parent_0.GridLine);
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local function v20(v9, v10) --[[ Line: 33 ]] --[[ Name: makeGridLines ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy)
    local v11 = {};
    local v12 = math.log10(v9.Width) - 0.3010299956639812;
    local v13 = 10 ^ math.floor(v12);
    local v14 = v13 / 10;
    for v15 = v9.Min.X - v9.Min.X % v13, v9.Max.X - v9.Max.X % v13, v13 do
        v11["GridLine_V_" .. v15] = v2.createElement(v7, {
            Position = v15, 
            PlotRect = v9, 
            PlotAbsoluteSize = v10, 
            PlotFramePadding = 0, 
            Orientation = "Vertical"
        });
        v11["GridLabel_V_" .. v15] = v2.createElement(v6, {
            Position = Vector2.new(v15, v9.Min.Y), 
            OffsetDirection = Vector2.new(0, 1), 
            PlotRect = v9, 
            PlotAbsoluteSize = v10, 
            Value = v15, 
            FormatString = v15 % 1 > 0 and "%.1f" or "%.0f"
        });
        local v16 = math.clamp(1 - (v12 - math.floor(v12)) / 0.39794000867203766, 0, 1);
        if v16 > 0 then
            for v17 = 1, 9 do
                local v18 = v15 + v14 * v17;
                v11["GridLine_Inner_V_" .. v18] = v2.createElement(v7, {
                    Position = v18, 
                    PlotRect = v9, 
                    PlotAbsoluteSize = v10, 
                    PlotFramePadding = 0, 
                    Orientation = "Vertical", 
                    InnerAlpha = v16
                });
            end;
        end;
    end;
    for v19 = v9.Min.Y, v9.Max.Y, v9.Height / 5 do
        v11["GridLine_H_" .. v19] = v2.createElement(v7, {
            Position = v19, 
            PlotRect = v9, 
            PlotAbsoluteSize = v10, 
            PlotFramePadding = 0, 
            Orientation = "Horizontal"
        });
        v11["GridLabel_H_" .. v19] = v2.createElement(v6, {
            Position = Vector2.new(v9.Min.X, v19), 
            OffsetDirection = Vector2.new(-1, 0), 
            PlotRect = v9, 
            PlotAbsoluteSize = v10, 
            Value = v19, 
            FormatString = v19 % 1 > 0 and "%.1f" or "%.0f"
        });
    end;
    return v11;
end;
return function(v21) --[[ Line: 103 ]] --[[ Name: Grid ]]
    -- upvalues: l_useCallback_0 (copy), v8 (copy), l_useMemo_0 (copy), v20 (copy), v2 (copy), l_Pane_0 (copy)
    local l_PlotAbsoluteSize_0 = v21.PlotAbsoluteSize;
    local l_CurveHook_0 = v21.CurveHook;
    local l_plotRect_0 = l_CurveHook_0.plotRect;
    assert(l_plotRect_0);
    local v27 = l_useCallback_0(function(v25) --[[ Line: 109 ]]
        -- upvalues: v21 (copy), v8 (ref), l_plotRect_0 (copy), l_CurveHook_0 (copy)
        if v21.PropertyType == v8.DISTANCE then
            local v26 = math.clamp(l_plotRect_0.Max.X * 1.15 ^ v25, 1, 180);
            assert(l_CurveHook_0.setPlotRect);
            l_CurveHook_0.setPlotRect(Rect.new(l_plotRect_0.Min, Vector2.new(v26, l_plotRect_0.Max.Y)));
        end;
    end, {
        l_plotRect_0
    });
    local v28 = l_useMemo_0(function() --[[ Line: 119 ]]
        -- upvalues: v20 (ref), l_plotRect_0 (copy), l_PlotAbsoluteSize_0 (copy)
        return (v20(l_plotRect_0, l_PlotAbsoluteSize_0));
    end, {
        v21.PlotAbsoluteSize, 
        l_plotRect_0
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Tag] = "Contrast", 
        [v2.Event.InputChanged] = function(_, v30) --[[ Line: 127 ]]
            -- upvalues: v27 (copy)
            if v30.UserInputType == Enum.UserInputType.MouseWheel then
                v27(v30.Position.Z);
            end;
        end
    }, v28);
end;