local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_useRef_0 = v2.useRef;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v8 = require(l_Parent_0.GridLine);
local v9 = require(l_Parent_0.Keypoint);
local v10 = require(l_Parent_0.Path2DWrapper);
local v11 = require(l_Parent_0.PlotRectUtil);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v24(v13, v14) --[[ Line: 42 ]] --[[ Name: makeGridLines ]]
    -- upvalues: v2 (copy), v8 (copy)
    local v15 = {};
    local v16 = math.log10(v13.Width) - 0.3010299956639812;
    local v17 = 10 ^ math.floor(v16);
    local v18 = v17 / 10;
    for v19 = v13.Min.X - v13.Min.X % v17, v13.Max.X - v13.Max.X % v17 + v17 / 2, v17 do
        v15["GridLine_V_" .. v19] = v2.createElement(v8, {
            Position = v19, 
            PlotRect = v13, 
            PlotAbsoluteSize = v14, 
            PlotFramePadding = 50, 
            Orientation = "Vertical"
        });
        local v20 = math.clamp(1 - (v16 - math.floor(v16)) / 0.39794000867203766, 0, 1);
        if v20 > 0 then
            for v21 = 1, 9 do
                local v22 = v19 + v18 * v21;
                v15["GridLine_Inner_V_" .. v22] = v2.createElement(v8, {
                    Position = v22, 
                    PlotRect = v13, 
                    PlotAbsoluteSize = v14, 
                    PlotFramePadding = 50, 
                    Orientation = "Vertical", 
                    InnerAlpha = v20
                });
            end;
        end;
    end;
    for v23 = v13.Min.Y, v13.Max.Y, v13.Height / 5 do
        v15["GridLine_H_" .. v23] = v2.createElement(v8, {
            Position = v23, 
            PlotRect = v13, 
            PlotAbsoluteSize = v14, 
            PlotFramePadding = 50, 
            Orientation = "Horizontal"
        });
    end;
    return v15;
end;
local function v33(v25, v26, v27) --[[ Line: 102 ]] --[[ Name: makeMainCurve ]]
    -- upvalues: v11 (copy), v2 (copy), v10 (copy)
    local v28 = {};
    local v29 = 0;
    for _, v31 in v25.keypoints do
        local v32 = v11.plotToAbsolutePosition(v31, v26, v27);
        table.insert(v28, Path2DControlPoint.new(UDim2.fromOffset(v32.X, v32.Y)));
        v29 = v29 + 1;
        if v31.X > v26.Max.X then
            break;
        end;
    end;
    return v2.createElement(v10, {
        ControlPoints = v28, 
        Tag = "CurveLinePath2D"
    });
end;
local function v47(v34, v35, v36, v37) --[[ Line: 121 ]] --[[ Name: makeGhostCurves ]]
    -- upvalues: v11 (copy), v2 (copy), v10 (copy)
    local v38 = {};
    local v39 = #v34.keypoints;
    if v37 then
        local v40 = {};
        local v41 = v11.absoluteToPlotPosition(v37, v35, v36);
        local v42 = v34.getIndexForPoint(v41);
        local v43 = Vector2.new(0, v37.Y);
        if v42 > 1 then
            v43 = v11.plotToAbsolutePosition(v34.keypoints[v42 - 1], v35, v36);
        end;
        local v44 = Vector2.new(v36.X, v37.Y);
        if v42 <= v39 then
            v44 = v11.plotToAbsolutePosition(v34.keypoints[v42], v35, v36);
        end;
        table.insert(v40, Path2DControlPoint.new(UDim2.fromOffset(v43.X, v43.Y)));
        table.insert(v40, Path2DControlPoint.new(UDim2.fromOffset(v37.X, v37.Y)));
        table.insert(v40, Path2DControlPoint.new(UDim2.fromOffset(v44.X, v44.Y)));
        v38.GhostCurve = v2.createElement(v10, {
            ControlPoints = v40, 
            Tag = "GhostLinePath2D"
        });
    end;
    if v39 > 0 then
        local v45 = v11.plotToAbsolutePosition(v34.keypoints[1], v35, v36);
        v38.EndLineLeft = v2.createElement(v10, {
            ControlPoints = {
                Path2DControlPoint.new(UDim2.fromOffset(0, v45.Y)), 
                Path2DControlPoint.new(UDim2.fromOffset(v45.X, v45.Y))
            }, 
            Tag = "GhostLinePath2D"
        });
    end;
    if v39 > 0 then
        local v46 = v11.plotToAbsolutePosition(v34.keypoints[v39], v35, v36);
        v38.EndLineRight = v2.createElement(v10, {
            ControlPoints = {
                Path2DControlPoint.new(UDim2.fromOffset(v46.X, v46.Y)), 
                Path2DControlPoint.new(UDim2.fromOffset(v36.X, v46.Y))
            }, 
            Tag = "GhostLinePath2D"
        });
    end;
    return v38;
