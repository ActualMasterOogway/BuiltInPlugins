local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_Parent_0.Path2DWrapper);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v8) --[[ Line: 23 ]] --[[ Name: EqCurve ]]
    -- upvalues: l_useMemo_0 (copy), v7 (copy), v6 (copy), v2 (copy), v5 (copy)
    local v9 = not v8.EqHook.bypass;
    local v34 = l_useMemo_0(function() --[[ Line: 26 ]]
        -- upvalues: v7 (ref), v8 (copy), v6 (ref)
        local v10 = {};
        local function _(v11, v12) --[[ Line: 29 ]] --[[ Name: toAbs ]]
            -- upvalues: v7 (ref), v8 (ref)
            return v7.plotToAbs(Vector2.new(v11, v12), v8.PlotAbsoluteSize);
        end;
        local function _(v14, v15, v16) --[[ Line: 33 ]] --[[ Name: addPoint ]]
            -- upvalues: v10 (copy), v6 (ref)
            table.insert(v10, v6.makeControlPoint(v14, v15, v16));
        end;
        local v18 = v7.getXMin();
        local l_lowGain_0 = v8.EqHook.lowGain;
        local v20 = v7.plotToAbs(Vector2.new(v18, l_lowGain_0), v8.PlotAbsoluteSize);
        l_lowGain_0 = v8.EqHook.lowThreshold / 1.5;
        local l_lowGain_1 = v8.EqHook.lowGain;
        v18 = v7.plotToAbs(Vector2.new(l_lowGain_0, l_lowGain_1), v8.PlotAbsoluteSize);
        l_lowGain_1 = v8.EqHook.lowThreshold * 1.5;
        local l_midGain_0 = v8.EqHook.midGain;
        l_lowGain_0 = v7.plotToAbs(Vector2.new(l_lowGain_1, l_midGain_0), v8.PlotAbsoluteSize);
        l_midGain_0 = v8.EqHook.highThreshold / 1.5;
        local l_midGain_1 = v8.EqHook.midGain;
        l_lowGain_1 = v7.plotToAbs(Vector2.new(l_midGain_0, l_midGain_1), v8.PlotAbsoluteSize);
        l_midGain_1 = v8.EqHook.highThreshold * 1.5;
        local l_highGain_0 = v8.EqHook.highGain;
        l_midGain_0 = v7.plotToAbs(Vector2.new(l_midGain_1, l_highGain_0), v8.PlotAbsoluteSize);
        l_highGain_0 = v7.getXMax();
        local l_highGain_1 = v8.EqHook.highGain;
        l_midGain_1 = v7.plotToAbs(Vector2.new(l_highGain_0, l_highGain_1), v8.PlotAbsoluteSize);
        l_highGain_0 = Vector2.new((l_lowGain_0.X - v18.X) / 2, 0);
        l_highGain_1 = Vector2.new(-(l_lowGain_0.X - v18.X) / 2, 0);
        local v26 = Vector2.new((l_midGain_0.X - l_lowGain_1.X) / 2, 0);
        local v27 = Vector2.new(-(l_midGain_0.X - l_lowGain_1.X) / 2, 0);
        if v20.X < v18.X then
            table.insert(v10, v6.makeControlPoint(v20, nil, nil));
        end;
        local v28 = Vector2.new(0, 0);
        table.insert(v10, v6.makeControlPoint(v18, v28, l_highGain_0));
        if l_lowGain_1.X < l_lowGain_0.X then
            v28 = (l_lowGain_0.X - l_lowGain_1.X) / (l_lowGain_0.X - v18.X);
            local v29 = (v18 + l_midGain_0) / 2;
            local v30 = 0.25 * (l_midGain_0 + v27 - v29);
            local v31 = Vector2.new(v29.X, l_lowGain_0.Y) * (1 - v28) + v29 * v28;
            local v32 = v26 * (1 - v28) + v30 * v28;
            local v33 = -v32;
            table.insert(v10, v6.makeControlPoint(v31, v33, v32));
        else
            v28 = Vector2.new(0, 0);
            table.insert(v10, v6.makeControlPoint(l_lowGain_0, l_highGain_1, v28));
            v28 = Vector2.new(0, 0);
            table.insert(v10, v6.makeControlPoint(l_lowGain_1, v28, v26));
        end;
        v28 = Vector2.new(0, 0);
        table.insert(v10, v6.makeControlPoint(l_midGain_0, v27, v28));
        if l_midGain_1.X > l_midGain_0.X then
            table.insert(v10, v6.makeControlPoint(l_midGain_1, nil, nil));
        end;
        return v10;
    end, {
        v8.EqHook, 
        v8.PlotAbsoluteSize
    });
    return v2.createElement("CanvasGroup", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Curve = v2.createElement(v5, {
            ControlPoints = v34, 
            Tag = v9 and "FullCurve" or "FullCurveDisabled"
        })
    });
end;