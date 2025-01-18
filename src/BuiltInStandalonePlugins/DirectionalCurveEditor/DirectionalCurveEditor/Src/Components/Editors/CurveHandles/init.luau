local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v7 = require(l_Parent_0.ControlPoint);
local v8 = require(l_script_FirstAncestor_0.Src.Components.CurveRenderer.PlotRectUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v10) --[[ Line: 26 ]] --[[ Name: CurveHandles ]]
    -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), v8 (copy), l_useMemo_0 (copy), v2 (copy), v7 (copy), l_Pane_0 (copy)
    local l_CurveHook_0 = v10.CurveHook;
    local l_PlotRef_0 = v10.PlotRef;
    local l_plotRect_0 = l_CurveHook_0.plotRect;
    assert(l_plotRect_0);
    local v14, v15 = l_useState_0(false);
    local v17 = l_useCallback_0(function(v16) --[[ Line: 34 ]]
        -- upvalues: v14 (copy), l_CurveHook_0 (copy)
        if v14 then
            return;
        else
            l_CurveHook_0.select(v16);
            return;
        end;
    end, {
        l_CurveHook_0, 
        v14
    });
    local v18 = l_useCallback_0(function() --[[ Line: 42 ]]
        -- upvalues: v15 (copy)
        v15(true);
    end, {
        v15
    });
    local v20 = l_useCallback_0(function(v19) --[[ Line: 46 ]]
        -- upvalues: l_CurveHook_0 (copy)
        l_CurveHook_0.update(v19, false);
    end, {
        l_PlotRef_0, 
        l_plotRect_0, 
        l_CurveHook_0
    });
    local v22 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: l_CurveHook_0 (copy), v15 (copy)
        local v21 = l_CurveHook_0.getSelectedKeypoint();
        if v21 then
            l_CurveHook_0.update(v21, true);
        end;
        v15(false);
    end, {
        v10, 
        l_CurveHook_0
    });
    local v26 = l_useCallback_0(function(v23) --[[ Line: 58 ]]
        -- upvalues: l_PlotRef_0 (copy), v8 (ref), l_plotRect_0 (copy), l_CurveHook_0 (copy), v15 (copy)
        if not l_PlotRef_0.current then
            return;
        else
            if v23.UserInputType == Enum.UserInputType.MouseButton1 then
                local v24 = Vector2.new(v23.Position.X, v23.Position.Y);
                local v25 = v8.mouseCoordsToPlotPosition(v24, l_plotRect_0, l_PlotRef_0.current);
                if l_CurveHook_0.add(v25) then
                    v15(true);
                end;
            end;
            return;
        end;
    end, {
        l_PlotRef_0, 
        l_plotRect_0, 
        l_CurveHook_0
    });
    local v27 = l_useCallback_0(function() --[[ Line: 74 ]]
        -- upvalues: v15 (copy), l_CurveHook_0 (copy)
        v15(false);
        l_CurveHook_0.remove();
        l_CurveHook_0.select(-1);
    end, {
        v10, 
        l_CurveHook_0
    });
    local v33 = l_useMemo_0(function() --[[ Line: 80 ]]
        -- upvalues: l_CurveHook_0 (copy), v2 (ref), v7 (ref), l_plotRect_0 (copy), l_PlotRef_0 (copy), v14 (copy), v17 (copy), v18 (copy), v20 (copy), v22 (copy), v27 (copy)
        local v28 = {};
        for v29, v30 in l_CurveHook_0.keypoints do
            local v31 = "Keypoint_" .. v29;
            local v32 = v29 == l_CurveHook_0.selectedIndex;
            v28[v31] = v2.createElement(v7, {
                Position = v30, 
                PlotRect = l_plotRect_0, 
                PlotRef = l_PlotRef_0, 
                IsSelected = v32, 
                IsDragging = v14 and v32, 
                OnHoverStart = function() --[[ Line: 94 ]] --[[ Name: OnHoverStart ]]
                    -- upvalues: v17 (ref), v29 (copy)
                    v17(v29);
                end, 
                OnDragStart = v18, 
                OnMoved = v20, 
                OnDragEnd = v22, 
                OnRightClick = v27
            });
        end;
        return v28;
    end, {
        l_CurveHook_0, 
        l_plotRect_0, 
        v14
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 10, 
        [v2.Event.InputBegan] = function(_, v35) --[[ Line: 110 ]]
            -- upvalues: v26 (copy)
            if v35.UserInputType == Enum.UserInputType.MouseButton1 then
                v26(v35);
            end;
        end
    }, v33);
end;