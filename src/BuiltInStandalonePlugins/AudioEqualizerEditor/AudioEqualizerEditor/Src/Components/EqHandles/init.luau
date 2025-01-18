local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_Parent_0.ControlPoint);
local v9 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v10) --[[ Line: 32 ]] --[[ Name: EqHandles ]]
    -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), l_useMemo_0 (copy), v2 (copy), v8 (copy), v9 (copy), l_Pane_0 (copy)
    local v11 = not v10.EqHook.bypass;
    local v12, v13 = l_useState_0(0);
    local v14, v15 = l_useState_0("");
    local v17 = l_useCallback_0(function(v16) --[[ Line: 37 ]]
        -- upvalues: v15 (copy)
        v15(v16);
    end, {});
    local v18 = l_useCallback_0(function() --[[ Line: 41 ]]
        -- upvalues: v15 (copy)
        v15("");
    end, {});
    local v26 = l_useMemo_0(function() --[[ Line: 46 ]]
        -- upvalues: v11 (copy), v2 (ref), v8 (ref), v10 (copy), v14 (copy), v17 (copy), v9 (ref), v18 (copy), v13 (copy), v12 (copy)
        local v19 = {};
        if not v11 then
            return v19;
        else
            v19["Control_" .. "L"] = v2.createElement(v8, {
                Position = Vector2.new(v10.EqHook.lowThreshold, v10.EqHook.lowGain), 
                Label = "L", 
                DragTarget = v14, 
                OnDragStart = v17, 
                OnMoved = function(v20) --[[ Line: 57 ]] --[[ Name: OnMoved ]]
                    -- upvalues: v10 (ref), v9 (ref)
                    if not v10.PlotRef.current then
                        return;
                    else
                        v20 = v9.mouseToPlot(v20, v10.PlotRef.current);
                        v10.EqHook.setLowGain(v20.Y);
                        v10.EqHook.setLowThreshold(v20.X);
                        return;
                    end;
                end, 
                OnDragEnd = v18
            });
            v19["Control_" .. "M"] = v2.createElement(v8, {
                Position = Vector2.new(math.sqrt(v10.EqHook.lowThreshold * v10.EqHook.highThreshold), v10.EqHook.midGain), 
                Label = "M", 
                DragTarget = v14, 
                OnDragStart = function(v21) --[[ Line: 76 ]] --[[ Name: OnDragStart ]]
                    -- upvalues: v13 (ref), v10 (ref), v17 (ref)
                    v13((math.sqrt(v10.EqHook.highThreshold / v10.EqHook.lowThreshold)));
                    v17(v21);
                end, 
                OnMoved = function(v22) --[[ Line: 80 ]] --[[ Name: OnMoved ]]
                    -- upvalues: v10 (ref), v9 (ref), v12 (ref)
                    if not v10.PlotRef.current then
                        return;
                    else
                        v22 = v9.mouseToPlot(v22, v10.PlotRef.current);
                        v10.EqHook.setMidGain(v22.Y);
                        local v23 = v22.X / v12;
                        local v24 = v22.X * v12;
                        v10.EqHook.setLowThreshold(v23);
                        v10.EqHook.setHighThreshold(v24);
                        return;
                    end;
                end, 
                OnDragEnd = v18
            });
            v19["Control_" .. "H"] = v2.createElement(v8, {
                Position = Vector2.new(v10.EqHook.highThreshold, v10.EqHook.highGain), 
                Label = "H", 
                DragTarget = v14, 
                OnDragStart = v17, 
                OnMoved = function(v25) --[[ Line: 100 ]] --[[ Name: OnMoved ]]
                    -- upvalues: v10 (ref), v9 (ref)
                    if not v10.PlotRef.current then
                        return;
                    else
                        v25 = v9.mouseToPlot(v25, v10.PlotRef.current);
                        v10.EqHook.setHighGain(v25.Y);
                        v10.EqHook.setHighThreshold(v25.X);
                        return;
                    end;
                end, 
                OnDragEnd = v18
            });
            return v19;
        end;
    end, {
        v10.EqHook, 
        v10.PlotAbsoluteSize, 
        v10.PlotRef, 
        v14, 
        v17, 
        v18
    });
    return v11 and v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v26);
end;