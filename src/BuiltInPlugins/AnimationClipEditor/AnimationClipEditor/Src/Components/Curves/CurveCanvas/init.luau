local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Curves.Line);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Curves.Cubic);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Curves.Keyframe);
local v9 = require(l_script_FirstAncestor_0.Src.Components.Curves.TangentControl);
local v10 = v1.PureComponent:extend("CurveCanvas");
v10.init = function(v11) --[[ Line: 75 ]] --[[ Name: init ]]
    v11.children = {};
end;
v10.renderXAxis = function(v12) --[[ Line: 79 ]] --[[ Name: renderXAxis ]]
    -- upvalues: v1 (copy)
    local l_Stylizer_0 = v12.props.Stylizer;
    local v14 = v12:toCanvasSpace(Vector2.new());
    table.insert(v12.children, v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 0, v14.Y), 
        BackgroundColor3 = l_Stylizer_0.curveTheme.xAxis, 
        BorderSizePixel = 0
    }));
end;
v10.toCanvasSpace = function(v15, v16) --[[ Line: 97 ]] --[[ Name: toCanvasSpace ]]
    -- upvalues: v4 (copy)
    local l_props_0 = v15.props;
    local l_MinValue_0 = l_props_0.MinValue;
    local l_MaxValue_0 = l_props_0.MaxValue;
    local l_VerticalScroll_0 = l_props_0.VerticalScroll;
    local v21 = math.min(l_props_0.VerticalZoom, 0.99);
    local v22 = 1 / (1 - v21);
    local v23 = (v16.X - l_props_0.StartTick) * l_props_0.AbsoluteSize.X / (l_props_0.EndTick - l_props_0.StartTick);
    local v24 = ((l_MaxValue_0 - v16.Y) / (l_MaxValue_0 - l_MinValue_0) - l_VerticalScroll_0 * v21) * v22;
    v24 = l_props_0.AbsoluteSize.Y * v4.CURVE_CANVAS_PADDING + v24 * l_props_0.AbsoluteSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING);
    return Vector2.new(v23, v24);
end;
v10.scaleSlope = function(v25, v26) --[[ Line: 116 ]] --[[ Name: scaleSlope ]]
    -- upvalues: v4 (copy)
    local l_props_1 = v25.props;
    local v28 = l_props_1.MinValue - l_props_1.MaxValue;
    local v29 = 1 - math.min(l_props_1.VerticalZoom, 0.99);
    local v30 = l_props_1.AbsoluteSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING);
    local v31 = (l_props_1.EndTick - l_props_1.StartTick) / l_props_1.AbsoluteSize.X;
    local v32 = v28 * v29 / v30;
    return v26 * v31 / v32;
