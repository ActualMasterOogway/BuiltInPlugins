local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v5 = require(l_Parent_0.PolarGridLabel);
local v6 = require(l_Parent_0.PolarGridLine);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v14(v8) --[[ Line: 27 ]] --[[ Name: makeGridLines ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy)
    local v9 = {};
    for v10 = 1, 16 do
        local v11 = v10 / 16 * 360;
        if v11 > 180 then
            v11 = v11 - 360;
        end;
        v9["GridLine_V_" .. v10] = v2.createElement(v6, {
            Position = v11, 
            PlotAbsoluteSize = v8, 
            Orientation = "Vertical"
        });
        v9["GridLabel_V_" .. v10] = v2.createElement(v5, {
            Position = Vector2.new(v11, 1), 
            OffsetDirection = Vector2.new(math.sin(v11 * 3.141592653589793 / 180), -math.cos(v11 * 3.141592653589793 / 180)), 
            PlotAbsoluteSize = v8, 
            Value = v11, 
            FormatString = "%.0f\194\176"
        });
    end;
    for v12 = 0, 5 do
        local v13 = v12 / 5;
        v9["GridLine_H_" .. v12] = v2.createElement(v6, {
            Position = v13, 
            PlotAbsoluteSize = v8, 
            Orientation = "Horizontal"
        });
        v9["GridLabel_H_" .. v12] = v2.createElement(v5, {
            Position = Vector2.new(90, v13), 
            OffsetDirection = Vector2.new(1, -1), 
            PlotAbsoluteSize = v8, 
            Value = v13, 
            FormatString = v13 % 1 > 0 and "%.1f" or "%.0f"
        });
    end;
    return v9;
end;
return function(v15) --[[ Line: 70 ]] --[[ Name: PolarGrid ]]
    -- upvalues: l_useMemo_0 (copy), v14 (copy), v2 (copy), l_Pane_0 (copy)
    local l_PlotAbsoluteSize_0 = v15.PlotAbsoluteSize;
    local v17 = l_useMemo_0(function() --[[ Line: 73 ]]
        -- upvalues: v14 (ref), l_PlotAbsoluteSize_0 (copy)
        return (v14(l_PlotAbsoluteSize_0));
    end, {
        v15.PlotAbsoluteSize
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Tag] = "Contrast"
    }, v17);
end;