local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_Parent_0.GridLine);
local v7 = require(l_Parent_0.Path2DWrapper);
local v8 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local function _(v9, v10, v11) --[[ Line: 30 ]] --[[ Name: addPoint ]]
    -- upvalues: v8 (copy)
    local v12 = v8.plotToAbs(v10, v11);
    table.insert(v9, Path2DControlPoint.new(UDim2.fromOffset(v12.X, v12.Y)));
end;
return function(v14) --[[ Line: 35 ]] --[[ Name: CompressorHandles ]]
    -- upvalues: l_useMemo_0 (copy), v8 (copy), v2 (copy), v7 (copy), v6 (copy), l_Pane_0 (copy)
    local v15 = not v14.DataHook.bypass;
    local v24 = l_useMemo_0(function() --[[ Line: 38 ]]
        -- upvalues: v15 (copy), v14 (copy), v8 (ref), v2 (ref), v7 (ref), v6 (ref)
        local v16 = {};
        if not v15 then
            return v16;
        else
            local v17 = {};
            local v18 = Vector2.new(-80, -80);
            local l_PlotAbsoluteSize_0 = v14.PlotAbsoluteSize;
            local v20 = v8.plotToAbs(v18, l_PlotAbsoluteSize_0);
            table.insert(v17, Path2DControlPoint.new(UDim2.fromOffset(v20.X, v20.Y)));
            v18 = Vector2.new(30, 30);
            l_PlotAbsoluteSize_0 = v14.PlotAbsoluteSize;
            v20 = v8.plotToAbs(v18, l_PlotAbsoluteSize_0);
            table.insert(v17, Path2DControlPoint.new(UDim2.fromOffset(v20.X, v20.Y)));
            v16.Diagonal = v2.createElement(v7, {
                ControlPoints = v17, 
                Tag = "GridCurve"
            });
            if v14.ActiveControl == "Threshold" then
                v16["Control_" .. "Threshold"] = v2.createElement(v6, {
                    Orientation = "Horizontal", 
                    Position = v14.DataHook.threshold, 
                    PlotAbsoluteSize = v14.PlotAbsoluteSize, 
                    Thickness = 1, 
                    Tag = "ControlLine"
                });
            end;
            if v14.ActiveControl == "Ratio" then
                v18 = v14.DataHook.threshold;
                l_PlotAbsoluteSize_0 = v14.DataHook.ratio;
                v20 = {};
                local v21 = Vector2.new(v18, v18);
                local l_PlotAbsoluteSize_1 = v14.PlotAbsoluteSize;
                local v23 = v8.plotToAbs(v21, l_PlotAbsoluteSize_1);
                table.insert(v20, Path2DControlPoint.new(UDim2.fromOffset(v23.X, v23.Y)));
                v21 = Vector2.new(30, v18 + (30 - v18) / l_PlotAbsoluteSize_0);
                l_PlotAbsoluteSize_1 = v14.PlotAbsoluteSize;
                v23 = v8.plotToAbs(v21, l_PlotAbsoluteSize_1);
                table.insert(v20, Path2DControlPoint.new(UDim2.fromOffset(v23.X, v23.Y)));
                v16["Control_" .. "Ratio"] = v2.createElement(v7, {
                    ControlPoints = v20, 
                    Tag = "GuideCurve"
                });
            end;
            if v14.ActiveControl == "MakeupGain" then
                v16["Control_" .. "MakeupGain"] = v2.createElement(v6, {
                    Orientation = "Horizontal", 
                    Position = v14.DataHook.makeupGain, 
                    PlotAbsoluteSize = v14.PlotAbsoluteSize, 
                    Thickness = 1, 
                    Tag = "ControlLine"
                });
            end;
            return v16;
        end;
    end, {
        v14.DataHook, 
        v14.ActiveControl, 
        v14.PlotAbsoluteSize
    });
    return v15 and v2.createElement(l_Pane_0, {
        Active = true, 
        ZIndex = 3, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v24);
end;