end;
v10.renderCurve = function(v33, v34) --[[ Line: 130 ]] --[[ Name: renderCurve ]]
    -- upvalues: v4 (copy), v5 (copy), v1 (copy), v8 (copy), v6 (copy), v7 (copy), v9 (copy)
    local l_props_2 = v33.props;
    local l_Stylizer_1 = l_props_2.Stylizer;
    if not v34.Keyframes then
        return;
    else
        local v37 = v34.Path[#v34.Path];
        local v38 = table.concat(v34.Path, "_");
        local v39 = v4.TRACK_THEME_MAPPING[v34.Type] and v4.TRACK_THEME_MAPPING[v34.Type][v37] or "Default";
        local v40 = l_Stylizer_1.curveTheme[v39];
        local v41 = nil;
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        local v45 = nil;
        local v46 = nil;
        local v47 = l_props_2.AbsoluteSize.Y * v4.TANGENT_CONTROL_LENGTH;
        local l_SelectedKeyframes_0 = l_props_2.SelectedKeyframes;
        local l_ShowTooltips_0 = l_props_2.ShowTooltips;
        local l_Playhead_0 = v33.props.Playhead;
        local v51 = v5.getValue(v34, l_Playhead_0);
        if v34.Type == v4.TRACK_TYPES.Facs then
            v51 = math.clamp(v51, 0, 1);
        end;
        local v52 = v33:toCanvasSpace(Vector2.new(l_Playhead_0, v51));
        local v53 = string.format("%s_Scrubber", v38);
        v33.children[v53] = v1.createElement(v8, {
            Position = v52, 
            TrackName = "", 
            InterpolationMode = Enum.KeyInterpolationMode.Linear, 
            LeftSlope = nil, 
            LeftAuto = false, 
            RightSlope = nil, 
            RightAuto = false, 
            Color = l_Stylizer_1.scrubberTheme.backgroundColor, 
            ShowSlopes = false, 
            Width = v4.SCRUBBER_MARKER_WIDTH
        });
        local v54 = l_SelectedKeyframes_0[v34.Instance];
        for _, v56 in ipairs(v34.Path) do
            if v54 then
                v54 = v54.Components and v54.Components[v56] or v54[v56];
            else
                break;
            end;
        end;
        local v57 = nil;
        local v58 = nil;
        if v34.Type == v4.TRACK_TYPES.Facs then
            v57 = v33:toCanvasSpace(Vector2.new(0, 1)).Y;
            v58 = v33:toCanvasSpace(Vector2.new(0, 0)).Y;
        end;
        for v59, v60 in ipairs(v34.Keyframes) do
            local v61 = v34.Data[v60];
            if v61 ~= nil then
                local v62 = v54 and v54.Selection and v54.Selection[v60];
                if v34.Type == v4.TRACK_TYPES.Quaternion then
                    v41 = v33:toCanvasSpace(Vector2.new(v60, 1));
                    v42 = v33:toCanvasSpace(Vector2.new(v60, 0));
                else
                    v41 = v33:toCanvasSpace(Vector2.new(v60, v61.Value));
                end;
                local v63 = v46 or v62 and v45 and v45.InterpolationMode ~= Enum.KeyInterpolationMode.Constant;
                local v64 = v63 and l_Stylizer_1.curveTheme.selected or v40;
                local v65 = string.format("%s_Curve_%d", v38, v59);
                if l_props_2.StartTick <= v60 and (not v44 or v44 <= l_props_2.EndTick) then
                    if v45 and v43 then
                        if v45.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                            v33.children[v65] = v1.createElement(v6, {
                                A = v43, 
                                B = Vector2.new(v41.X, v43.Y), 
                                Color = v64, 
                                Width = if v63 then v4.CURVE_WIDTH_SELECTED else v4.CURVE_WIDTH, 
                                ZIndex = 2
                            });
                        elseif v45.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                            v33.children[v65] = v1.createElement(v6, {
                                A = v43, 
                                B = v41, 
                                Color = v64, 
                                Width = if v63 then v4.CURVE_WIDTH_SELECTED else v4.CURVE_WIDTH, 
                                ZIndex = 2
                            });
                        else
                            local _, v67 = v5.getSlopes(v34, v44);
                            local v68, _ = v5.getSlopes(v34, v60);
                            if v67 then
                                v67 = v33:scaleSlope(v67);
                            end;
                            if v68 then
                                v68 = v33:scaleSlope(v68);
                            end;
                            v33.children[v65] = v1.createElement(v7, {
                                A = v43, 
                                ASlope = v67, 
                                B = v41, 
                                BSlope = v68, 
                                Color = v64, 
                                Width = if v63 then v4.CURVE_WIDTH_SELECTED else v4.CURVE_WIDTH, 
                                FrameWidth = l_props_2.AbsoluteSize.X, 
                                ZIndex = 2, 
                                MinClamp = v57, 
                                MaxClamp = v58
                            });
                        end;
                    end;
                    local v70 = string.format("%s_Keyframe_%d", v38, v59);
                    if v34.Type ~= v4.TRACK_TYPES.Quaternion or v59 > 1 then
                        v33.children[v70] = v1.createElement(v8, {
                            Position = v41, 
                            Path = v34.Path, 
                            InterpolationMode = v61.InterpolationMode, 
                            PrevInterpolationMode = if v45 then v45.InterpolationMode else nil, 
                            LeftSlope = if v59 == 1 then nil else v61.LeftSlope, 
                            RightSlope = if v59 == #v34.Keyframes then nil else v61.RightSlope, 
                            Color = v40, 
                            ShowSlopes = false, 
                            ShowTooltip = l_ShowTooltips_0, 
                            Selected = v62, 
                            ZIndex = 4, 
                            OnRightClick = l_props_2.OnKeyRightClick and function(_, _) --[[ Line: 272 ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v62 (copy)
                                l_props_2.OnKeyRightClick(v34.Instance, v34.Path, v60, v62);
                            end or nil, 
                            OnInputBegan = l_props_2.OnKeyInputBegan and function(_, v74) --[[ Line: 277 ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v62 (copy)
                                l_props_2.OnKeyInputBegan(v34.Instance, v34.Path, v60, v62, v74);
                            end or nil, 
                            OnInputEnded = l_props_2.OnKeyInputEnded and function(_, v76) --[[ Line: 282 ]]
                                -- upvalues: l_props_2 (copy), v60 (copy), v61 (copy), v62 (copy)
                                l_props_2.OnKeyInputEnded(v60, v61.Value, v62, v76);
                            end or nil
                        });
                    end;
                    if v59 < #v34.Keyframes and v34.Type == v4.TRACK_TYPES.Quaternion then
                        v33.children[v70 .. "b"] = v1.createElement(v8, {
                            Position = v42, 
                            Path = v34.Path, 
                            InterpolationMode = v61.InterpolationMode, 
                            PrevInterpolationMode = if v45 then v45.InterpolationMode else nil, 
                            LeftSlope = if v59 == 1 then nil else v61.LeftSlope, 
                            RightSlope = if v59 == #v34.Keyframes then nil else v61.RightSlope, 
                            Color = v40, 
                            ShowSlopes = false, 
                            ShowTooltip = l_ShowTooltips_0, 
                            Selected = v62, 
                            ZIndex = 4, 
                            OnRightClick = l_props_2.OnKeyRightClick and function(_, _) --[[ Line: 304 ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v62 (copy)
                                l_props_2.OnKeyRightClick(v34.Instance, v34.Path, v60, v62);
                            end or nil, 
                            OnInputBegan = l_props_2.OnKeyInputBegan and function(_, v80) --[[ Line: 309 ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v62 (copy)
                                l_props_2.OnKeyInputBegan(v34.Instance, v34.Path, v60, v62, v80);
                            end or nil, 
                            OnInputEnded = l_props_2.OnKeyInputEnded and function(_, v82) --[[ Line: 314 ]]
                                -- upvalues: l_props_2 (copy), v60 (copy), v61 (copy), v62 (copy)
                                l_props_2.OnKeyInputEnded(v60, v61.Value, v62, v82);
                            end or nil
                        });
                    end;
                    if v62 then
                        if v59 > 1 then
                            local v83 = v33:scaleSlope(v5.getSlope(v34, v60, v4.SLOPES.Left));
                            local v84 = string.format("%s_LeftTangent_%d", v38, v59);
                            v33.children[v84] = v1.createElement(v9, {
                                Position = UDim2.new(0, v41.X, 0, v41.Y), 
                                Slope = v83, 
                                Auto = v45 and v45.InterpolationMode ~= Enum.KeyInterpolationMode.Cubic or v61.LeftSlope == nil, 
                                Length = v47, 
                                Side = v4.SLOPES.Left, 
                                ZIndex = 3, 
                                OnRightClick = l_props_2.OnTangentRightClick and function(_, _) --[[ Line: 334 ]]
                                    -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v4 (ref)
                                    l_props_2.OnTangentRightClick(v34.Instance, v34.Path, v60, v4.SLOPES.Left);
                                end or nil, 
                                OnInputBegan = function(_, v88) --[[ Line: 338 ]] --[[ Name: OnInputBegan ]]
                                    -- upvalues: l_props_2 (copy)
                                    l_props_2.OnTangentInputBegan(v88);
                                end, 
                                OnInputEnded = function(_, v90) --[[ Line: 341 ]] --[[ Name: OnInputEnded ]]
                                    -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v4 (ref)
                                    l_props_2.OnTangentInputEnded(v34.Instance, v34.Path, v60, v4.SLOPES.Left, v90);
                                end
                            });
                        end;
                        if v59 < #v34.Keyframes then
                            local v91 = v33:scaleSlope(v5.getSlope(v34, v60, v4.SLOPES.Right));
                            local v92 = nil;
                            v92 = if v34.Type == v4.TRACK_TYPES.Quaternion then UDim2.new(0, v42.X, 0, v42.Y) else UDim2.new(0, v41.X, 0, v41.Y);
                            local v93 = string.format("%s_RightTangent_%d", v38, v59);
                            local l_children_0 = v33.children;
                            local l_createElement_0 = v1.createElement;
                            local l_v9_0 = v9;
                            local v97 = {
                                Position = v92, 
                                Slope = v91
                            };
                            local v98 = true;
                            if v61.InterpolationMode == Enum.KeyInterpolationMode.Cubic then
                                v98 = v61.RightSlope == nil;
                            end;
                            v97.Auto = v98;
                            v97.Length = v47;
                            v97.Side = v4.SLOPES.Right;
                            v97.ZIndex = 3;
                            v97.OnRightClick = l_props_2.OnTangentRightClick and function(_, _) --[[ Line: 365 ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v4 (ref)
                                l_props_2.OnTangentRightClick(v34.Instance, v34.Path, v60, v4.SLOPES.Right);
                            end or nil;
                            v97.OnInputBegan = function(_, v102) --[[ Line: 369 ]] --[[ Name: OnInputBegan ]]
                                -- upvalues: l_props_2 (copy)
                                l_props_2.OnTangentInputBegan(v102);
                            end;
                            v97.OnInputEnded = function(_, v104) --[[ Line: 372 ]] --[[ Name: OnInputEnded ]]
                                -- upvalues: l_props_2 (copy), v34 (copy), v60 (copy), v4 (ref)
                                l_props_2.OnTangentInputEnded(v34.Instance, v34.Path, v60, v4.SLOPES.Right, v104);
                            end;
                            l_children_0[v93] = l_createElement_0(l_v9_0, v97);
                        end;
                    end;
                end;
                v43 = if v34.Type == v4.TRACK_TYPES.Quaternion then v42 else v41;
                v44 = v60;
                v45 = v61;
                v46 = v62;
            end;
        end;
        return;
    end;
end;
v10.render = function(v105) --[[ Line: 398 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_3 = v105.props;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Position_0 = l_props_3.Position;
    local l_Size_0 = l_props_3.Size;
    local l_Tracks_0 = l_props_3.Tracks;
    v105.children = {};
    v105:renderXAxis();
    for _, v112 in ipairs(l_Tracks_0) do
        v105:renderCurve(v112);
    end;
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v105.children);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));