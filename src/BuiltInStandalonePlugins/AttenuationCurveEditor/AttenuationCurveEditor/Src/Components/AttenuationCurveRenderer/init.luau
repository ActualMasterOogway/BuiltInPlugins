local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v8 = require(l_Parent_0.useCurve);
local v9 = require(l_Parent_0.CurveRenderer.CurvePlot);
local v10 = require(l_Parent_0.KeypointControls);
local v11 = require(l_Parent_0.Scrollbar);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
local v14 = Vector2.new(540, 300);
local v15 = Vector2.new(2000, 2000);
local v16 = NumberRange.new(0, 100);
return function(v17) --[[ Line: 39 ]] --[[ Name: AttenuationCurveRenderer ]]
    -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), v13 (copy), v8 (copy), l_useEffect_0 (copy), v16 (copy), l_useMemo_0 (copy), v2 (copy), l_Pane_0 (copy), v14 (copy), v15 (copy), v9 (copy), v11 (copy), v10 (copy)
    local v18, v19 = l_useState_0(Vector2.one);
    local v21 = l_useCallback_0(function(v20) --[[ Line: 42 ]]
        -- upvalues: v17 (copy), v13 (ref)
        v17.OnChanged(v13.curveToTable(v20));
    end, {
        v17.OnChanged
    });
    local v22 = v8(v13.tableToCurve(v17.CurveData), v21);
    l_useEffect_0(function() --[[ Line: 49 ]]
        -- upvalues: v22 (copy), v13 (ref), v17 (copy)
        v22.reset(v13.tableToCurve(v17.CurveData));
    end, {
        v17.CurveData
    });
    local v23, v24 = l_useState_0(v16);
    l_useEffect_0(function() --[[ Line: 56 ]]
        -- upvalues: v13 (ref), v17 (copy), v16 (ref), v24 (copy), v22 (copy)
        local l_Keypoints_0 = v13.tableToCurve(v17.CurveData).Keypoints;
        local l_Max_0 = v16.Max;
        if #l_Keypoints_0 > 0 then
            l_Max_0 = math.max(v16.Max, l_Keypoints_0[#l_Keypoints_0].X * 1.33);
        end;
        v24(NumberRange.new(0, l_Max_0));
        v22.select(1);
    end, {
        v17.InstanceId
    });
    local v28 = l_useMemo_0(function() --[[ Line: 71 ]]
        -- upvalues: v22 (copy), v16 (ref)
        local v27 = #v22.keypoints;
        if v27 > 0 then
            return (math.max(v16.Max, v22.keypoints[v27].X * 1.33));
        else
            return v16.Max;
        end;
    end, {
        v22.keypoints
    });
    local v30 = l_useCallback_0(function(v29) --[[ Line: 80 ]]
        -- upvalues: v19 (copy)
        if v29 then
            v19(v29.AbsoluteSize);
        end;
    end, {
        v19
    });
    local v31 = l_useCallback_0(function() --[[ Line: 86 ]]
        -- upvalues: v22 (copy)
        v22.remove();
    end, {
        v22
    });
    local v33 = l_useCallback_0(function(v32) --[[ Line: 90 ]]
        -- upvalues: v22 (copy)
        v22.update(v32, true);
    end, {
        v22
    });
    return v17.Enabled and v2.createElement(l_Pane_0, {
        [v2.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MinSize = v14, 
            MaxSize = v15
        }), 
        Canvas = v2.createElement(l_Pane_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -60)
        }, {
            Plot = v2.createElement(v9, {
                CurveHook = v22, 
                PlotAbsoluteSize = v18, 
                XRange = v23, 
                SetXRange = v24, 
                OnSizeChanged = v30
            }), 
            Scrollbar = v2.createElement(v11, {
                XRange = v23, 
                SetXRange = v24, 
                DefaultXMax = v28
            })
        }), 
        KeypointControls = v2.createElement(v10, {
            Keypoint = v22.getSelectedKeypoint(), 
            OnEdit = v33, 
            OnDelete = v31
        })
    });
end;