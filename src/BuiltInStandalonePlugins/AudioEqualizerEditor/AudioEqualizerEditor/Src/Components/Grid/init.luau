local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_Parent_0.GridLine);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v8) --[[ Line: 25 ]] --[[ Name: Grid ]]
    -- upvalues: l_useMemo_0 (copy), v7 (copy), v2 (copy), v6 (copy), v5 (copy), l_Pane_0 (copy)
    local v21 = l_useMemo_0(function() --[[ Line: 26 ]]
        -- upvalues: v7 (ref), v2 (ref), v6 (ref), v8 (copy), v5 (ref)
        local v9 = {};
        for v10 = 1, 4 do
            for v11 = 1, 9 do
                local v12 = v11 * 10 ^ v10;
                if v12 >= v7.getXMin() and v7.getXMax() >= v12 then
                    local v13 = "GridLine_V_" .. v12;
                    local l_createElement_0 = v2.createElement;
                    local l_v6_0 = v6;
                    local v16 = {
                        Position = v12, 
                        PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                        PlotFramePadding = 50, 
                        Orientation = "Vertical"
                    };
                    local v17 = true;
                    if v11 ~= 1 then
                        v17 = true;
                        if v12 ~= v7.getXMin() then
                            v17 = v12 == v7.getXMax();
                        end;
                    end;
                    v16.IsMinor = not v17;
                    v9[v13] = l_createElement_0(l_v6_0, v16);
                end;
            end;
        end;
        v9["GridLine_V_" .. v7.getXMin()] = v2.createElement(v6, {
            Position = v7.getXMin(), 
            PlotAbsoluteSize = v8.PlotAbsoluteSize, 
            PlotFramePadding = 50, 
            Orientation = "Vertical"
        });
        v9["GridLine_V_" .. v7.getXMax()] = v2.createElement(v6, {
            Position = v7.getXMax(), 
            PlotAbsoluteSize = v8.PlotAbsoluteSize, 
            PlotFramePadding = 50, 
            Orientation = "Vertical"
        });
        local v18 = {};
        if v8.InstanceType == v5.EQUALIZER then
            v18 = {
                -80, 
                -40, 
                -20, 
                -10, 
                0, 
                5, 
                10
            };
        elseif v8.InstanceType == v5.FILTER then
            v18 = {
                -30, 
                -20, 
                -10, 
                0, 
                10, 
                20, 
                30
            };
        end;
        for _, v20 in v18 do
            v9["GridLine_H_" .. v20] = v2.createElement(v6, {
                Position = v20, 
                PlotAbsoluteSize = v8.PlotAbsoluteSize, 
                PlotFramePadding = 50, 
                Orientation = "Horizontal"
            });
        end;
        return v9;
    end, {
        v8.InstanceType, 
        v8.PlotAbsoluteSize
    });
    return v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v21);
end;