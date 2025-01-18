local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v5 = require(l_Parent_0.GridLabel);
local v6 = require(l_Parent_0.GridLine);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v8) --[[ Line: 20 ]] --[[ Name: Grid ]]
    -- upvalues: l_useMemo_0 (copy), v2 (copy), v6 (copy), v5 (copy), v7 (copy), l_Pane_0 (copy)
    local v14 = l_useMemo_0(function() --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v6 (ref), v8 (copy), v5 (ref), v7 (ref)
        local v9 = {};
        for v10 = -80, 30, 10 do
            local v11 = v10 % 30 == 0;
            v9["GridLine_V_" .. v10] = v2.createElement(v6, {
                Position = v10, 
                PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                Orientation = "Vertical", 
                Thickness = v11 and 2 or 1, 
                Alpha = v11 and 0.75 or 0.5, 
                Tag = "Grid"
            });
            if v11 then
                v9["GridLabel_V_" .. v10] = v2.createElement(v5, {
                    Position = Vector2.new(v10, v7.getYMin()), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Offset = 5, 
                    Label = string.format("%.0f", v10), 
                    PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                    Tag = "Grid"
                });
            end;
        end;
        for v12 = -80, 30, 10 do
            local v13 = v12 % 30 == 0;
            v9["GridLine_H_" .. v12] = v2.createElement(v6, {
                Position = v12, 
                PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                Orientation = "Horizontal", 
                Thickness = v13 and 2 or 1, 
                Alpha = v13 and 0.75 or 0.5, 
                Tag = "Grid"
            });
            if v13 then
                v9["GridLabel_H_" .. v12] = v2.createElement(v5, {
                    Position = Vector2.new(v7.getXMin(), v12), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Offset = 5, 
                    Label = string.format("%.0f", v12), 
                    PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                    Tag = "Grid"
                });
            end;
        end;
        return v9;
    end, {
        v8.PlotAbsoluteSize
    });
    return v2.createElement(l_Pane_0, {
        Active = true, 
        ZIndex = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v14);
end;