end;
return function(v48) --[[ Line: 183 ]] --[[ Name: CurvePlot ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_useMemo_0 (copy), l_useCallback_0 (copy), v11 (copy), v24 (copy), v47 (copy), v33 (copy), v2 (copy), v9 (copy), l_Pane_0 (copy)
    local v49 = l_useRef_0(nil);
    local l_PlotAbsoluteSize_0 = v48.PlotAbsoluteSize;
    local l_CurveHook_0 = v48.CurveHook;
    local v52, v53 = l_useState_0(Vector2.new(-1, -1));
    local v54, v55 = l_useState_0(false);
    local v56, v57 = l_useState_0(false);
    local v58, v59 = l_useState_0(false);
    local v60 = l_useMemo_0(function() --[[ Line: 194 ]]
        -- upvalues: v48 (copy)
        return Rect.new(v48.XRange.Min, 0, v48.XRange.Max, 1);
    end, {
        v48.XRange
    });
    local v62 = l_useCallback_0(function(v61) --[[ Line: 198 ]]
        -- upvalues: v58 (copy), l_CurveHook_0 (copy), v57 (copy)
        if v58 then
            return;
        else
            l_CurveHook_0.select(v61);
            v57(true);
            return;
        end;
    end, {
        l_CurveHook_0, 
        v58, 
        v57
    });
    local v64 = l_useCallback_0(function(_) --[[ Line: 207 ]]
        -- upvalues: v57 (copy)
        v57(false);
    end, {
        v57
    });
    local v65 = l_useCallback_0(function() --[[ Line: 211 ]]
        -- upvalues: v59 (copy)
        v59(true);
    end, {});
    local v68 = l_useCallback_0(function(v66) --[[ Line: 215 ]]
        -- upvalues: v49 (copy), v11 (ref), v60 (copy), l_CurveHook_0 (copy)
        if not v49.current then
            return;
        else
            local v67 = v11.mouseCoordsToPlotPosition(v66, v60, v49.current);
            v67 = Vector2.new(math.clamp(v67.X, v60.Min.X, v60.Max.X), (math.clamp(v67.Y, v60.Min.Y, v60.Max.Y)));
            l_CurveHook_0.update(v67, false);
            return;
        end;
    end, {
        v49, 
        v60, 
        l_CurveHook_0
    });
    local v70 = l_useCallback_0(function() --[[ Line: 228 ]]
        -- upvalues: l_CurveHook_0 (copy), v59 (copy), v48 (copy)
        local v69 = l_CurveHook_0.getSelectedKeypoint();
        if v69 then
            l_CurveHook_0.update(v69, true);
        end;
        v59(false);
        if v48.OnChanged then
            v48.OnChanged();
        end;
    end, {
        v48, 
        l_CurveHook_0
    });
    local v71 = l_useCallback_0(function() --[[ Line: 241 ]]
        -- upvalues: v55 (copy)
        v55(true);
    end, {
        v55
    });
    local v72 = l_useCallback_0(function() --[[ Line: 245 ]]
        -- upvalues: v55 (copy)
        v55(false);
    end, {
        v55
    });
    local v75 = l_useCallback_0(function(v73) --[[ Line: 249 ]]
        -- upvalues: v49 (copy), v53 (copy)
        if not v49.current then
            return;
        else
            assert(v49.current, "plotRef.current was nil");
            local v74 = Vector2.new(v73.Position.X, v73.Position.Y) - v49.current.AbsolutePosition;
            v53(v74);
            return;
        end;
    end, {
        v49, 
        v60, 
        v53
    });
    local v79 = l_useCallback_0(function(v76) --[[ Line: 260 ]]
        -- upvalues: v49 (copy), v11 (ref), v60 (copy), l_CurveHook_0 (copy), v59 (copy)
        if not v49.current then
            return;
        else
            local v77 = Vector2.new(v76.Position.X, v76.Position.Y);
            local v78 = v11.mouseCoordsToPlotPosition(v77, v60, v49.current);
            if l_CurveHook_0.add(v78) then
                v59(true);
            end;
            return;
        end;
    end, {
        v49, 
        v60, 
        l_CurveHook_0
    });
    local v80 = l_useCallback_0(function() --[[ Line: 274 ]]
        -- upvalues: v59 (copy), l_CurveHook_0 (copy), v48 (copy)
        v59(false);
        l_CurveHook_0.remove();
        l_CurveHook_0.select(-1);
        if v48.OnChanged then
            v48.OnChanged();
        end;
    end, {
        v48, 
        l_CurveHook_0
    });
    local v88 = l_useCallback_0(function(v81) --[[ Line: 284 ]]
        -- upvalues: v48 (copy), v52 (copy), l_PlotAbsoluteSize_0 (copy)
        local v82 = v48.XRange.Max - v48.XRange.Min;
        local v83 = math.clamp(v82 * 1.15 ^ v81, 1, 4294967296);
        local v84 = v52.X / l_PlotAbsoluteSize_0.X;
        local v85 = v48.XRange.Min + v84 * v82;
        local v86 = v85 - v83 * v84;
        local v87 = v85 + v83 * (1 - v84);
        if v86 < 0 then
            v87 = v87 + (0 - v86);
            v86 = 0;
        elseif v87 > 4294967296 then
            v86 = v86 - (v87 - 4294967296);
            v87 = 4294967296;
        end;
        v86 = math.clamp(v86, 0, 4294967296);
        v87 = math.clamp(v87, 0, 4294967296);
        v48.SetXRange(NumberRange.new(v86, v87));
    end, {
        v60, 
        v48.PlotAbsoluteSize, 
        v52, 
        v48.XRange, 
        v48.SetXRange
    });
    local v89 = l_useMemo_0(function() --[[ Line: 307 ]]
        -- upvalues: v24 (ref), v60 (copy), l_PlotAbsoluteSize_0 (copy)
        return (v24(v60, l_PlotAbsoluteSize_0));
    end, {
        v48.PlotAbsoluteSize, 
        v60
    });
    local v97 = l_useMemo_0(function() --[[ Line: 311 ]]
        -- upvalues: v54 (copy), v56 (copy), v58 (copy), v47 (ref), l_CurveHook_0 (copy), v60 (copy), l_PlotAbsoluteSize_0 (copy), v52 (copy), v33 (ref), v2 (ref), v9 (ref), v62 (copy), v64 (copy), v65 (copy), v68 (copy), v70 (copy), v80 (copy)
        local v90 = {};
        local v91 = v54 and not v56 and not v58;
        local v92 = v47(l_CurveHook_0, v60, l_PlotAbsoluteSize_0, if v91 then v52 else nil);
        v92.Curve = v33(l_CurveHook_0, v60, l_PlotAbsoluteSize_0);
        v90.Curves = v2.createElement("CanvasGroup", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v92);
        if v91 then
            v90.GhostPoint = v2.createElement("ImageLabel", {
                Position = UDim2.fromOffset(v52.X, v52.Y), 
                [v2.Tag] = "GhostPoint"
            });
        end;
        for v93, v94 in l_CurveHook_0.keypoints do
            local v95 = "Keypoint_" .. v93;
            local v96 = v93 == l_CurveHook_0.selectedIndex;
            v90[v95] = v2.createElement(v9, {
                Position = v94, 
                PlotRect = v60, 
                Selected = v96, 
                IsDragging = v58 and v96, 
                OnHoverStart = function() --[[ Line: 342 ]] --[[ Name: OnHoverStart ]]
                    -- upvalues: v62 (ref), v93 (copy)
                    v62(v93);
                end, 
                OnHoverEnd = function() --[[ Line: 345 ]] --[[ Name: OnHoverEnd ]]
                    -- upvalues: v64 (ref), v93 (copy)
                    v64(v93);
                end, 
                OnDragStart = v65, 
                OnMoved = v68, 
                OnDragEnd = v70, 
                OnRightClick = v80
            });
        end;
        return v90;
    end, {
        l_CurveHook_0, 
        v60, 
        v48.PlotAbsoluteSize, 
        v58, 
        v52, 
        v54, 
        v56
    });
    return v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 1, -0), 
        [v2.Tag] = "Contrast X-Clip", 
        [v2.Event.InputChanged] = function(_, v99) --[[ Line: 364 ]]
            -- upvalues: v88 (copy)
            if v99.UserInputType == Enum.UserInputType.MouseWheel then
                v88(v99.Position.Z);
            end;
        end
    }, {
        CurveContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 50, 0, 50), 
            Size = UDim2.new(1, -100, 1, -100), 
            BackgroundTransparency = 1, 
            ForwardRef = v49, 
            [v2.Change.AbsoluteSize] = v48.OnSizeChanged, 
            [v2.Event.InputBegan] = function(_, v101) --[[ Line: 380 ]]
                -- upvalues: v79 (copy), v71 (copy)
                if v101.UserInputType == Enum.UserInputType.MouseButton1 then
                    v79(v101);
                end;
                if v101.UserInputType == Enum.UserInputType.MouseMovement then
                    v71();
                end;
            end, 
            [v2.Event.InputChanged] = function(_, v103) --[[ Line: 388 ]]
                -- upvalues: v75 (copy)
                if v103.UserInputType == Enum.UserInputType.MouseMovement then
                    v75(v103);
                end;
            end, 
            [v2.Event.InputEnded] = function(_, v105) --[[ Line: 393 ]]
                -- upvalues: v72 (copy)
                if v105.UserInputType == Enum.UserInputType.MouseMovement then
                    v72();
                end;
            end
        }, v97), 
        GridLineContainer = v2.createElement(l_Pane_0, {
            Active = true, 
            LayoutOrder = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v89)
    });
end;