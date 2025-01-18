local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_Parent_0.Path2DWrapper);
local v6 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local function v10(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: makeControlPoint ]]
    if not v7 then
        return Path2DControlPoint.new();
    elseif not v8 or not v9 then
        return Path2DControlPoint.new(UDim2.fromOffset(v7.X, v7.Y));
    else
        return Path2DControlPoint.new(UDim2.fromOffset(v7.X, v7.Y), UDim2.fromOffset(v8.X, v8.Y), UDim2.fromOffset(v9.X, v9.Y));
    end;
end;
return function(v11) --[[ Line: 35 ]] --[[ Name: CompressorCurve ]]
    -- upvalues: l_useMemo_0 (copy), v10 (copy), v6 (copy), v2 (copy), v5 (copy)
    local v12 = not v11.DataHook.bypass;
    local v18 = l_useMemo_0(function() --[[ Line: 38 ]]
        -- upvalues: v10 (ref), v6 (ref), v11 (copy)
        local v13 = {};
        local function _(v14) --[[ Line: 41 ]] --[[ Name: addPoint ]]
            -- upvalues: v13 (copy), v10 (ref), v6 (ref), v11 (ref)
            table.insert(v13, v10(v6.plotToAbs(v14, v11.PlotAbsoluteSize)));
        end;
        local v16 = Vector2.new(0, v11.DataHook.makeupGain);
        local v17 = Vector2.new(-80, -80) + v16;
        table.insert(v13, v10(v6.plotToAbs(v17, v11.PlotAbsoluteSize)));
        v17 = Vector2.new(v11.DataHook.threshold, v11.DataHook.threshold) + v16;
        table.insert(v13, v10(v6.plotToAbs(v17, v11.PlotAbsoluteSize)));
        v17 = Vector2.new(v11.DataHook.threshold, v11.DataHook.threshold) + v16 + Vector2.new(30 - v11.DataHook.threshold, (30 - v11.DataHook.threshold) / v11.DataHook.ratio);
        table.insert(v13, v10(v6.plotToAbs(v17, v11.PlotAbsoluteSize)));
        return v13;
    end, {
        v11.DataHook, 
        v11.PlotAbsoluteSize
    });
    return v11.Enabled and v2.createElement("CanvasGroup", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = 4
    }, {
        Curve = v2.createElement(v5, {
            ControlPoints = v18, 
            Tag = v12 and "Curve" or "CurveDisabled"
        })
    });
end;